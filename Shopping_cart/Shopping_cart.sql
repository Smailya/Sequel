CREATE TABLE PUBLIC.product(

    product_id bigserial PRIMARY KEY NOT NULL,
    description varchar(60),
    price money
   
);
INSERT INTO PUBLIC.product(description, price)
VALUES('Laptop_Lenovo', 15000),
      ('Headsets', 1000),
      ('Lenovo_Charger', 3000),
      ('Bluetooth_Mouse', 800),
      ('Laptop_Hp', 25000),
      ('Macbook_pro', 35000);
      
      SELECT * FROM PUBLIC.product
---Cart Table

CREATE TABLE PUBLIC.cart(
     product_id bigint PRIMARY KEY NOT NULL,
    quantity int CHECK (quantity >= 0) --to stop negative values as input  
);
      
INSERT INTO PUBLIC.cart( product_id, quantity)
VALUES (1,5),
      (2,12),
      (3,17),
      (4,50),
      (5,4),
      (6,30);
      
 SELECT * FROM PUBLIC.cart   
 
 --Displaying the cart
  SELECT description, quantity, price, quantity * price as subtotal FROM cart
 INNER JOIN product ON cart.product_id = product.product_id;
 
 --The ground total
 SELECT sum(cart.quantity * product.price) as grandtotal FROM cart
 INNER JOIN product on product.product_id = cart.product_id;
 
 ---dELETE
 DELETE FROM cart WHERE cart.quantity <= 0;
 
 --ADD TO CART
 
UPDATE cart SET cart.quantity = cart.quantity+1
WHERE EXISTS (SELECT * FROM cart c WHERE c.product_id=2)
AND cart.product_id = 2;
--RAISE NOTICE 'it does not exist yet, it is a new product'

 --SHOW CART
  SELECT description, quantity, price, quantity * price as subtotal FROM cart
 INNER JOIN product ON cart.product_id = product.product_id;
 
 --Remove from cart
 
 UPDATE cart SET cart.quantity = cart.quantity -1
WHERE EXISTS (SELECT * FROM cart c WHERE c.product_id=2)
AND cart.product_id = 2;
 
 --SHOW CART
  SELECT description, quantity, price, quantity * price as subtotal FROM cart
 INNER JOIN product ON cart.product_id = product.product_id;
 
----- Checking if the product is not in the cart, if it exist it will add it if not it won't
SELECT product.product_id, description, quantity, price, quantity * price as subtotal FROM cart
 INNER JOIN product ON cart.product_id = product.product_id;

insert into cart(product_id, quantity)
select 6, 1
where not exists (
    select 1 from cart where product_id = 6
);

----- Checking if the product is not in the cart, if it exist it will add it if not it won't
SELECT product.product_id, description, quantity, price, quantity * price as subtotal FROM cart
 INNER JOIN product ON cart.product_id = product.product_id;

--SHOW CART
  SELECT description, quantity, price, quantity * price as subtotal FROM cart
 INNER JOIN product ON cart.product_id = product.product_id;

---Calling function;
SELECT public.checking(2);




create or replace function public.checking(p int)
   returns int
   language plpgsql
  as
$$
declare 

quantity int;
product int;

-------------


-- variable declaration
begin
  IF product_id = 1 THEN 
 UPDATE cart SET cart.quantity = cart.quantity+1
WHERE EXISTS (SELECT 1 FROM cart c WHERE c.product_id=1)
AND cart.product_id = 1;

ELSE

RAISE NOTICE 'it does not exist yet, it is a new product' ;
--UPDATE cart SET cart.quantity = cart.quantity+1
--WHERE EXISTS (SELECT 1 FROM cart c WHERE c.product_id=1)
--AND cart.product_id = 1

END IF;

end ;
$$