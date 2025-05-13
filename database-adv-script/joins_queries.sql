SELECT first_name.Users, last_name.Users, booking_id.Bookings, property_id.Bookings
FROM Users
INNER JOIN Bookings
ON Users.user_id = Bookings.user_id

SELECT name.Properties, comment.Reviews, rating.Reviews
FROM Properties
LEFT JOIN Reviews
ON Properties.property_id = Reviews.property_id
ORDER BY name.Properties

SELECT first_name.Users, last_name.Users, booking_id.Bookings, property_id.Bookings
FROM Users
FULL OUTER JOIN Bookings
ON Users.user_id = Bookings.user_id