CREATE TABLE Bookings (
    booking_id UUID,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL CHECK (end_date > start_date),
    total_price DECIMAL(10, 2) NOT NULL CHECK (total_price >= 0),
    status_id UUID NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES Properties(property_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (status_id) REFERENCES Booking_status(status_id)

) PARTITION BY RANGE(start_date);

CREATE TABLE bookings_2024_q2
PARTITION OF bookings
FOR VALUES FROM ('2024-04-01') TO ('2024-07-01');