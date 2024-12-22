CREATE TABLE company_account (
    company_id INT(11) NOT NULL AUTO_INCREMENT,
    company_name VARCHAR(255) NOT NULL,
    building VARCHAR(50) NOT NULL,
    postcode VARCHAR(7) NOT NULL,
    admin_title VARCHAR(10) NOT NULL,
    admin_first_name VARCHAR(80) NOT NULL,
    admin_last_name VARCHAR(80) NOT NULL,
    admin_phone_number VARCHAR(11) NOT NULL,
    admin_email VARCHAR(320) NOT NULL,
    PRIMARY KEY (company_id)
);

CREATE TABLE guest (
    guest_id INT(11) NOT NULL AUTO_INCREMENT,
    company_id INT(11),
    title VARCHAR(10) NOT NULL,
    first_name VARCHAR(80) NOT NULL,
    last_name VARCHAR(80) NOT NULL,
    phone_number VARCHAR(11) NOT NULL,
    email VARCHAR(320) NOT NULL,
    house_name_number VARCHAR(50) NOT NULL,
    postcode VARCHAR(7) NOT NULL,
    PRIMARY KEY (guest_id)
);

CREATE TABLE invoice (
    invoice_number MEDIUMINT(9) NOT NULL AUTO_INCREMENT,
    invoice_date DATE NOT NULL,
    amount_due DECIMAL(7, 2) NOT NULL,
    amount_paid DECIMAL(7, 2) NOT NULL,
    payment_method VARCHAR(20),
    payment_date DATE,
    PRIMARY KEY (invoice_number)
);

CREATE TABLE promotion (
    promotion_code CHAR(10) NOT NULL,
    promotion_name VARCHAR(50) NOT NULL,
    discount_percentage DECIMAL(5, 2) NOT NULL,
    PRIMARY KEY (promotion_code)
);

CREATE TABLE reservation (
    reservation_id INT(11) NOT NULL AUTO_INCREMENT,
    guest_id INT(11) NOT NULL,
    room_number SMALLINT(6) NOT NULL,
    invoice_number MEDIUMINT(9),
    promotion_code CHAR(10),
    reservation_staff_id SMALLINT(6) NOT NULL,
    reservation_date_time DATETIME NOT NULL,
    number_of_guests TINYINT(3) NOT NULL,
    start_of_stay DATE NOT NULL,
    length_of_stay SMALLINT(6) NOT NULL,
    status_code CHAR(2) NOT NULL COMMENT 'RE - reserved, IN - checked in, OT - checked out',
    PRIMARY KEY (reservation_id)
);

CREATE TABLE room (
    room_number SMALLINT(6) NOT NULL AUTO_INCREMENT,
    room_type_code CHAR(3) NOT NULL,
    bathroom_type_code CHAR(2) NOT NULL,
    status CHAR(3) NOT NULL COMMENT 'ACT = room active, CLN = room requires deep cleaning, REP = room requires repair',
    key_serial_number VARCHAR(15) NOT NULL,
    PRIMARY KEY (room_number)
);

CREATE TABLE staff (
    staff_id SMALLINT(6) NOT NULL AUTO_INCREMENT,
    manager_id SMALLINT(6),
    title VARCHAR(10) NOT NULL,
    first_name VARCHAR(80) NOT NULL,
    last_name VARCHAR(80) NOT NULL,
    role VARCHAR(15) NOT NULL,
    PRIMARY KEY (staff_id)
);

CREATE TABLE room_type (
    room_type_code CHAR(3) NOT NULL COMMENT 'SI Single, DO Double, TW Twin, FA Family, SU Suite',
    room_type_name VARCHAR(25) NOT NULL,
    modern_style TINYINT(3) NOT NULL,
    deluxe TINYINT(3) NOT NULL,
    maximum_guests TINYINT(3) NOT NULL,
    PRIMARY KEY (room_type_code)
);

