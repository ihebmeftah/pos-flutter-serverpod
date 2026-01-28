# Test Accounts Documentation

This document provides detailed information about all seed accounts, building configurations, and employee access permissions for testing the POS system.

---

## 🏢 **BUILDING 1: Café Dream** (New York, USA)

### 📍 Location & Details

- **Address:** 123 Main Street, New York, NY 10001
- **Coordinates:** 40.7128, -74.0060
- **Currency:** USD ($)
- **Hours:** 7:00 AM - 10:00 PM

### ⚙️ Configuration

| Feature                      | Status                                                  |
| ---------------------------- | ------------------------------------------------------- |
| **Table Multi-Order**        | ✅ Enabled (Multiple orders per table allowed)          |
| **Order with Cash Register** | ✅ Enabled                                              |
| **Cash Register Limit/Day**  | 5 registers maximum                                     |
| **Append Items to Order**    | ✅ Enabled (Can add items to existing orders)           |
| **Auto-Close Orders**        | ✅ Enabled (Orders close automatically at closing time) |
| **Strict Mode**              | ❌ Disabled (Flexible operations)                       |

### 👤 Owner Account

```
Email:    owner1@b1.com
Password: Owner123!
Username: owner1
Name:     John Dream
Role:     Owner
```

### 👥 Employees

#### 1. Manager (John Manager1)

```
Email:    manager1@example.com
Password: Employee123!
Phone:    +1234560001
Role:     Manager
```

**Permissions:**

- ✅ Consult All Orders
- ✅ Order Creation
- ✅ Order Creation Notifications
- ✅ Order Payment
- ✅ Order Items Payment
- ✅ Append Items to Orders
- ✅ Preparation
- ✅ Serve Orders
- ✅ Cash Register Management

#### 2. Waiter (Emma Waiter1)

```
Email:    waiter1@example.com
Password: Employee123!
Phone:    +1234570001
Role:     Waiter
```

**Permissions:**

- ✅ Consult All Orders
- ✅ Order Creation
- ✅ Order Creation Notifications
- ❌ Order Payment
- ❌ Order Items Payment
- ✅ Append Items to Orders
- ❌ Preparation
- ✅ Serve Orders
- ❌ Cash Register Management

#### 3. Chef (Oliver Chef1)

```
Email:    chef1@example.com
Password: Employee123!
Phone:    +1234580001
Role:     Chef
```

**Permissions:**

- ✅ Consult All Orders
- ❌ Order Creation
- ❌ Order Creation Notifications
- ❌ Order Payment
- ❌ Order Items Payment
- ❌ Append Items to Orders
- ✅ Preparation
- ❌ Serve Orders
- ❌ Cash Register Management

---

## 🏢 **BUILDING 2: Café Zitouna** (Tunis, Tunisia)

### 📍 Location & Details

- **Address:** Avenue Habib Bourguiba, Tunis 1000
- **Coordinates:** 36.8065, 10.1815
- **Currency:** TND (Tunisian Dinar)
- **Hours:** 6:00 AM - 11:30 PM

### ⚙️ Configuration

| Feature                      | Status                                                  |
| ---------------------------- | ------------------------------------------------------- |
| **Table Multi-Order**        | ❌ Disabled (One order per table only)                  |
| **Order with Cash Register** | ✅ Enabled                                              |
| **Cash Register Limit/Day**  | 3 registers maximum                                     |
| **Append Items to Order**    | ❌ Disabled (Cannot add items to existing orders)       |
| **Auto-Close Orders**        | ✅ Enabled (Orders close automatically at closing time) |
| **Strict Mode**              | ✅ Enabled (Strict operational controls)                |

### 👤 Owner Account

```
Email:    owner2@b2.tn
Password: Owner123!
Username: owner2
Name:     Ahmed Zitouna
Role:     Owner
```

### 👥 Employees

#### 1. Manager (John Manager2)

```
Email:    manager2@example.com
Password: Employee123!
Phone:    +1234560002
Role:     Manager
```

**Permissions:**

- ✅ Consult All Orders
- ✅ Order Creation
- ✅ Order Creation Notifications
- ✅ Order Payment
- ✅ Order Items Payment
- ✅ Append Items to Orders
- ✅ Preparation
- ✅ Serve Orders
- ✅ Cash Register Management

#### 2. Waiter (Emma Waiter2)

```
Email:    waiter2@example.com
Password: Employee123!
Phone:    +1234570002
Role:     Waiter
```

