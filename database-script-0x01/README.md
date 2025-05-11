## 📦 Database Schema

This section documents the core database design for the Airbnb Clone backend. The schema is normalized to reduce redundancy, ensure data integrity, and support efficient querying via indexed relationships.

---

### 🔐 Role Table

Defines different roles within the platform, such as guest, host, and admin.

| Column     | Type    | Constraints      |
| ---------- | ------- | ---------------- |
| role\_id   | UUID    | Primary Key      |
| role\_name | VARCHAR | Unique, Not Null |

* **Indexes**: `role_name` for quick lookups
* **Used by**: `users` table (`role_id` foreign key)

---

### 👤 Users Table

Stores user details, including authentication and role assignments.

| Column         | Type      | Constraints                  |
| -------------- | --------- | ---------------------------- |
| user\_id       | UUID      | Primary Key                  |
| first\_name    | VARCHAR   | Not Null                     |
| last\_name     | VARCHAR   | Not Null                     |
| email          | VARCHAR   | Unique, Not Null             |
| password\_hash | VARCHAR   | Not Null                     |
| phone\_number  | VARCHAR   | Optional                     |
| created\_at    | TIMESTAMP | Default: now()               |
| role\_id       | UUID      | Foreign Key → role(role\_id) |

* **Indexes**: `email`, `role_id`
* **Relations**: A user can be a guest, host, or admin. A user can create properties, bookings, messages, and reviews.

---

### 🏡 Property Table

Represents properties listed by hosts for rent.

| Column            | Type      | Constraints                      |
| ----------------- | --------- | -------------------------------- |
| property\_id      | UUID      | Primary Key                      |
| host\_id          | UUID      | Foreign Key → users(user\_id)    |
| name              | VARCHAR   | Not Null                         |
| description       | TEXT      | Not Null                         |
| location          | VARCHAR   | Not Null                         |
| price\_per\_night | DECIMAL   | Not Null, price ≥ 0              |
| created\_at       | TIMESTAMP | Default: now()                   |
| updated\_at       | TIMESTAMP | Auto-updated on row modification |

* **Indexes**: `host_id`, `location`
* **Relations**: A user (host) can own multiple properties.

---

### 📅 Booking Status Table

Normalizes booking statuses like `pending`, `confirmed`, `cancelled`.

| Column       | Type    | Constraints      |
| ------------ | ------- | ---------------- |
| status\_id   | UUID    | Primary Key      |
| status\_name | VARCHAR | Unique, Not Null |

* **Indexes**: `status_name`
* **Used by**: `booking.status_id`

---

### 🧾 Booking Table

Records guest bookings of properties.

| Column       | Type      | Constraints                               |
| ------------ | --------- | ----------------------------------------- |
| booking\_id  | UUID      | Primary Key                               |
| property\_id | UUID      | Foreign Key → property(property\_id)      |
| user\_id     | UUID      | Foreign Key → users(user\_id)             |
| start\_date  | DATE      | Not Null                                  |
| end\_date    | DATE      | Not Null, end > start                     |
| total\_price | DECIMAL   | Not Null, price ≥ 0                       |
| status\_id   | UUID      | Foreign Key → booking\_status(status\_id) |
| created\_at  | TIMESTAMP | Default: now()                            |

* **Indexes**: `user_id`, `property_id`, `status_id`
* **Relations**: Each booking is linked to one property, one guest, and one status.

---

### 💳 Payment Method Table

Defines available payment methods (e.g., credit card, PayPal, etc.).

| Column       | Type    | Constraints      |
| ------------ | ------- | ---------------- |
| method\_id   | UUID    | Primary Key      |
| method\_name | VARCHAR | Unique, Not Null |

* **Indexes**: `method_name`
* **Used by**: `payment.method_id`

---

### 💸 Payment Table

Stores payment information for each booking.

| Column        | Type      | Constraints                        |
| ------------- | --------- | ---------------------------------- |
| payment\_id   | UUID      | Primary Key                        |
| booking\_id   | UUID      | Foreign Key → booking(booking\_id) |
| amount        | DECIMAL   | Not Null, amount ≥ 0               |
| payment\_date | TIMESTAMP | Default: now()                     |
| method\_id    | UUID      | Foreign Key → payment\_method      |

* **Indexes**: `booking_id`, `method_id`
* **Relations**: Each payment is linked to a booking and a payment method.

---

### ✍️ Review Table

Captures guest feedback on properties.

| Column       | Type      | Constraints                          |
| ------------ | --------- | ------------------------------------ |
| review\_id   | UUID      | Primary Key                          |
| property\_id | UUID      | Foreign Key → property(property\_id) |
| user\_id     | UUID      | Foreign Key → users(user\_id)        |
| rating       | INTEGER   | Not Null, value 1-5                  |
| comment      | TEXT      | Not Null                             |
| created\_at  | TIMESTAMP | Default: now()                       |

* **Indexes**: `property_id`, `user_id`
* **Relations**: One user can review many properties.

---

### 💬 Message Table

Enables communication between users on the platform.

| Column        | Type      | Constraints                   |
| ------------- | --------- | ----------------------------- |
| message\_id   | UUID      | Primary Key                   |
| sender\_id    | UUID      | Foreign Key → users(user\_id) |
| recipient\_id | UUID      | Foreign Key → users(user\_id) |
| message       | TEXT      | Not Null                      |
| sent\_at      | TIMESTAMP | Default: now()                |

* **Indexes**: `sender_id`, `recipient_id`
* **Relations**: Users can send messages to one another.

---

### 🧠 Design Highlights

* **Normalization**: Role, booking status, and payment methods are normalized to reduce repetition.
* **Indexing**: Foreign keys and frequently queried columns are indexed for performance.
* **Constraints**: `CHECK`, `NOT NULL`, and `UNIQUE` constraints help maintain clean and predictable data.

---