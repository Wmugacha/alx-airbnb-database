-- ROLE
INSERT INTO ROLE (role_id, role_name) VALUES
  ('11111111-1111-1111-1111-111111111111', 'guest'),
  ('22222222-2222-2222-2222-222222222222', 'host'),
  ('33333333-3333-3333-3333-333333333333', 'admin');

-- USER
INSERT INTO "User" (user_id, first_name, last_name, email, password_hash, phone_number, role_id) VALUES
  ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'Alice', 'Guest', 'alice@example.com', 'hashed_pw1', '1234567890', '11111111-1111-1111-1111-111111111111'),
  ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'Bob', 'Host', 'bob@example.com', 'hashed_pw2', '0987654321', '22222222-2222-2222-2222-222222222222'),
  ('cccccccc-cccc-cccc-cccc-cccccccccccc', 'Charlie', 'Admin', 'charlie@example.com', 'hashed_pw3', NULL, '33333333-3333-3333-3333-333333333333');

-- PROPERTY
INSERT INTO PROPERTY (property_id, host_id, name, description, location, price_per_night) VALUES
  ('dddddddd-dddd-dddd-dddd-dddddddddddd', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'Cozy Cottage', 'A small cozy place in the woods.', 'Nairobi', 50.00),
  ('eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'City Apartment', 'Modern apartment in the city center.', 'Shanghai', 120.00);

-- BOOKING_STATUS
INSERT INTO BOOKING_STATUS (status_id, status_name) VALUES
  ('44444444-4444-4444-4444-444444444444', 'pending'),
  ('55555555-5555-5555-5555-555555555555', 'confirmed'),
  ('66666666-6666-6666-6666-666666666666', 'cancelled');

-- BOOKING
INSERT INTO BOOKING (booking_id, property_id, user_id, start_date, end_date, total_price, status_id) VALUES
  ('77777777-7777-7777-7777-777777777777', 'dddddddd-dddd-dddd-dddd-dddddddddddd', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '2025-07-01', '2025-07-05', 200.00, '55555555-5555-5555-5555-555555555555'),
  ('88888888-8888-8888-8888-888888888888', 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '2025-08-10', '2025-08-12', 240.00, '44444444-4444-4444-4444-444444444444');

-- PAYMENT_METHOD
INSERT INTO PAYMENT_METHOD (method_id, method_name) VALUES
  ('99999999-9999-9999-9999-999999999999', 'credit_card'),
  ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaa0000', 'paypal');

-- PAYMENT
INSERT INTO PAYMENT (payment_id, booking_id, amount, method_id) VALUES
  ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbb0000', '77777777-7777-7777-7777-777777777777', 200.00, '99999999-9999-9999-9999-999999999999'),
  ('cccccccc-cccc-cccc-cccc-cccccccc0000', '88888888-8888-8888-8888-888888888888', 240.00, 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaa0000');

-- REVIEW
INSERT INTO REVIEW (review_id, property_id, user_id, rating, comment) VALUES
  ('dddddddd-dddd-dddd-dddd-dddddddd0000', 'dddddddd-dddd-dddd-dddd-dddddddddddd', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 5, 'Absolutely loved the cozy vibe!'),
  ('eeeeeeee-eeee-eeee-eeee-eeeeeeee0000', 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 4, 'Very clean and central location.');

-- MESSAGE
INSERT INTO MESSAGE (message_id, sender_id, recipient_id, message) VALUES
  ('ffffffff-ffff-ffff-ffff-ffffffff0000', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'Hi Bob, is your cottage available next weekend?'),
  ('99999999-9999-9999-9999-999999990000', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'Yes! It’s available from Friday.');