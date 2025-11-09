# ☕ Coffee Kiosk Database & Analytics Dashboard

### 📘 Project Overview
The **Coffee Kiosk Database** project demonstrates end-to-end data design, modeling, and analysis using **SQL Server** and **Power BI**.  
It simulates a real-world coffee shop’s data environment — tracking customers, products, orders, and profitability — to support analytics and business decision-making.

---

## 🚀 5-Minute Quickstart

### 🧩 Step 1: Clone the Repository
```bash
git clone https://github.com/keriyha/coffee-kiosk-db.git
cd coffee-kiosk-db

🧱 Step 2: Run SQL Scripts in Order

Open SQL Server Management Studio (SSMS) and execute the scripts in this order:

01_create_database.sql – Create the CoffeeKioskDB database

02_create_schema_and_tables.sql – Create ck schema, tables, primary keys, and indexes

03_insert_seed_data.sql – Insert sample data for customers, products, stores, and orders

04_create_views.sql – Create analytical views (ck.vw_daily_sales, ck.vw_top_products, ck.vw_margin)

⚙️ If you see an error such as “Invalid object name 'vw_daily_sales'”, ensure you reference it as ck.vw_daily_sales.

📊 Step 3: Explore the Data
Use simple queries to verify that everything is working:

SELECT TOP 5 * FROM ck.vw_daily_sales ORDER BY order_date DESC;
SELECT TOP 5 * FROM ck.vw_top_products ORDER BY total_revenue DESC;
SELECT TOP 5 * FROM ck.vw_margin ORDER BY margin DESC;

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

Together, they create a full business view:
When sales occur → What drives them → Where profit is highest.

🎨 Step 4: Power BI Visualization
Connect Power BI to SQL Server

Home → Get Data → SQL Server

Server: localhost 

Database: CoffeeKioskDB

Select your ck views and Load

Export Images

After formatting your visuals:
File → Export → Export as Image (PNG) and save them to /docs:

docs/daily_sales.png

docs/top_products.png

docs/gross_margin.png

#### 🕒 Daily Sales Trend
![Daily Sales Chart](docs/daily_sales.png)

#### ☕ Top Products by Revenue
![Top Products Chart](docs/top_products.png)

#### 📊 Gross Margin by Category
![Gross Margin Chart](docs/gross_margin.png)


🧠 Tools & Technologies

Microsoft SQL Server – Database design and T-SQL queries

Power BI Desktop – Data visualization and insights

GitHub – Version control and portfolio showcase

coffee-kiosk-db/
│
├── docs/
│   ├── daily_sales.png
│   ├── top_products.png
│   ├── gross_margin.png
│   └── Coffee_Kiosk_Dashboard.pbix
│
├── sql/
│   ├── 01_create_database.sql
│   ├── 02_create_schema_and_tables.sql
│   ├── 03_insert_seed_data.sql
│   └── 04_create_views.sql
│
└── README.md

