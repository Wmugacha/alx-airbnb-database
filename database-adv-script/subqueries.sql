SELECT property_name
FROM Properties
WHERE property_id IN (
    SELECT property_id
    FROM Reviews
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
);

SELECT first_name, last_name
FROM Users
WHERE user_id IN (
    SELECT user_id
    FROM Bookings
    GROUP BY user_id
    HAVING COUNT(booking_id) > 3
);