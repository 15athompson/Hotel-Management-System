INSERT INTO address (postcode, address_line1, address_line2, city, county) VALUES
('CB223AA', 'High Street', 'Great Shelford', 'Cambridge', 'Cambridgeshire'),
('NR146AB', 'Church Lane', 'Bramerton', 'Norwich', 'Norfolk'),
('IP288AA', 'The Green', 'Mildenhall', 'Bury St Edmunds', 'Suffolk'),
('CO100CD', 'The Street', 'Cavendish', 'Sudbury', 'Suffolk'),
('PE365DE', 'Main Road', 'Snettisham', 'Kings Lynn', 'Norfolk'),
('CM14FG', 'Back Lane', 'Little Waltham', 'Chelmsford', 'Essex'),
('CB249GH', 'Mill Lane', 'Willingham', 'Cambridge', 'Cambridgeshire'),
('IP76IJ', 'Mill Street', 'Hadleigh', 'Ipswich', 'Suffolk'),
('NR205KL', 'The Street', 'Horsham St Faith', 'Norwich', 'Norfolk'),
('CO107MN', 'Church Road', 'Long Melford', 'Sudbury', 'Suffolk'),
('IP12AN', 'Civic Dr', '', 'Ipswich', 'Suffolk'),
('CO111US','Riverside Ave E', 'Lawford', 'Manningtree', 'Suffolk');

INSERT INTO company_account (company_id, company_name, building, postcode, admin_title, admin_first_name, admin_last_name, admin_phone_number, admin_email) VALUES
(1, 'AXA Insurance', 'Brooke Lawrance House', 'IP12AN', 'Miss', 'Jane', 'Peters', '01473726352', 'j.peters@axa.co.uk'),
(2, 'Rose Builders Ltd', '1', 'CO111US', 'Mr', 'David', 'White', '01206123654', 'd.white@rosebuilders.co.uk');

INSERT INTO guest (guest_id, company_id, title, first_name, last_name, phone_number, email, house_name_number, postcode) VALUES
(1, NULL, 'Mr', 'Oliver', 'Smith', '07123456789', 'oliver.smith@hotmail.co.uk', '12', 'CB223AA'),
(2, NULL, 'Mrs', 'Sophia', 'Johnson', '07234567890', 'sophia.johnson@gmail.co.uk', '34', 'NR146AB'),
(3, 1, 'Ms', 'Amelia', 'Brown', '07345678901', 'amelia.brown@outlook.co.uk', 'Ivy Cottage', 'IP288AA'),
(4, 1, 'Mr', 'Liam', 'Williams', '07456789012', 'liam.williams@btinternet.com', '78', 'CO100CD'),
(5, NULL, 'Dr', 'Emma', 'Jones', '07567890123', 'emma.jones@sky.com', '90', 'PE365DE'),
(6, NULL, 'Miss', 'Isabella', 'Garcia', '07678901234', 'isabella.garcia@plusnet.co.uk', '23', 'CM14FG'),
(7, 2, 'Mr', 'James', 'Martinez', '07789012345', 'james.martinez@gmail.com', '45', 'CB249GH'),
(8, NULL, 'Mrs', 'Mia', 'Taylor', '07890123456', 'mia.taylor@btinternet.com', '67', 'IP76IJ'),
(9, NULL, 'Mr', 'Ethan', 'Harris', '07901234567', 'ethan.harris@hotmail.co.uk', '89', 'NR205KL'),
(10, NULL, 'Ms', 'Ava', 'Thompson', '07012345678', 'ava.thompson@gmail.com', '11', 'CO107MN');

INSERT INTO marketing (guest_id,marketing_code,contact_by_phone,contact_by_email,contact_by_post) VALUES
(1,'DIS',0,1,1),
(3,'EVT',1,1,0),
(5,'ALL',0,1,0),
(8,'DIS',0,1,0),
(10,'ALL',1,1,1);

INSERT INTO invoice (invoice_number, invoice_date, amount_due, amount_paid, payment_method, payment_date) VALUES
(1, '2024-10-21', 94.50, 94.50, 'Visa', '2024-10-23'),
(2, '2024-10-24', 75.00, 0.00, NULL, NULL),
(3, '2024-10-25', 97.75, 97.75, 'Master Card Debit', '2024-10-25');

