SELECT Users.first_name, Users.last_name, Properties.property_id, Bookings.booking_id, payments.amount
FROM Users
JOIN Properties
ON Users.user_id = Properties.host_id
JOIN Bookings
ON Properties.property_id = Bookings.property_id
JOIN payments
ON Bookings.booking_id = Payments.booking_id;

EXPLAIN ANALYZE SELECT u.first_name, u.last_name, p.property_id, b.booking_id, payments.amount FROM users u JOIN properties p ON u.user_id = p.host_id JOIN bookings b ON p.property_id = b.property_id LEFT JOIN payments ON b.booking_id = payments.booking_id;