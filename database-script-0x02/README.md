## 📄 Sample Data Documentation

This section provides initial **seed data** for all key tables in the database. These entries are useful for development, testing, and demonstrating core system functionality such as user registration, property listings, bookings, and payments.

---

### 👤 `ROLE`

Defines user roles in the system. These roles help differentiate user permissions (e.g., host, guest, admin).

| role\_id (UUID)                        | role\_name |
| -------------------------------------- | ---------- |
| `11111111-1111-1111-1111-111111111111` | guest      |
| `22222222-2222-2222-2222-222222222222` | host       |
| `33333333-3333-3333-3333-333333333333` | admin      |

---

### 👥 `User`

Represents system users with relevant authentication and profile information.

| user\_id (UUID)                        | Name          | Email                                             | Role  |
| -------------------------------------- | ------------- | ------------------------------------------------- | ----- |
| `aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa` | Alice Guest   | [alice@example.com](mailto:alice@example.com)     | guest |
| `bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb` | Bob Host      | [bob@example.com](mailto:bob@example.com)         | host  |
| `cccccccc-cccc-cccc-cccc-cccccccccccc` | Charlie Admin | [charlie@example.com](mailto:charlie@example.com) | admin |

---

### 🏡 `Property`

Stores property listings added by hosts.

| property\_id (UUID)                    | Name           | Host     | Location |
| -------------------------------------- | -------------- | -------- | -------- |
| `dddddddd-dddd-dddd-dddd-dddddddddddd` | Cozy Cottage   | Bob Host | Nairobi  |
| `eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee` | City Apartment | Bob Host | Shanghai |

---

### 📅 `Booking_Status`

Tracks status for each booking.

| status\_id (UUID)                      | Status    |
| -------------------------------------- | --------- |
| `44444444-4444-4444-4444-444444444444` | pending   |
| `55555555-5555-5555-5555-555555555555` | confirmed |
| `66666666-6666-6666-6666-666666666666` | cancelled |

---

### 📖 `Booking`

Links a guest with a property for a specific timeframe.

| booking\_id (UUID)                     | Property       | Guest       | Status    |
| -------------------------------------- | -------------- | ----------- | --------- |
| `77777777-7777-7777-7777-777777777777` | Cozy Cottage   | Alice Guest | confirmed |
| `88888888-8888-8888-8888-888888888888` | City Apartment | Alice Guest | pending   |

---

### 💳 `Payment_Method`

Defines available methods of payment.

| method\_id (UUID)                      | Method       |
| -------------------------------------- | ------------ |
| `99999999-9999-9999-9999-999999999999` | credit\_card |
| `aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaa0000` | paypal       |

---

### 💸 `Payment`

Stores payment records for bookings.

| payment\_id (UUID)                     | Booking       | Method       | Amount |
| -------------------------------------- | ------------- | ------------ | ------ |
| `bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbb0000` | Booking #7777 | credit\_card | 200.00 |
| `cccccccc-cccc-cccc-cccc-cccccccc0000` | Booking #8888 | paypal       | 240.00 |

---

### ✍️ `Review`

Guest feedback for properties after a stay.

| review\_id (UUID)                      | Property       | User        | Rating | Comment                            |
| -------------------------------------- | -------------- | ----------- | ------ | ---------------------------------- |
| `dddddddd-dddd-dddd-dddd-dddddddd0000` | Cozy Cottage   | Alice Guest | 5      | "Absolutely loved the cozy vibe!"  |
| `eeeeeeee-eeee-eeee-eeee-eeeeeeee0000` | City Apartment | Alice Guest | 4      | "Very clean and central location." |

---

### 💬 `Message`

User-to-user messaging (e.g., guest to host).

| message\_id (UUID)                     | Sender      | Recipient   | Message                                   |
| -------------------------------------- | ----------- | ----------- | ----------------------------------------- |
| `ffffffff-ffff-ffff-ffff-ffffffff0000` | Alice Guest | Bob Host    | "Is your cottage available next weekend?" |
| `99999999-9999-9999-9999-999999990000` | Bob Host    | Alice Guest | "Yes! It’s available from Friday."        |

---