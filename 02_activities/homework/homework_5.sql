-- Cross Join
/*1. Suppose every vendor in the `vendor_inventory` table had 5 of each of their products to sell to **every** 
customer on record. How much money would each vendor make per product? 
Show this by vendor_name and product name, rather than using the IDs.

HINT: Be sure you select only relevant columns and rows. 
Remember, CROSS JOIN will explode your table rows, so CROSS JOIN should likely be a subquery. 
Think a bit about the row counts: how many distinct vendors, product names are there (x)?
How many customers are there (y). 
Before your final group by you should have the product of those two queries (x*y).  */

DROP TABLE if EXISTS vendor_product;
CREATE TEMP TABLE vendor_product As
SELECT v.vendor_name, p.product_name, vi.original_price
FROM vendor_inventory as vi
JOIN product as p
on vi.product_id = p.product_id
join vendor as v
on v.vendor_id = vi.vendor_id;

DROP TABLE if EXISTS customer_count;
CREATE TEMP TABLE customer_count As
SELECT count(Distinct customer_id) as total_customer
FROM customer;

SELECT vendor_name, product_name,
original_price * 5 * total_customer  as total_profit
FROM vendor_product
CROSS JOIN customer_count
GROUP by vendor_name, product_name;

-- INSERT
/*1.  Create a new table "product_units". 
This table will contain only products where the `product_qty_type = 'unit'`. 
It should use all of the columns from the product table, as well as a new column for the `CURRENT_TIMESTAMP`.  
Name the timestamp column `snapshot_timestamp`. */

DROP table if EXISTS product_units;
CREATE temp TABLE product_units As
SELECT * , CURRENT_TIMESTAMP as snapshot_timestamp
FROM product
WHERE product_qty_type = 'unit'
ORDER by product_id;

/*2. Using `INSERT`, add a new row to the product_units table (with an updated timestamp). 
This can be any product you desire (e.g. add another record for Apple Pie). */

INSERT INTO product_units
VALUES( 24 , 'Maple Syrup' , '8 oz' , 2 , 'unit' , CURRENT_TIMESTAMP);
SELECT *
FROM product_units;

-- DELETE
/* 1. Delete the older record for the whatever product you added. 

HINT: If you don't specify a WHERE clause, you are going to have a bad time.*/

DELETE FROM product_units
WHERE product_id = 24;
 SELECT *
 FROM product_units;

-- UPDATE
/* 1.We want to add the current_quantity to the product_units table. 
First, add a new column, current_quantity to the table using the following syntax.

ALTER TABLE product_units
ADD current_quantity INT;

Then, using UPDATE, change the current_quantity equal to the last quantity value from the vendor_inventory details.

HINT: This one is pretty hard. 
First, determine how to get the "last" quantity per product. 
Second, coalesce null values to 0 (if you don't have null values, figure out how to rearrange your query so you do.) 
Third, SET current_quantity = (...your select statement...), remembering that WHERE can only accommodate one column. 
Finally, make sure you have a WHERE statement to update the right row, 
	you'll need to use product_units.product_id to refer to the correct row within the product_units table. 
When you have all of these components, you can run the update statement. */

ALTER TABLE product_units
ADD current_quantity INT;

UPDATE product_units
SET current_quantity = coalesce (
(
	SELECT x.quantity
	FROM product_units as pu
	Left JOIN 
			(
			SELECT product_id, quantity
			FROM
					(
					SELECT product_id, quantity
					,row_number() over(PARTITION by product_id ORDER by market_date DESC) as last_quantity
					FROM vendor_inventory
					) 
			WHERE last_quantity = 1
			) x
	on pu.product_id = x.product_id
	WHERE x.product_id = product_units.product_id
	),0
);
SELECT *
FROM product_units;
