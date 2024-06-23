CREATE or REPLACE VIEW v_supplier_dish_sales AS
SELECT d.idsupplier AS idsupplier,
       s.namesupplier AS namesupplier,
       COUNT(*) AS dishes_sold,
       SUM(f.disheprice) AS total_revenue
FROM foodorder f
    JOIN dishes d ON f.iddishes = d.id
    JOIN supplier s ON d.idsupplier = s.id
GROUP BY d.idsupplier, s.namesupplier;

CREATE or REPLACE VIEW v_supplier_dish_sales AS
SELECT d.idsupplier AS idsupplier,
       s.namesupplier AS namesupplier,
       COUNT(*) AS dishes_sold,
       SUM(f.disheprice) AS total_revenue
FROM foodorder f
    JOIN dishes d ON f.iddishes = d.id
    JOIN supplier s ON d.idsupplier = s.id
    WHERE f.orderTime BETWEEN '2024-06-17' AND '2024-07-20'
GROUP BY d.idsupplier, s.namesupplier;