**Permissions:**

- ✅ Consult All Orders
- ✅ Order Creation
- ✅ Order Creation Notifications
- ❌ Order Payment
- ❌ Order Items Payment
- ✅ Append Items to Orders
- ❌ Preparation
- ✅ Serve Orders
- ❌ Cash Register Management

#### 3. Chef (Oliver Chef2)

```
Email:    chef2@example.com
Password: Employee123!
Phone:    +1234580002
Role:     Chef
```

**Permissions:**

- ✅ Consult All Orders
- ❌ Order Creation
- ❌ Order Creation Notifications
- ❌ Order Payment
- ❌ Order Items Payment
- ❌ Append Items to Orders
- ✅ Preparation
- ❌ Serve Orders
- ❌ Cash Register Management

---

## 🏢 **BUILDING 3: Bistro Paris** (Paris, France)

### 📍 Location & Details

- **Address:** 45 Avenue des Champs-Élysées, 75008 Paris
- **Coordinates:** 48.8698, 2.3078
- **Currency:** EUR (€)
- **Hours:** 8:00 AM - 11:00 PM

### ⚙️ Configuration

| Feature                      | Status                                         |
| ---------------------------- | ---------------------------------------------- |
| **Table Multi-Order**        | ✅ Enabled (Multiple orders per table allowed) |
| **Order with Cash Register** | ❌ Disabled (No cash register required)        |
| **Cash Register Limit/Day**  | N/A (Cash register not used)                   |
| **Append Items to Order**    | ✅ Enabled (Can add items to existing orders)  |
| **Auto-Close Orders**        | ❌ Disabled (Manual order closure required)    |
| **Strict Mode**              | ❌ Disabled (Flexible operations)              |

### 👤 Owner Account

```
Email:    owner3@b3.fr
Password: Owner123!
Username: owner3
Name:     Marie Dupont
Role:     Owner
```

### 👥 Employees

#### 1. Manager (John Manager3)

```
Email:    manager3@example.com
Password: Employee123!
Phone:    +1234560003
Role:     Manager
```

**Permissions:**

- ✅ Consult All Orders
- ✅ Order Creation
- ✅ Order Creation Notifications
- ✅ Order Payment
- ✅ Order Items Payment
- ✅ Append Items to Orders
- ✅ Preparation
- ✅ Serve Orders
- ✅ Cash Register Management

#### 2. Waiter (Emma Waiter3)

```
Email:    waiter3@example.com
Password: Employee123!
Phone:    +1234570003
Role:     Waiter
```

**Permissions:**

- ✅ Consult All Orders
- ✅ Order Creation
- ✅ Order Creation Notifications
- ❌ Order Payment
- ❌ Order Items Payment
- ✅ Append Items to Orders
- ❌ Preparation
- ✅ Serve Orders
- ❌ Cash Register Management

#### 3. Chef (Oliver Chef3)

```
Email:    chef3@example.com
Password: Employee123!
Phone:    +1234580003
Role:     Chef
```

**Permissions:**

- ✅ Consult All Orders
- ❌ Order Creation
- ❌ Order Creation Notifications
- ❌ Order Payment
- ❌ Order Items Payment
- ❌ Append Items to Orders
- ✅ Preparation
- ❌ Serve Orders
- ❌ Cash Register Management

---

## 📊 Configuration Comparison Summary

| Feature           | Café Dream (USA) | Café Zitouna (TN) | Bistro Paris (FR) |
| ----------------- | ---------------- | ----------------- | ----------------- |
| **Multi-Order**   | ✅ Yes           | ❌ No             | ✅ Yes            |
| **Cash Register** | ✅ Yes (Max 5)   | ✅ Yes (Max 3)    | ❌ No             |
| **Append Items**  | ✅ Yes           | ❌ No             | ✅ Yes            |
| **Auto-Close**    | ✅ Yes           | ✅ Yes            | ❌ No             |
| **Strict Mode**   | ❌ Flexible      | ✅ Strict         | ❌ Flexible       |
| **Currency**      | USD              | TND               | EUR               |

---

## 🔐 Access Role Definitions

### Manager Role

**Full administrative access** - Can perform all operations including financial transactions and cash register management.

**Use Case:** Testing complete workflow from order creation to payment processing and cash management.

### Waiter Role

**Service-focused access** - Can create and manage orders, serve customers, but cannot handle payments or cash register.

