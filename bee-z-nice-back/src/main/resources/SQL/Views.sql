CREATE VIEW v_stock_last_lines AS SELECT * FROM stockByEstablishment WHERE id in (SELECT max(id) FROM stockByEstablishment GROUP BY idEstablishment,idDishes);

CREATE VIEW public.v_stockbyestablishment AS
 SELECT t2.id,
        t2.dishesname,
        t2.establishmentname as name,
        t2.remainingstock,
        t2.type,
        t2.movedate
 FROM (
     SELECT sbe.id,
            d.dishesname,
            e.name AS establishmentname,
            sbe.remainingstock,
            sbe.movedate,
            mt.type,
            ROW_NUMBER() OVER (PARTITION BY sbe.idestablishment, sbe.iddishes ORDER BY sbe.movedate DESC) AS rn
     FROM public.stockbyestablishment sbe
     JOIN public.dishes d ON sbe.iddishes = d.id
     JOIN public.establishment e ON sbe.idestablishment = e.id
     JOIN public.movementtype mt ON sbe.idmovementtype = mt.id
 ) t2
 WHERE t2.rn = 1;



SELECT * FROM stockbyEstablishment WHERE moveDate in (SELECT MAX(movedate) FROM stockByEstablishment GROUP BY idDishes,idEstablishment) AND moveDate <= '2024-03-06';

SELECT t.*
FROM stockbyEstablishment t
JOIN (
    SELECT idestablishment, iddishes, MAX(movedate) AS max_movedate
    FROM stockByEstablishment
    GROUP BY idestablishment, iddishes
) sub ON t.idestablishment = sub.idestablishment AND t.iddishes = sub.iddishes AND t.movedate = sub.max_movedate WHERE moveDate <= '2024-06-24 22:30:44.188';


SELECT * FROM dishes WHERE id NOT IN (SELECT d.id FROM dishes d LEFT JOIN dishesrating dr ON d.id = dr.iddishe WHERE idcustomer = 2);
SELECT d.*,mark FROM dishes d JOIN dishesrating dr ON d.id = dr.iddishe WHERE idcustomer = 2;