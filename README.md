
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
