

INSERT INTO products( name,category,pprice,stock,sku,description)
VALUES('tem product','electronics',234,64,'ELEC-TEMP=013','KUCH HAI TO JOO ABB DELETE HONE WALA HAI ')

SELECT name,category,sku 
FROM products
WHERE sku = 'ELEC-TEMP-013';

DELETE FROM products 
WHERE sku = 'ELEC-TEMP-013';

SELECT name,category,sku 
FROM products
WHERE sku = 'ELEC-TEMP-013';