INSERT INTO promotion (promotion_code,promotion_name,discount_percentage) VALUES
('OCT10','October 10% discount',10),
('OCT15','October 15% discount',15),
('COM20','Company 20% discount',20),
('NOV10','November 10% discount',10),
('DEC10','December 10% discount',10);

INSERT INTO reservation (reservation_id,guest_id,room_number,invoice_number,promotion_code,reservation_staff_id,reservation_date_time,number_of_guests,start_of_stay,length_of_stay,status_code) VALUES
(1,1,110,1,'OCT10',4,'2024-10-12 09:30:00',3,'2024-10-21',2,'OT'),
(2,3,103,2,NULL,5,'2024-10-13 12:15:00',1,'2024-10-24',7,'IN'),
(3,1,204,3,'OCT15',3,'2024-10-16 14:10:00',2,'2024-10-25',4,'IN'),
(4,7,101,NULL,'COM20',3,'2024-10-17 19:25:00',1,'2024-10-26',1,'IN'),
(5,4,101,NULL,'COM20',2,'2024-10-20 10:00:00',1,'2024-11-11',5,'RE');

INSERT INTO staff (staff_id, manager_id, title, first_name, last_name, role) VALUES
(1, NULL, 'Mr', 'Simon', 'Rumsey', 'OWNER'),
(2, 1, 'Mrs', 'Jill', 'Smithers', 'RECEP_LEAD'),
(3, 2, 'Mr', 'James', 'Dilly', 'RECEP'),
(4, 2, 'Miss', 'Heather', 'Lewis', 'RECEP'),
(5, 2, 'Ms', 'Vicki', 'Green', 'RECEP'),
(6, 1, 'Mr', 'Stuart', 'Sanders', 'CLEAN_LEAD'),
(7, 6, 'Miss', 'Paula', 'Jones', 'CLEAN'),
(8, 6, 'Miss', 'Holly', 'Adams', 'CLEAN'),
(9, 6, 'Mr', 'Jack', 'York', 'CLEAN');


INSERT INTO room_type (room_type_code, room_type_name, modern_style, deluxe, maximum_guests) VALUES
('SI', 'Single', 0, 0, 1),
('SIM', 'Single Plus', 1, 0, 1),
('SIP', 'Single Premium', 0, 1, 1),
('DO', 'Double', 0, 0, 2),
('DOM', 'Double Plus', 1, 0, 2),
('DOP', 'Double Premium', 0, 1, 2),
('DOE', 'Double Executive', 1, 1, 2),
('TW', 'Twin', 0, 0, 2),
('TWE', 'Twin Executive', 1, 1, 2),
('FA', 'Family', 1, 1, 4),
('FAM', 'Family Plus', 1, 0, 4),
('FAP', 'Family Premium', 0, 1, 4),
('SUP', 'Suite Premium', 0, 1, 4),
('SUE', 'Suite Executive', 1, 1, 6);

INSERT INTO bathroom_type (bathroom_type_code, bathroom_type_name, seperate_shower, bath) VALUES
('B1', 'Shower Only', 1, 0),
('B2', 'Small', 0, 1),
('B3', 'Deluxe Bathroom', 1, 1),
('B4', 'Executive', 1, 1);

INSERT INTO room_price (room_type_code, bathroom_type_code, price) VALUES
('SI', 'B1', 60),
('SI', 'B2', 65),
('SIM', 'B2', 70),
('SIM', 'B3', 75),
('SIP', 'B2', 75),
('SIP', 'B3', 85),
('DO', 'B1', 80),
('DO', 'B2', 85),
('DOM', 'B1', 90),
('DOM', 'B2', 95),
('DOP', 'B3', 105),
('DOP', 'B4', 110),
('DOE', 'B4', 120),
('TW', 'B1', 75),
('TW', 'B2', 80),
('TWE', 'B4', 115),
('FA', 'B1', 100),
('FA', 'B3', 110),
('FAM', 'B2', 110),
('FAP', 'B2', 115),
('FAP', 'B3', 120),
('SUP', 'B3', 140),
('SUP', 'B4', 150),
('SUE', 'B4', 180);