CREATE TABLE room_price (
    room_type_code CHAR(3) NOT NULL,
    bathroom_type_code CHAR(2) NOT NULL,
    price DECIMAL(6, 2) NOT NULL,
    PRIMARY KEY (room_type_code, bathroom_type_code)
);

CREATE TABLE check_in (
    reservation_id INT(11) NOT NULL,
    staff_id SMALLINT(6) NOT NULL,
    date_time DATETIME NOT NULL,
    notes VARCHAR(255),
    PRIMARY KEY (reservation_id)
);

CREATE TABLE check_out (
    reservation_id INT(11) NOT NULL,
    staff_id SMALLINT(6) NOT NULL,
    date_time DATETIME NOT NULL,
    settled_invoice TINYINT(3) NOT NULL COMMENT 'Indicates whether they settled the invoice at the time of check-out.',
    notes VARCHAR(255),
    PRIMARY KEY (reservation_id)
);

CREATE TABLE marketing (
    guest_id INT(11) NOT NULL,
    marketing_code CHAR(3) NOT NULL,
    contact_by_phone TINYINT(3) NOT NULL,
    contact_by_email TINYINT(3) NOT NULL,
    contact_by_post TINYINT(3) NOT NULL,
    PRIMARY KEY (guest_id)
);

CREATE TABLE complaint_category (
    category_code CHAR(4) NOT NULL,
    category_name VARCHAR(80) NOT NULL,
    severity INT(11) NOT NULL,
    PRIMARY KEY (category_code)
);

CREATE TABLE bathroom_type (
    bathroom_type_code CHAR(2) NOT NULL,
    bathroom_type_name VARCHAR(50) NOT NULL,
    seperate_shower TINYINT(3) NOT NULL,
    bath TINYINT(3) NOT NULL,
    PRIMARY KEY (bathroom_type_code)
);

CREATE TABLE room_clean (
    room_number SMALLINT(6) NOT NULL,
    date_of_clean DATE NOT NULL,
    staff_id SMALLINT(6) NOT NULL,
    time_of_clean TIME NOT NULL,
    type_of_clean CHAR(1) NOT NULL COMMENT 'L = Light, F = Full',
    PRIMARY KEY (room_number, date_of_clean)
) COMMENT='A room gets cleaned once a day, sometimes a light clean, sometimes requires a full clean. Time relates to the time of the clean.';

CREATE TABLE address (
    postcode VARCHAR(7) NOT NULL,
    address_line1 VARCHAR(80) NOT NULL,
    address_line2 VARCHAR(80),
    city VARCHAR(80) NOT NULL,
    county VARCHAR(80) NOT NULL,
    PRIMARY KEY (postcode)
);

CREATE TABLE cleaning_session (
    date_of_clean DATE NOT NULL,
    staff_id SMALLINT(6) NOT NULL,
    allocated_master_key CHAR(1) NOT NULL,
    PRIMARY KEY (date_of_clean, staff_id)
);

CREATE TABLE complaint (
    reservation_id INT(11) NOT NULL,
    opened_date DATETIME NOT NULL,
    category_code CHAR(4) NOT NULL,
    opened_by SMALLINT(6) NOT NULL,
    description VARCHAR(255) NOT NULL,
    PRIMARY KEY (reservation_id, opened_date)
);

CREATE TABLE complaint_resolution (
    reservation_id INT(11) NOT NULL,
    opened_date DATETIME NOT NULL,
    resolved_by SMALLINT(6) NOT NULL,
    resolution VARCHAR(255) NOT NULL,
    resolution_date DATETIME NOT NULL,
    PRIMARY KEY (reservation_id, opened_date)
);

CREATE INDEX idx_guest_company ON guest (company_id);
CREATE INDEX idx_reservation_promotion ON reservation (promotion_code);
CREATE INDEX idx_reservation_guest ON reservation (guest_id);
CREATE INDEX idx_reservation_staff ON reservation (reservation_staff_id);
CREATE INDEX idx_reservation_invoice ON reservation (invoice_number);
CREATE INDEX idx_complaint_opened_by ON complaint (opened_by);

