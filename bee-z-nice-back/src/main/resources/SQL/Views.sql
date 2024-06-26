CREATE VIEW v_stock_last_lines AS SELECT * FROM stockByEstablishment WHERE id in (SELECT max(id) FROM stockByEstablishment GROUP BY idEstablishment,idDishes);

CREATE VIEW v_top3_dishesrating as SELECT dishes.*, COALESCE(CAST(AVG(dishesrating.mark) as DECIMAL(3,2)),0) AS avg_mark FROM dishes LEFT JOIN dishesrating ON dishes.id = dishesrating.iddishe GROUP BY dishes.id ORDER BY avg_mark DESC LIMIT 3;

CREATE VIEW public.v_customersmoney AS
 SELECT t0.id,
    t0.nameemployee,
    t0.virtualamount,
    t0.datedeposit
   FROM ( SELECT customersmoney.id,
            establismentemployee.nameemployee,
            customersmoney.virtualamount,customersmoney.datedeposit
           FROM (public.customersmoney
             JOIN public.establismentemployee ON (((customersmoney.idcustomer)::text = (establismentemployee.id)::text)))) t0;


CREATE VIEW v_stockbyestablishment as
SELECT
    stockbyestablishment.id,
    dishes.dishesname,
    establishment.name,
    stockbyestablishment.remainingstock,
    movementtype.type,
    stockByEstablishment.movedate
FROM
    public.stockbyestablishment
LEFT JOIN public.dishes ON stockbyestablishment.iddishes = dishes.id
LEFT JOIN public.establishment ON stockbyestablishment.idestablishment = establishment.id
LEFT JOIN public.movementtype ON stockbyestablishment.idmovementtype = movementtype.id;

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