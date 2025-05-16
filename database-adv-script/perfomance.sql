SELECT 
    u.first_name, 
    u.last_name, 
    p.property_id, 
    b.booking_id, 
    payments.amount
FROM 
    users u, 
    properties p, 
    bookings b, 
    payments
WHERE 
    u.user_id = p.host_id
    AND p.property_id = b.property_id
    AND b.booking_id = payments.booking_id;

EXPLAIN ANALYZE SELECT u.first_name, u.last_name, p.property_id, b.booking_id, payments.amount FROM users u JOIN properties p ON u.user_id = p.host_id JOIN bookings b ON p.property_id = b.property_id LEFT JOIN payments ON b.booking_id = payments.booking_id;