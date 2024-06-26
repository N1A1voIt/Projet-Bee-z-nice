
create table supplierPayment(
    id bigserial primary key ,
    time timestamp,
    idunpayedstock bigint

);


create view v_stock_per_establishment as
select
    row_number() over () as id,
    dishesYear.idsupplier,
    dishesYear.month,
    dishesYear.year,
    sum(dishesYear.purchaseprice) as amount
    from(select
        extract(month from stock.movedate) as month,
        extract(year from stock.movedate) as year,
        dish.idsupplier,
        dish.purchaseprice
        from stockbyestablishment as stock
        join dishes as dish on stock.iddishes=dish.id
            where movedate<DATE_TRUNC('month', CURRENT_DATE) and stock.idmovementtype=1) as dishesYear
        group by month,idsupplier,year;

create view v_unpayed_stock as
select
    spe.id as id,
    spe.idsupplier as idsupplier,
    sup.namesupplier as namesupplier,
    spe.month,
    spe.year,
    spe.amount
from public.v_stock_per_establishment as spe join public.supplier as sup on spe.idsupplier=sup.id where spe.id not in(select idunpayedstock from supplierPayment);

-- UPDATE public.stockbyestablishment SET time = '2024-01-20 08:58:54.000000' WHERE id = 2;
-- UPDATE public.stockbyestablishment SET time = '2024-01-20 08:58:54.000000' WHERE id = 3;
-- UPDATE public.stockbyestablishment SET time = '2024-02-20 08:58:54.000000' WHERE id = 4;
-- UPDATE public.stockbyestablishment SET time = '2024-02-20 08:58:54.000000' WHERE id = 5;
-- UPDATE public.stockbyestablishment SET time = '2024-02-20 08:58:54.000000' WHERE id = 6;
-- UPDATE public.stockbyestablishment SET time = '2024-03-20 08:58:54.000000' WHERE id = 7;
-- UPDATE public.stockbyestablishment SET time = '2024-03-20 08:58:54.000000' WHERE id = 8;
-- UPDATE public.stockbyestablishment SET time = '2024-03-20 08:58:54.000000' WHERE id = 9;
-- UPDATE public.stockbyestablishment SET time = '2024-04-20 08:58:54.000000' WHERE id = 10;
-- UPDATE public.stockbyestablishment SET time = '2024-05-20 08:58:54.000000' WHERE id = 11;
-- UPDATE public.stockbyestablishment SET time = '2024-05-20 08:58:54.000000' WHERE id = 12;
-- UPDATE public.stockbyestablishment SET time = '2024-05-20 08:58:54.000000' WHERE id = 13;
-- UPDATE public.stockbyestablishment SET time = '2024-06-20 08:58:54.000000' WHERE id = 14;
-- UPDATE public.stockbyestablishment SET time = '2024-06-20 08:58:54.000000' WHERE id = 15;
-- UPDATE public.stockbyestablishment SET time = '2024-06-20 08:58:54.000000' WHERE id = 32;
-- UPDATE public.stockbyestablishment SET time = '2024-06-20 08:58:54.000000' WHERE id = 33;
-- UPDATE public.stockbyestablishment SET time = '2024-04-20 08:58:54.000000' WHERE id = 34;
-- UPDATE public.stockbyestablishment SET time = '2024-04-20 08:58:54.000000' WHERE id = 35;


-- top 3 dishes
SELECT
    iddishe,
    AVG(mark) AS avg_mark
FROM
    dishesrating
GROUP BY
    iddishe
ORDER BY
    avg_mark DESC
LIMIT 3;

SELECT DATE_TRUNC('month', CURRENT_DATE) AS first_day_of_month;
