SELECT COUNT(booking_id),
FROM Bookings,
GROUP BY user_id;

SELECT property_id, booking_id,
ROW_NUMBER() OVER (PARTITION BY property_id ORDER BY booking_id) as property_id_row,
RANK() OVER (PARTITION BY property_id ORDER BY booking_id) as property_id_rank
FROM Bookings;