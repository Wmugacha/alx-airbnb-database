![Normalized Database Schema](./normlized%20database.jpg)

Absolutely! Here's your **Database Normalization Steps** section in the same polished GitHub-friendly format:

---

## Database Normalization Steps

Normalization helps organize data efficiently, reduce redundancy, and improve database integrity. Below are the steps taken to normalize key tables in the project schema:

---

### 🔹 **Step 1: Creation of `booking_status` Table**

***Why:***
To eliminate redundancy and enforce consistency in booking statuses (e.g., `pending`, `confirmed`, `canceled`).

***What Changed:***

* Removed `ENUM` from the `Booking.status` column
* Created a new table:
  `Booking_Status(status_id, status_name)`
* Replaced `status` in the `Booking` table with `status_id` as a foreign key

> 🔁 *This centralizes status definitions and makes them easier to maintain.*

---

### 🔹 **Step 2: Creation of `payment_method` Table**

***Why:***
To avoid repeating string values like `credit_card`, `paypal`, and `stripe` across multiple rows.

***What Changed:***

* Removed raw `payment_method` strings from the `Payment` table
* Created a new table:
  `Payment_Method(method_id, method_name)`
* Replaced method names in the `Payment` table with `method_id` as a foreign key

> 💳 *This allows for scalability if new payment methods are added later.*

---

### 🔹 **Step 3: Creation of `role` Table**

***Why:***
To normalize user roles (such as `guest`, `host`, and `admin`) and ensure centralized control.

***What Changed:***

* Removed the text `role` column from the `User` table
* Created a new table:
  `Role(role_id, role_name)`
* Added `role_id` as a foreign key in the `User` table

> 👥 *This helps enforce role-based access and makes roles easier to manage system-wide.*

---