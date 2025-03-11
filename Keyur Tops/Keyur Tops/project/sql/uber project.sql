CREATE DATABASE uber_prjct;
USE uber_prjct;

CREATE TABLE d_info (
    d_id INT PRIMARY KEY,
    d_fname VARCHAR(20) NOT NULL,
    d_lname VARCHAR(20) NOT NULL,
    d_pno VARCHAR(15) NOT NULL,
    d_vtype VARCHAR(10) NOT NULL,
    d_vnoplate VARCHAR(15) NOT NULL UNIQUE,
    d_status ENUM("available", "busy") NOT NULL DEFAULT "available",
    d_location FLOAT NOT NULL,
    d_rating FLOAT
);

CREATE TABLE c_info (
    c_id INT AUTO_INCREMENT PRIMARY KEY,
    c_fname VARCHAR(20) NOT NULL,
    c_lname VARCHAR(20) NOT NULL,
    c_pno VARCHAR(15) NOT NULL,
    c_homelocation FLOAT NOT NULL,
    c_curlocation FLOAT NOT NULL,
    c_paymethod VARCHAR(20) NOT NULL
);

CREATE TABLE rides (
    ride_id INT AUTO_INCREMENT PRIMARY KEY,
    d_id INT NOT NULL,
    c_id INT NOT NULL,
    pickup_location FLOAT NOT NULL,
    drop_location FLOAT NOT NULL,
    fare FLOAT NOT NULL,
    ride_status ENUM('completed', 'cancelled') NOT NULL,
    ride_date DATETIME NOT NULL,
    FOREIGN KEY (d_id) REFERENCES d_info(d_id) ON DELETE CASCADE,
    FOREIGN KEY (c_id) REFERENCES c_info(c_id) ON DELETE CASCADE
);

INSERT INTO d_info (d_id, d_fname, d_lname, d_pno, d_vtype, d_vnoplate, d_status, d_location, d_rating)
VALUES 
(1, 'Rajesh', 'Shah', '9876543210', 'Car', 'GJ12AB1234', 'available', 22.3047, 4.5),
(2, 'Amit', 'Patel', '9765432109', 'Bike', 'GJ01CD5678', 'busy', 22.4621, 4.2),
(3, 'Sunita', 'Verma', '9876501234', 'Car', 'GJ3CAC6789', 'available', 23.0305, 4.3),
(4, 'Neel', 'Chavda', '9123456780', 'Scooter', 'GJ05EF9012', 'busy', 21.1818, 4.7),
(5, 'Manoj', 'Vyas', '9912345678', 'Car', 'GJ32GH3456', 'available', 22.2600, 4.4),
(6, 'Vijay', 'Patel', '9234567890', 'Car', 'GJ09IJ7890', 'available', 21.7415, 4.8),
(7, 'Kiran', 'Brambhat', '9345678901', 'Bike', 'GJ07KL1234', 'busy', 23.2121, 4.1),
(8, 'Arjun', 'Kapoor', '9456789012', 'Car', 'GJ14MN5678', 'available', 22.6941, 4.5),
(9, 'Neha', 'Mehta', '9567890123', 'Scooter', 'GJ26OP7890', 'busy', 22.7996, 4.6),
(10, 'Sandeep', 'Chauhan', '9678901234', 'Car', 'GJ10QR1234', 'available', 22.5484, 4.2),
(11, 'Lakshmi', 'Kurkure', '9789012345', 'Car', 'GJ01ST5678', 'available', 20.9517, 4.3),
(12, 'Ravi', 'Chatterjee', '9890123456', 'Scooter', 'GJ01UV9012', 'busy', 21.5318, 4.1),
(13, 'Meera', 'Chips', '9901234567', 'Car', 'GJ02WX3456', 'available', 22.3093, 4.7),
(14, 'Kavita', 'Joshi', '9812345678', 'Bike', 'GJ4CAB6789', 'busy', 23.0195, 4.4),
(15, 'Vikas', 'Agarwal', '9823456789', 'Car', 'GJ05YZ1234', 'available', 22.3074, 4.5);

INSERT INTO c_info (c_id, c_fname, c_lname, c_pno, c_homelocation, c_curlocation, c_paymethod)
VALUES 
(1, 'priya', 'rathod', '9123456789', 22.3072, 22.3047, 'UPI'),
(2, 'keyur', 'patel', '9234567890', 22.4707, 22.4621, 'Cash'),
(3, 'sandeep', 'tundiya', '9345678901', 23.0225, 23.0305, 'Credit Card'),
(4, 'Soham', 'Desai', '9456789012', 21.1702, 21.1818, 'Debit Card'),
(5, 'muslim', 'sheikh', '9567890123', 22.2732, 22.2600, 'UPI'),
(6, 'Vishal', 'Trivedi', '9678901234', 21.7645, 21.7415, 'Cash'),
(7, 'Shreya', 'Joshi', '9789012345', 23.2156, 23.2121, 'Credit Card'),
(8, 'Aravind', 'Chaudhary', '9890123456', 22.6902, 22.6941, 'Debit Card'),
(9, 'Ritika', 'Modi', '9901234567', 22.8195, 22.7996, 'UPI'),
(10, 'smit', 'shah', '9812345678', 22.5292, 22.5484, 'Cash'),
(11, 'Lakshmi', 'Patel', '9723456789', 20.9467, 20.9517, 'Credit Card'),
(12, 'Harsha', 'Shukla', '9634567890', 21.5242, 21.5318, 'Debit Card'),
(13, 'Geeta', 'Vyas', '9545678901', 22.3043, 22.3093, 'UPI'),
(14, 'Ajay', 'Gohil', '9456789012', 23.0231, 23.0195, 'Cash'),
(15, 'Tara', 'Pandya', '9367890123', 22.3099, 22.3074, 'Credit Card');

INSERT INTO rides (d_id, c_id, pickup_location, drop_location, fare, ride_status, ride_date)
VALUES 
(1, 1, 22.3072, 22.4621, 150.00, 'completed', '2024-10-28 09:30:00'),
(1, 2, 22.3072, 22.2600, 120.00, 'completed', '2024-10-28 10:00:00'),
(2, 3, 22.4707, 23.0305, 250.00, 'completed', '2024-10-28 10:30:00'),
(3, 4, 21.1702, 21.5318, 200.00, 'completed', '2024-10-28 11:00:00'),
(2, 5, 22.2600, 20.9517, 180.00, 'cancelled', '2024-10-28 11:30:00'),
(4, 6, 22.7996, 21.7415, 220.00, 'completed', '2024-10-28 12:00:00'),
(5, 7, 21.5318, 23.2156, 160.00, 'completed', '2024-10-28 12:30:00'),
(6, 8, 22.6902, 22.3043, 140.00, 'completed', '2024-10-28 13:00:00'),
(7, 9, 22.5292, 22.9195, 210.00, 'completed', '2024-10-28 13:30:00'),
(8, 10, 22.7996, 20.9517, 170.00, 'completed', '2024-10-28 14:00:00'),
(9, 11, 20.9517, 22.3043, 130.00, 'cancelled', '2024-10-28 14:30:00'),
(10, 12, 22.9195, 22.8195, 150.00, 'completed', '2024-10-28 15:00:00'),
(11, 13, 22.5100, 22.4000, 190.00, 'completed', '2024-10-28 15:30:00'),
(12, 14, 21.3500, 22.2041, 210.00, 'completed', '2024-10-28 16:00:00'),
(13, 15, 20.9500, 22.1000, 175.00, 'completed', '2024-10-28 16:30:00');


