
# ☕ Coffee Kiosk Database (SQL Server)

### 📊 Mini Data Warehouse Project for Portfolio — by [Your Name]

A simple but efficient SQL Server database project that models a **coffee kiosk**.  
It tracks customers, products, orders, and payments while providing analytics views and quality checks.

Built as a compact end-to-end portfolio project demonstrating:
- Relational database design (5 core tables + relationships)
- Stored procedure (`usp_place_order`) using table-valued parameters
- Computed columns, foreign keys, and data validation
- Analytics views (daily sales, top products, gross margin)
- Data-quality verification scripts
- Modular SQL scripts suitable for GitHub presentation

---

## 🧩 Entity-Relationship Diagram (ERD)

```mermaid
erDiagram
    CUSTOMER ||--o{ ORDERS : places
    ORDERS ||--|{ ORDER_ITEM : contains
    PRODUCT ||--o{ ORDER_ITEM : appears_in
    ORDERS ||--o| PAYMENT : is_paid_by

    CUSTOMER {
      int customer_id PK
      nvarchar name
      nvarchar email
      date sign_up_date
    }

    PRODUCT {
      int product_id PK
      nvarchar name
      nvarchar category
      decimal unit_cost
      decimal unit_price
      bit is_active
    }

    ORDERS {
      int order_id PK
      int customer_id FK
      date order_date
      nvarchar status
    }

    ORDER_ITEM {
      int order_item_id PK
      int order_id FK
      int product_id FK
      int quantity
      decimal unit_price
      decimal line_subtotal (computed)
    }

    PAYMENT {
      int payment_id PK
      int order_id FK
      decimal amount
      nvarchar method
      datetime paid_at
    }
