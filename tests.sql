SELECT * 
FROM dealerships;


SELECT v.* 
FROM vehicles v 
JOIN inventory i ON v.VIN = i.VIN 
WHERE i.dealership_id = (
  SELECT dealership_id 
  FROM dealerships 
  WHERE name = 'Dealership 1'
);


SELECT * 
FROM vehicles 
WHERE VIN = '1FMCU0GD3CKA12345';


SELECT * 
FROM dealerships 
WHERE dealership_id = (
SELECT
 dealership_id 
 FROM inventory 
 WHERE VIN = '1FMCU0GD3CKA12345'
 );

SELECT *
FROM dealerships 
WHERE 
dealership_id IN
(
SELECT dealership_id 
FROM vehicles 
WHERE make = 'Ford'
);



SELECT * 
FROM sales_contracts 
WHERE dealership_id = 
(
SELECT dealership_id 
FROM dealerships 
WHERE name = 'Dealership 1') 
AND sale_date 
BETWEEN '2022-01-01' 
AND '2022-12-31';


