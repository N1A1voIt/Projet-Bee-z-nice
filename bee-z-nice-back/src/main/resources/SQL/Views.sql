CREATE VIEW v_stock_last_lines AS SELECT * FROM stockByEstablishment WHERE id in (SELECT max(id) FROM stockByEstablishment GROUP BY idEstablishment,idDishes);
