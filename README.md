☕ CoffeeKiosk — SQL Analytics & Data Quality Project
A Production-Style SQL System for Orders, Payments, KPIs & Data Validation

The CoffeeKiosk project simulates a real point-of-sale system for a coffee shop.
It includes a complete relational database, data quality checks, analytic views, KPIs, and a stored procedure for placing orders — all built using SQL Server.

This project demonstrates real-world skills for SQL Developer, Database Administrator, BI Analyst, and Data Engineer roles.
🚀 Features
✅ 1. Full OLTP Database Schema

Customers

Products

Orders

Order Items

Payments

Business rules using:

Primary & foreign keys

Check constraints

Identity auto-increment keys

Default values

Indexes for performance

✅ 2. Seed Data for Testing

Sample customers, products, and multiple example orders to simulate real operations.

✅ 3. Analytics Views

Daily Sales

Top Products by Revenue & Units

Gross Margin per Product

Customer Lifetime Value (LTV)

These views support dashboards and reporting tools like Power BI or Tableau.

✅ 4. Stored Procedure — usp_place_order

A production-style procedure using a Table-Valued Parameter (TVP) for multi-item orders:

Validates customer

Inserts order & items

Calculates payment automatically

Supports completed or pending orders

Returns the new order ID

This is the exact pattern used in enterprise POS systems.

✅ 5. Automated Data Quality Checks

Checks for:

Orphaned records

Negative prices

Orders completed without payment

Schema verification

Integrity validation

✅ 6. KPI & Validation Views

A full monitoring layer for dashboards:

vw_validation_summary (all quality checks in one place)

vw_kpi_snapshot (quick summary of business KPIs)

vw_kpi_avg_revenue_per_day (daily revenue trends)

📂 Project Structure
CoffeeKiosk/
│── 01_ddl_create.sql
│── 02_seed_data.sql
│── 03_views.sql
│── 04_proc_place_order.sql
│── 05_quality_checks.sql
│── 06_examples.sql
│── 05_data_validation_and_kpi.sql
│── README.md  ← you're here

📊 KPIs Included
Business KPIs

Total orders

Total customers

Completed vs pending orders

Daily revenue

Average ticket size

Top-selling products

Gross margin

Customer lifetime value

Data Quality KPIs

Orphan items

Missing payments

Invalid prices

Integrity mismatches

These make the project suitable for monitoring dashboards.

🧪 How to Run
1. Create the database & tables
RUN 01_ddl_create.sql

2. Insert sample data
RUN 02_seed_data.sql

3. Create analytic views
RUN 03_views.sql

4. Create the order placement procedure
RUN 04_proc_place_order.sql

5. Run data quality checks
RUN 05_quality_checks.sql

6. Run KPIs
RUN 05_data_validation_and_kpi.sql


(Optional)
Import the tables and views into Power BI for visualization.

🎯 Skills Demonstrated
Database Design

Normalized tables

Schema separation

Constraints & business rules

Index optimization

SQL Development

Stored procedures

Table-valued parameters (TVP)

Computed columns

Joins & aggregations

Views for analytics

Data Engineering / Governance

Data quality validation

Integrity checks

Orphan detection

KPI monitoring

Business Analytics

Revenue KPIs

Margins

Product performance

Customer behavior

📈 Future Enhancements (optional)

Add Power BI dashboard

Add unit tests for procedures

Add triggers for data auditing

Add incremental ETL load scripts

Add star-schema version for analytics

🙌 Author

(Younan Kadidiatou Voli-Lou)
SQL Developer • Data Analyst • Database Administrator Candidate

