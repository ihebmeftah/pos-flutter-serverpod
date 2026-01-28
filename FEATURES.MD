# Developed Features

## Building Management

After authentication, the owner needs to create their first building by inserting required information (name, address, currency, open/close time). The owner can create many buildings and configure various settings:

### Building Configuration Settings

#### Strict Mode

This mode is related to payment and order management. If enabled, the employee can't confirm the payment of an order (or item) until it has passed through all 4 statuses: **In Progress → Picked → Ready → Delivered**. The final status is **Paid**.

#### Order with Cash Register

The cash register is a working period with a start time, end time, and amount. If enabled, the employee can't process orders unless the responsible person launches the cash register (the order must have an associated cash register).

#### Multi-Order per Table

If enabled, it is possible to add multiple orders to the same table.

#### Appending Items to Order

If enabled, the employee can add items to an existing order. If multiple orders per table are disabled, newly created orders at occupied tables are added as new items to the existing order.

#### Close Order

Automatically closes pending orders at the building's closing time.

---

## Table Management

- A cafe owner can add tables to their building by specifying the number of seats per table
- Owner needs to specify the number of tables and number of seats
- Cafe owner can deactivate/activate tables (if not occupied)
- Employees can:
  - View all tables
  - Select a table to place an order
  - See current order if the building doesn't allow multi-order configuration
  - See all orders placed at tables if multi-order is enabled

---

## Employee Management

- Owner can add staff by providing required information
- Each employee is associated with one building and can have specific access rights assigned
- When creating a new employee, their login email is generated based on their personal email and building name

**Email Format Example:**

- Personal email: `serverpod@example.com`
- Building name: `serverpod cafe`
- Employee login email: `serverpod@serverpod-cafe.com`

---

## Access Management

The owner can create personalized access permissions and assign them to employees.

### Order Permissions

- **Create Order:** If enabled, the employee can create orders
- **Order Notifications:** If enabled, the employee receives notifications when new orders or items are created
- **View All Orders:** If enabled, the employee can see all orders created by them or other employees; if disabled, they can only see their own orders
- **Modify Orders:** Permission to modify existing orders

### Payment Permissions

- **Complete Order Payments:** If enabled, the employee can mark order status as paid
- **Item-Level Payment:** If enabled, the employee can mark individual order items as paid
- **Manage Cash Register:** If enabled, the employee can start and close cash register sessions (if the building works with cash register)

### Kitchen Permissions

- **Prepare Orders:** If enabled, the employee can change order item status from **In Progress → Picked → Ready**
- **Serve Orders:** If enabled, the employee can change order item status from **Ready → Served**

> **Note:** If strict mode is enabled in building configuration, the order item status must follow this sequence: **In Progress → Picked → Ready → Served → Paid**

---

## Ingredient Management

- Owner can add all ingredients used for articles
- Required information: name, unit type, current stock, and threshold for alerting
- When an order is created with articles that have compositions, the ingredient's current stock is updated
- ⚠️ **Note:** This feature is not stable and needs improvement

---

## Category Management

- Owner can perform CRUD operations on categories (name, description)
- Employees can view articles by category when placing orders

---

## Article Management

- Owner can perform CRUD operations on articles (name, description)
- Each article must have a category
- Articles can have a composition by selecting ingredients and specifying quantities used
- ⚠️ **Note:** The composition feature is not stable and needs improvement
- Employees can view articles when placing orders

---

## Cash Register Management

- Owner can view all cash register sessions with start and end times
- Employees with cash register access can:
  - Launch/start cash register sessions
  - Close cash register sessions
- If building configuration has cash register enabled, orders require an active cash register session
- If disabled, orders can be created without a cash register

---

## Order Management

### Owner Capabilities

- View orders list
- View order details
- Cannot perform other actions (view-only access)

### Employee Capabilities (based on assigned access)

- **Create Order:** Create new orders
- **Append Items:** Add new items to existing orders
- **Change Order/Item Status:**
  - **In Progress → Picked → Ready** (if they have "Prepare" access)
  - **Ready → Served** (if they have "Serve" access)
  - **Served → Paid** (if they have payment order and item payment access)