**Use Case:** Testing order creation, modification, and service workflow without financial access.

### Chef Role

**Kitchen-focused access** - Can only view orders and mark items as prepared. No order creation or payment abilities.

**Use Case:** Testing kitchen operations, order preparation tracking, and production workflow.

---

## 🗄️ Database Content

Each building is seeded with:

- **10 Ingredients** (Coffee, Milk, Sugar, Bread, Cheese, Tomatoes, Lettuce, Chicken, Pasta, Olive Oil)
- **5 Categories** (Beverages, Breakfast, Lunch, Desserts, Specials)
- **15 Articles** (3 per category with ingredient compositions)
- **~30 Article Compositions** (Ingredient relationships)

---

## 🚀 How to Seed the Database

Run the following command from the project root:

```bash
cd pos_server
dart run bin/seed_database.dart --config=development
```

**Expected Output:**

- ✅ 3 Owner Accounts
- ✅ 3 Buildings with Different Configurations
- ✅ 9 Access Permission Roles (3 per building)
- ✅ 9 Employers (3 per building)
- ✅ 30 Ingredients (10 per building)
- ✅ 15 Categories (5 per building)
- ✅ 45 Articles (3 per category)
- ✅ ~90 Article Compositions

---

## 📝 Testing Scenarios

### Scenario 1: Flexible Operations (Café Dream)

- Login as `owner1@b1.com` or any employee
- Test multiple orders per table
- Test adding items to existing orders
- Test cash register with 5 register limit
- Verify auto-close at 10 PM

### Scenario 2: Strict Operations (Café Zitouna)

- Login as `owner2@b2.tn` or any employee
- Verify only one order per table
- Test that appending items is blocked
- Test cash register with 3 register limit
- Verify strict mode controls

### Scenario 3: No Cash Register (Bistro Paris)

- Login as `owner3@b3.fr` or any employee
- Test operations without cash register
- Verify manual order closure
- Test flexible order management

### Role-Based Testing

- **Manager:** Full workflow testing
- **Waiter:** Order creation and service without payment
- **Chef:** Kitchen preparation workflow only

---

## 🔑 Quick Reference Card

| Building     | Owner Email   | Owner Password | Employee Password |
| ------------ | ------------- | -------------- | ----------------- |
| Café Dream   | owner1@b1.com | Owner123!      | Employee123!      |
| Café Zitouna | owner2@b2.tn  | Owner123!      | Employee123!      |
| Bistro Paris | owner3@b3.fr  | Owner123!      | Employee123!      |

**Employee Email Pattern:** `[role][number]@example.com`

- manager1@example.com, waiter1@example.com, chef1@example.com (Building 1)
- manager2@example.com, waiter2@example.com, chef2@example.com (Building 2)
- manager3@example.com, waiter3@example.com, chef3@example.com (Building 3)

---

_Last Updated: January 2026_

- Login as `owner1@b1.com` or any employee
- Test multiple orders per table
- Test adding items to existing orders
- Test cash register with 5 register limit
- Verify auto-close at 10 PM

### Scenario 2: Strict Operations (Café Zitouna)

- Login as `owner2@b2.tn` or any employee
- Verify only one order per table
- Test that appending items is blocked
- Test cash register with 3 register limit
- Verify strict mode controls

### Scenario 3: No Cash Register (Bistro Paris)

- Login as `owner3@b3.fr` or any employee
- Test operations without cash register
- Verify manual order closure
- Test flexible order management

### Role-Based Testing

- **Manager:** Full workflow testing
- **Waiter:** Order creation and service without payment
- **Chef:** Kitchen preparation workflow only

---

## 🔑 Quick Reference Card

| Building     | Owner Email     | Owner Password | Employee Password |
| ------------ | --------------- | -------------- | ----------------- |
| Café Dream   | <owner1@b1.com> | Owner123!      | Employee123!      |
| Café Zitouna | <owner2@b2.tn>  | Owner123!      | Employee123!      |
| Bistro Paris | <owner3@b3.fr>  | Owner123!      | Employee123!      |

**Employee Email Pattern:** `[role][number]@example.com`

- <manager1@example.com>, <waiter1@example.com>, <chef1@example.com> (Building 1)
- <manager2@example.com>, <waiter2@example.com>, <chef2@example.com> (Building 2)
- <manager3@example.com>, <waiter3@example.com>, <chef3@example.com> (Building 3)

---

_Last Updated: January 2026_
