drop database if exists car_dealerships;

CREATE database car_dealerships;

USE car_dealerships;

CREATE TABLE dealerships (
  dealership_id INT AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  address VARCHAR(50) NOT NULL,
  phone VARCHAR(12) NOT NULL,
  PRIMARY KEY (dealership_id)
);

INSERT INTO  dealerships (name, address, phone)
VALUES
  ('Dealership 1', '123 Main St', '555-1234'),
  ('Dealership 2', '456 Elm St', '555-5678'),
  ('Dealership 3', '789 Oak St', '555-9012');

CREATE TABLE vehicles (
  VIN VARCHAR(17) PRIMARY KEY,
  make VARCHAR(20) NOT NULL,
  model VARCHAR(20) NOT NULL,
  year INT,
  price DECIMAL(10, 2),
  color VARCHAR(20),
  SOLD BOOLEAN DEFAULT FALSE
);
INSERT INTO vehicles (VIN, make, model, year, price, color)
VALUES
  ('1FMCU0GD3CKA12345', 'Ford', 'F-150', 2020, 35000.00, 'Red'),
  ('1C4RDHBGXEC123456', 'Chrysler', 'Pacific', 2018, 22000.00, 'Blue'),
  ('1FTFW1RG3CKA12347', 'Ford', 'F-250', 2022, 45000.00, 'White');
  
-- Create inventory table
CREATE TABLE inventory (
  dealership_id INT,
  VIN VARCHAR(17),
  FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id),
  FOREIGN KEY (VIN) REFERENCES vehicles(VIN),
  PRIMARY KEY (dealership_id, VIN)
);

INSERT INTO inventory (dealership_id, VIN)
VALUES
  (1, '1FMCU0GD3CKA12345'),
  (1, '1C4RDHBGXEC123456'),
  (2, '1FTFW1RG3CKA12347');

-- Create sales_contracts table
CREATE TABLE sales_contracts (
  id INT AUTO_INCREMENT PRIMARY KEY,
  VIN VARCHAR(17),
  customer_name VARCHAR(50),
  sale_date DATE,
  sale_price DECIMAL(10, 2),
  dealership_id INT,
  FOREIGN KEY (VIN) REFERENCES vehicles(VIN),
  FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id)
);
INSERT INTO sales_contracts (VIN, customer_name, sale_date, sale_price, dealership_id)
VALUES
  ('1FMCU0GD3CKA12345', 'John Doe', '2022-01-01', 32000.00, 1),
  ('1C4RDHBGXEC123456', 'Jane Smith', '2022-02-01', 20000.00, 1);

-- Create lease_contracts table (optional)
CREATE TABLE lease_contracts (
  id INT AUTO_INCREMENT PRIMARY KEY,
  VIN VARCHAR(17),
  customer_name VARCHAR(50),
  lease_start DATE,
  lease_end DATE,
  monthly_payment DECIMAL(10, 2),
  dealership_id INT,
  FOREIGN KEY (VIN) REFERENCES vehicles(VIN),
  FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id)
);

INSERT INTO lease_contracts (VIN, customer_name, lease_start, lease_end, monthly_payment, dealership_id)
VALUES
  ('1FTFW1RG3CKA12347', 'Bob Johnson', '2022-03-01', '2025-03-01', 500.00, 2);
