# car-dealership-database

### What is it?
>This database project manages information for a car dealership, including dealerships, vehicles, inventory, sales contracts, and lease contracts.
Features:

    - Manage dealerships, vehicles, and inventory
    - Track sales contracts and lease contracts
    - Query vehicles by dealership, make, and model
    - Query sales contracts by dealership and date range

## Interest Piece: Join
> This query uses a subquery to retrieve the dealership_id of 'Dealership 1', and then joins the vehicles table with the inventory table on the VIN column to retrieve the vehicles associated with that dealership. It's a neat example of how joins and subqueries can be used to retrieve specific data from multiple tables!
```sql
SELECT v.*
FROM vehicles v
JOIN inventory i ON v.VIN = i.VIN
WHERE i.dealership_id = (
  SELECT dealership_id
  FROM dealerships
  WHERE name = 'Dealership 1'
);
```