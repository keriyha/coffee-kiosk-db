
# ☕ Coffee Kiosk Database (SQL Server)

### 📊 Mini Data Warehouse Project by Younan Kadidiatou Voli Lou

A simple but efficient SQL Server database project that models a **coffee kiosk**.  
It tracks customers, products, orders, and payments while providing analytics views and quality checks.

Built as a compact end-to-end portfolio project demonstrating:
- Relational database design (5 core tables + relationships)
- Stored procedure (`usp_place_order`) using table-valued parameters
- Computed columns, foreign keys, and data validation
- Analytics views (daily sales, top products, gross margin)
- Data-quality verification scripts

☕ 5-Minute Quickstart

Follow these simple steps to install and run the Coffee Kiosk Database project in SQL Server.

🧩 Requirements
- Microsoft SQL Server 2019 or later (or Azure SQL)
- SQL Server Management Studio (SSMS)
- Basic knowledge of executing `.sql` scripts
---
### ⚙️ Step 1: Clone the Repository
```bash
git clone https://github.com/keriyha/coffee-kiosk-db.git
cd coffee-kiosk-db

### 📂 Step 2: Run the Scripts in Order

1. `01_schema_tables_constraints.sql` – creates the database, schema, tables, primary keys, and indexes.  
2. `02_seed_data.sql` – inserts sample records into all tables.  
3. `03_views_analytics.sql` – builds reporting and analytics views.  
4. `04_procs_usp_place_order.sql` – adds stored procedure for order placement simulation.  
5. `05_quality_checks.sql` – runs data validation checks to ensure accuracy.  
6. `06_sample_queries.sql` – explore data with example queries.

### 📊 Step 3: Explore the Data

SELECT TOP 5 * FROM ck.vw_daily_sales ORDER BY order_date DESC;
SELECT TOP 5 * FROM ck.vw_top_products ORDER BY revenue DESC;
SELECT * FROM ck.vw_margin ORDER BY gross_margin DESC;

erDiagram
    CUSTOMER ||--o{ ORDERS : places
    ORDERS   ||--|{ ORDER_ITEM : contains
    PRODUCT  ||--o{ ORDER_ITEM : appears_in
    ORDERS   ||--o| PAYMENT : is_paid_by

    CUSTOMER {
      int customer_id PK
      string name
      string email
      date sign_up_date
    }

    PRODUCT {
      int product_id PK
      string name
      string category
      float unit_cost
      float unit_price
      bool is_active
    }

    ORDERS {
      int order_id PK
      int customer_id FK
      date order_date
      string status
    }

    ORDER_ITEM {
      int order_item_id PK
      int order_id FK
      int product_id FK
      int quantity
      float unit_price
      float line_subtotal
    }

    PAYMENT {
      int payment_id PK
      int order_id FK
      float amount
      string method
      datetime paid_at
    }
