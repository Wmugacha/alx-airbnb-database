SELECT user_id, COUNT(booking_id) AS total_bookings
FROM Bookings,
GROUP BY user_id;

SELECT property_id, COUNT(*) AS total_bookings,
ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC) AS row_num,
RANK() OVER (ORDER BY COUNT(*) DESC) AS rank_num,
FROM Bookings
GROUP BY property_id;