ALTER TABLE complaint ADD CONSTRAINT FK_complaint_opened_by FOREIGN KEY (opened_by) REFERENCES staff (staff_id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE guest ADD CONSTRAINT FK_guest_company FOREIGN KEY (company_id) REFERENCES company_account (company_id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE reservation ADD CONSTRAINT FK_reservation_invoice FOREIGN KEY (invoice_number) REFERENCES invoice (invoice_number) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE reservation ADD CONSTRAINT FK_reservation_promotion FOREIGN KEY (promotion_code) REFERENCES promotion (promotion_code) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE reservation ADD CONSTRAINT FK_reservation_guest FOREIGN KEY (guest_id) REFERENCES guest (guest_id);
ALTER TABLE room ADD CONSTRAINT FK_room_type FOREIGN KEY (room_type_code, bathroom_type_code) REFERENCES room_price (room_type_code, bathroom_type_code);
ALTER TABLE room_price ADD CONSTRAINT FK_room_type_fk FOREIGN KEY (room_type_code) REFERENCES room_type (room_type_code);
ALTER TABLE check_in ADD CONSTRAINT FK_check_in_staff FOREIGN KEY (staff_id) REFERENCES staff (staff_id);
ALTER TABLE check_in ADD CONSTRAINT FK_check_in_reservation FOREIGN KEY (reservation_id) REFERENCES reservation (reservation_id);
ALTER TABLE check_out ADD CONSTRAINT FK_check_out_reservation FOREIGN KEY (reservation_id) REFERENCES reservation (reservation_id);
ALTER TABLE check_out ADD CONSTRAINT FK_check_out_staff FOREIGN KEY (staff_id) REFERENCES staff (staff_id);
ALTER TABLE marketing ADD CONSTRAINT FK_marketing_guest FOREIGN KEY (guest_id) REFERENCES guest (guest_id);
ALTER TABLE complaint_resolution ADD CONSTRAINT FK_complaint_resolution_resolved_by FOREIGN KEY (resolved_by) REFERENCES staff (staff_id);
ALTER TABLE staff ADD CONSTRAINT FK_staff_manager FOREIGN KEY (manager_id) REFERENCES staff (staff_id);
ALTER TABLE complaint ADD CONSTRAINT FK_complaint_category FOREIGN KEY (category_code) REFERENCES complaint_category (category_code);
ALTER TABLE room_price ADD CONSTRAINT FK_room_price_bathroom FOREIGN KEY (bathroom_type_code) REFERENCES bathroom_type (bathroom_type_code);
ALTER TABLE room_clean ADD CONSTRAINT FK_room_clean_room FOREIGN KEY (room_number) REFERENCES room (room_number);
ALTER TABLE guest ADD CONSTRAINT FK_guest_address FOREIGN KEY (postcode) REFERENCES address (postcode);
ALTER TABLE company_account ADD CONSTRAINT FK_company_account_address FOREIGN KEY (postcode) REFERENCES address (postcode);
ALTER TABLE cleaning_session ADD CONSTRAINT FK_cleaning_session_staff FOREIGN KEY (staff_id) REFERENCES staff (staff_id);
ALTER TABLE room_clean ADD CONSTRAINT FK_room_clean_session FOREIGN KEY (date_of_clean, staff_id) REFERENCES cleaning_session (date_of_clean, staff_id);
ALTER TABLE complaint_resolution ADD CONSTRAINT FK_complaint_resolution FOREIGN KEY (reservation_id, opened_date) REFERENCES complaint (reservation_id, opened_date);
ALTER TABLE complaint ADD CONSTRAINT FK_complaint_reservation FOREIGN KEY (reservation_id) REFERENCES reservation (reservation_id) ON UPDATE RESTRICT ON DELETE RESTRICT;

-- ALTER TABLE staff  MODIFY manager_id SMALLINT NULL;
