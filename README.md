# Cosmetics_Sales_Analyis



# 💄 **Cosmetics Sales Analysis Project**

## 🧠 **Project Overview**
This project presents an end-to-end **Cosmetics Sales Analysis** workflow, starting from designing and populating a relational **MySQL database**, conducting **SQL-based data analysis**, and building **interactive Power BI dashboards**.  

The goal is to gain actionable insights into sales performance, product profitability, customer behavior, and store efficiency — helping business stakeholders make data-driven decisions.

---

## ⚙️ **Project Workflow**

### **1. Database Design & Creation**
The database was designed in **MySQL** with multiple related tables:
- **customers** – customer demographics and city  
- **stores** – store names and locations  
- **sales** – transaction headers including store, customer, and payment method  
- **sale_details** – detailed line items (quantity, price, discount)  
- **products** – product details, category, brand, and original cost  
- **promotions** – discount percentages applied per product  

All relationships were defined via foreign keys, enabling efficient joins and aggregations.

---

### **2. Data Insertion**
Synthetic data was generated and inserted into the database to simulate real business transactions for over **100 records per table**  

---

### **3. SQL Data Analysis**
SQL queries were developed to answer key **business questions** (see `Business Questions.pdf`) and extract insights.  

---

### **4. Power BI Dashboards**
Two interactive dashboards were created in **Power BI** to visualize findings:

#### 📊 **Dashboard  – Sales & Revenue Overview**
 
#### [🔗 View Interactive Power BI Dashboard] (https://app.powerbi.com/reportEmbed?reportId=6aea8e51-8cc6-4445-96e5-36b0924f275a&autoAuth=true&ctid=f349c2fd-fc94-4893-abe4-cfbe7ed52842)
---

## 📈 **Key Insights**
1. **Top 5 Brands by Revenue:**  
   PureGlow, SilkShine, NailArt, AromaEssence, LuxeBeauty  
2. **Best-Selling Products:**  
   Volume Hair Serum, Hair Mask, Hand Cream, Repair Shampoo, Repair Mask  
3. **Highest-Profit Margin Products:**  
   Repair Hair Mask (VitaSkin), Body Scrub (BodyBliss), Volume Serum (SilkShine)  
4. **Best Customers:**  
   Mona Ali, Nadia Osman, Yasmin Ali, Ibrahim Abdel, Nabil Shalaby  
5. **Top Cities by Revenue:**  
   Suez, Qena, Port Said, Tanta, Zagazig  
6. **Preferred Payment Methods:**  
   Online and Credit Card lead in total revenue  
7. **Best Months for Promotions:**  
   August and September (pre-holiday sales surge)  

---

## 🧮 **Technical Stack**
- **Database:** MySQL  
- **Data Analysis:** SQL (Joins, Views, Aggregates, Window Functions)  
- **Visualization:** Power BI  
  

---

## 🗂️ **Project Files**
| File | Description |
|------|--------------|
| `cosmetics_sales_analysis.sql` | SQL script for database creation, views, and analysis queries |
| `Business Questions.pdf` | Core business questions answered using SQL |
| `Cosmetics_Sales_Analysis_Professional_Report.pdf` | Executive report with insights and recommendations |
| `Power BI Dashboards (.pbix)` | Interactive dashboards for visualization |

---

## 🏁 **Conclusion**
This project demonstrates a complete **data analytics pipeline** — from database creation to business insights.  
By leveraging SQL for analysis and Power BI for visualization, the cosmetics company can now make **evidence-based decisions** to improve marketing, product focus, and regional performance.
