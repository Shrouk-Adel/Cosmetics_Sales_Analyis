use cosmetics_sales_db;

-- get product sales details with customer name 
create view product_sales as 
select 
c.first_name
,c.city as customer_city
, s.store_name,
s.city as store_city,
sal.payment_method,
sd.quantity,
p.original_price,
sd.unit_price as unit_sal_price,
(sd.unit_price * sd.quantity) as total_price,
pm.discount_percent,
round((sd.unit_price * sd.quantity *(1- pm.discount_percent/100)),2) as total_price_after_pm,
sd.quantity* p.original_price as  total_org_cost,

sal.sale_datetime,
p.product_name,
p.category,p.brand

from sales as sal join customers as c on sal.customer_id = c.customer_id
join stores as s on sal.store_id = s.store_id
join sale_details as sd on sal.sale_id =sd.sale_id 
join products as p on p.product_id = sd.product_id
join promotions as pm on pm.product_id = p.product_id


-- get all data from product_sales view 

select * from product_sales;

-- Top 5 Products by sales 
select  p.product_name ,sum(round((sd.unit_price * sd.quantity *(1- pm.discount_percent/100)),2)) as total_price_after_pm
from products as p
join sale_details as sd
on sd.product_id = p.product_id
join promotions as pm on pm.product_id = sd.product_id
group by p.product_name
order by total_price_after_pm desc
limit 5

-- Top 5 sales by brand
select  p.brand ,sum(round((sd.unit_price * sd.quantity *(1- pm.discount_percent/100)),2)) as total_price_after_pm
from products as p
join sale_details as sd
on sd.product_id = p.product_id
join promotions as pm on pm.product_id = p.product_id
group by p.brand
order by total_price_after_pm desc
limit 5

-- Top 5 cutomers by salse
select   
concat(c.first_name," ",c.last_name) as full_name,
sum(round((sd.unit_price * sd.quantity *(1- pm.discount_percent/100)),2)) as total_price_after_pm

from customers as c join sales as s  on s.customer_id = c.customer_id
join sale_details  as sd on sd.sale_id = s.sale_id
join promotions as pm  on pm.product_id = sd.product_id
group by c.first_name,c.last_name
order by total_price_after_pm desc
limit 5

-- total revenue : revenue =sum(Selling Price per Unit × Quantity Sold)
-- Total Profit : Revenue - Revenue − (orinigl cost)

select sum(ps.total_price_after_pm) as Revenue , sum(ps.total_price_after_pm) - sum(ps.original_price * ps.quantity) as Profit
from product_sales as ps

-- Top 5 cities with and store name by Revenue
select  distinct ps.store_city, ps.store_name ,sum(ps.total_price_after_pm) as total_sales
from product_sales as ps 
group by ps.store_city,ps.store_name
order by total_sales desc
limit 5


-- total margin 
-- Margin (%)= ( Profit / Revenue )× 100
create view product_sales_measures as 
select 
*,
ps.total_price_after_pm as Revenue , 
ps.total_price_after_pm - (ps.original_price * ps.quantity) as Profit,
round((ps.total_price_after_pm - (ps.original_price * ps.quantity)) / ps.total_price_after_pm * 100,2) as Margin

from product_sales as ps


select * from product_sales_measures
 
-- get the highest and lowes products name by margin 
-- high margin == more profitable 

select  m.product_name ,m.brand, m.unit_sal_price ,m.Margin
from product_sales_measures as m 
order by Margin asc
limit 5

select  m.product_name ,m.brand
from product_sales_measures as m 
order by Margin desc
limit 5


-- Monthly sales trend 
select 
date_format(m.sale_datetime,'%Y-%M') as month,
sum(m.total_price_after_pm) as total_sal
from product_sales_measures as m 
group by month
order by total_sal desc