INSERT INTO room (room_number, room_type_code, bathroom_type_code, status, key_serial_number) VALUES
(101, 'SI', 'B1', 'ACT', 'ABC12312'),
(102, 'SI', 'B2', 'ACT', 'BSD21432'),
(103, 'SIM', 'B3', 'ACT', 'JGF34673'),
(104, 'SIP', 'B2', 'CLN', 'PEH23563'),
(105, 'DO', 'B1', 'ACT', 'LWB32454'),
(106, 'DO', 'B2', 'ACT', 'MMD12134'),
(107, 'DOM', 'B1', 'ACT', 'FHG33445'),
(108, 'DOM', 'B2', 'ACT', 'OKD45563'),
(109, 'DOP', 'B3', 'CLN', 'KRW11465'),
(110, 'DOP', 'B3', 'ACT', 'KSJ73423'),
(111, 'DOP', 'B4', 'ACT', 'SSW22453'),
(112, 'DOE', 'B4', 'ACT', 'YTT22432'),
(201, 'DOE', 'B4', 'ACT', 'BBS11223'),
(202, 'TW', 'B1', 'ACT', 'GGS55442'),
(203, 'TW', 'B2', 'ACT', 'HHD11543'),
(204, 'TWE', 'B4', 'ACT', 'ZXX35672');

INSERT INTO complaint_category (category_code, category_name, severity) VALUES
('NO1', 'Noise', 2),
('NO2', 'Constant Noise', 4),
('RM1', 'Room Condition', 3),
('RM2', 'Bad Room Condition', 5),
('CS1', 'Poor Customer Service', 2),
('CS2', 'Slow Customer Service', 3),
('CS3', 'Rude Customer Service', 5),
('RE1', 'Reservation Issue', 3),
('RE2', 'Billing Query', 1),
('RE3', 'Billing Dispute', 5),
('SA1', 'Minor Safety Concern', 4),
('SA2', 'Major Safety Issue', 8);

INSERT INTO complaint (reservation_id, opened_date, category_code, opened_by, description) VALUES
(1, '2024-10-22 01:10:00', 'NO2', 3, 'Loud music from the next room during the night.'),
(1, '2024-10-23 09:15:00', 'RE2', 4, 'Discount not as big as expected.'),
(2, '2024-10-24 17:40:00', 'RM2', 4, 'Bathroom is not clean.');

INSERT INTO complaint_resolution (reservation_id, opened_date, resolved_by, resolution, resolution_date) VALUES
(1, '2024-10-22 01:10:00', 3, 'Visited the room making the noise. They switched off the radio and apologised', '2024-10-22 01:15:00'),
(1, '2024-10-23 09:15:00', 2, 'Explained that a 10% promotion code had been used. Guest thought it was 15%. Guest satisfied', '2024-10-23 09:45:00'),
(2, '2024-10-24 17:40:00', 5, 'Sent cleaner to the room immediately and gave guest a free drink while waiting', '2024-10-24 18:30:00');

INSERT INTO check_in (reservation_id, staff_id, date_time, notes) VALUES
(1, 2, '2024-10-21 16:14:00', NULL),
(2, 4, '2024-10-24 14:05:00', 'guest asked about the security of the car park'),
(3, 3, '2024-10-25 15:18:00', NULL),
(4, 3, '2024-10-26 18:51:00', 'advised guest about local restaurants');

INSERT INTO check_out (reservation_id, staff_id, date_time, settled_invoice, notes) VALUES
(1, 2, '2024-10-23 09:46:00', 1, 'Discussed complaints with guest during check out');

INSERT INTO cleaning_session (date_of_clean, staff_id, allocated_master_key) VALUES
('2024-10-21', 7, 'A'),
('2024-10-21', 8, 'C'),
('2024-10-22', 7, 'B'),
('2024-10-22', 8, 'C'),
('2024-10-23', 8, 'A'),
('2024-10-23', 9, 'F');

INSERT INTO room_clean (room_number, date_of_clean, staff_id, time_of_clean, type_of_clean) VALUES
(101, '2024-10-21', 7, '09:30', 'F'),
(102, '2024-10-21', 7, '10:00', 'L'),
(103, '2024-10-21', 7, '10:15', 'L'),
(201, '2024-10-21', 8, '09:30', 'F'),
(202, '2024-10-21', 8, '10:00', 'F'),
(203, '2024-10-21', 8, '10:30', 'L'),
(101, '2024-10-22', 7, '09:30', 'L'),
(102, '2024-10-22', 7, '09:45', 'F'),
(103, '2024-10-22', 7, '10:15', 'F'),
(201, '2024-10-22', 8, '09:30', 'L');

