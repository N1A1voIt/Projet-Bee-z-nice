CREATE VIEW v_stock_last_lines AS SELECT * FROM stockByEstablishment WHERE id in (SELECT max(id) FROM stockByEstablishment GROUP BY idEstablishment,idDishes);

SELECT * FROM dishes WHERE id NOT IN (SELECT d.id FROM dishes d LEFT JOIN dishesrating dr ON d.id = dr.iddishe WHERE idcustomer = 2);
SELECT d.*,mark FROM dishes d JOIN dishesrating dr ON d.id = dr.iddishe WHERE idcustomer = 2;