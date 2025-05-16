EXPLAIN ANALYZE SELECT COUNT(*) AS host_count
FROM users
JOIN roles on users.role_id = roles.role_id
WHERE roles.role_name = 'host';

CREATE INDEX idx_users_id ON Users (user_id);

CREATE INDEX idx_property_id ON Properties(property_id);

CREATE INDEX idx_booking_id ON Bookings(booking_id)

CREATE idx_role_id ON Roles(role_id)

EXPLAIN ANALYZE
SELECT COUNT(*) AS host_count
FROM users
JOIN roles
ON users.role_id = roles.role_id
WHERE roles.role_name = 'host';