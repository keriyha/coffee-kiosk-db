# ☕ Coffee Kiosk Database & Dashboard

### 📘 Project Overview
The **Coffee Kiosk Database** project demonstrates end-to-end data design, modeling, and analysis using **SQL Server** and **Power BI**.  
It simulates a real-world coffee shop’s data environment — tracking customers, products, orders, and profitability — to support analytics and business decision-making.

---

## 🚀 5-Minute Quickstart

### 🧩 Step 1 — Clone the Repository
```bash
git clone https://github.com/keriyha/coffee-kiosk-db.git
cd coffee-kiosk-db

🧱 Step 2 — Run SQL Scripts in Order

Open SQL Server Management Studio (SSMS) and execute the scripts in this order:

01_schema_tables_constraints.sql – Create the CoffeeKioskDB database,ck schema, tables, primary keys, and indexes

02_coffee_seed_data.sql –  Insert sample data for customers, products, stores, and orders

03_view_analytics.sql – Create analytical views (ck.vw_daily_sales, ck.vw_top_products, ck.vw_margin)

04_coffee_proc_place_oreder.sql 

⚙️ If you see an error such as “Invalid object name 'vw_daily_sales’”, ensure you reference it as ck.vw_daily_sales.

📊 Step 3 — Explore the Data

Use simple queries to verify that everything is working:

SELECT TOP 5 * FROM ck.vw_daily_sales ORDER BY order_date DESC;
SELECT TOP 5 * FROM ck.vw_top_products ORDER BY total_revenue DESC;
SELECT TOP 5 * FROM ck.vw_margin ORDER BY margin DESC;

![vw_daily_sales](https://github.com/user-attachments/assets/3cc279d0-aaad-496f-83c6-1f2fcfe3a740)
![vw_top_products](https://github.com/user-attachments/assets/05b91357-bfc3-4ba0-9bb7-ae69a12009f2)
![vw_margin](https://github.com/user-attachments/assets/6a8c05fe-c10a-407b-a8f6-e607d223b279)

📈 Dashboard Insights Overview

The Coffee Kiosk Analytics Dashboard translates SQL data into clear business insights.
It contains three connected visuals that together explain sales trends, product performance, and profitability.

1️⃣ Daily Sales Trend

Purpose: Track total revenue over time to identify performance patterns.
Relationship: Sets the time context for other charts — shows when business activity changes.

2️⃣ Top Products by Revenue

Purpose: Identify best-selling products driving revenue.
Relationship: Explains the peaks seen in the sales trend.

3️⃣ Gross Margin by Category

Purpose: Compare profitability across product categories.
Relationship: Completes the story — links revenue and product mix to profitability.

👉 Together they create a full business view:
When sales occur → What drives them → Where profit is highest.

🎨 Step 4 — Power BI Visualization
🔗 Connect Power BI to SQL Server

Home → SQL Server → Get Data

Server: localhost

Database: CoffeeKioskDB

Select your ck views and Load

🖼️ Export Images & Dashboard Files

After formatting your visuals:
File → Export → Export as Image (PNG) and save them to /docs/screenshots/.

📊 Power BI Dashboards

Below are the main visuals created from the Coffee Kiosk database:

🕒 Daily Sales Trend

☕ Top Products by Revenue

📈 Gross Margin by Category

💾 You can also download and explore the full Power BI report:
Coffee_Kiosk_Dashboard.pbix

🧠 Tools & Technologies

Microsoft SQL Server – Database design & T-SQL queries

Power BI Desktop – Data visualization & insights

GitHub – Version control & portfolio showcase

coffee-kiosk-db/
│
├── docs/
│   └── screenshots/
│       ├── daily_sales.png
│       ├── top_products.png
│       ├── gross_margin.png
│       └── Coffee_Kiosk_Dashboard.pbix
│
├── sql/
│   ├── 01_schema_tables_constraints.sql
│   ├── 02_coffee_seed_data.sql
│   ├── 03_view_analytics.sql
│   └── 04_coffee_proc_place_orders.sql
│
└── README.md

💬 Credits & Contact

👤 Younan Kadidatou Voli Lou
🎓 MBA in Business Analytics | B.S. in Computer Science | Bilingual (EN/FR)
 | GitHub

© 2025 Younan Kadidatou Voli Lou | Coffee Kiosk DB Project | All Rights Reserved


