SELECT first_name, last_name, booking_id, property_id
FROM Users
INNER JOIN Bookings
ON Users.user_id = Bookings.user_id