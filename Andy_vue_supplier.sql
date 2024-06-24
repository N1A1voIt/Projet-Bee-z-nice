
create table supplierPaymentHistory (
    id bigserial primary key ,
    time timestamp,
    idunpayedstock bigint

);

ALTER table stockbyestablishment add column time timestamp;


ALTER table stockbyestablishment add column time timestamp;



select
    dishesYear.idsupplier,
    dishesYear.month,
    sum(dishesYear.purchaseprice)
    from(select
        extract(month from stock.time) as month,
        dish.idsupplier,
        dish.purchaseprice
        from stockbyestablishment as stock
        join dishes as dish on stock.iddishes=dish.id
            where extract(year from time)=extract(year from current_date) and stock.idmovementtype=1) as dishesYear
        group by month,idsupplier;


UPDATE public.stockbyestablishment SET time = '2024-01-20 08:58:54.000000' WHERE id = 2;
UPDATE public.stockbyestablishment SET time = '2024-01-20 08:58:54.000000' WHERE id = 3;
UPDATE public.stockbyestablishment SET time = '2024-02-20 08:58:54.000000' WHERE id = 4;
UPDATE public.stockbyestablishment SET time = '2024-02-20 08:58:54.000000' WHERE id = 5;
UPDATE public.stockbyestablishment SET time = '2024-02-20 08:58:54.000000' WHERE id = 6;
UPDATE public.stockbyestablishment SET time = '2024-03-20 08:58:54.000000' WHERE id = 7;
UPDATE public.stockbyestablishment SET time = '2024-03-20 08:58:54.000000' WHERE id = 8;
UPDATE public.stockbyestablishment SET time = '2024-03-20 08:58:54.000000' WHERE id = 9;
UPDATE public.stockbyestablishment SET time = '2024-04-20 08:58:54.000000' WHERE id = 10;
UPDATE public.stockbyestablishment SET time = '2024-05-20 08:58:54.000000' WHERE id = 11;
UPDATE public.stockbyestablishment SET time = '2024-05-20 08:58:54.000000' WHERE id = 12;
UPDATE public.stockbyestablishment SET time = '2024-05-20 08:58:54.000000' WHERE id = 13;
UPDATE public.stockbyestablishment SET time = '2024-06-20 08:58:54.000000' WHERE id = 14;
UPDATE public.stockbyestablishment SET time = '2024-06-20 08:58:54.000000' WHERE id = 15;
UPDATE public.stockbyestablishment SET time = '2024-06-20 08:58:54.000000' WHERE id = 32;
UPDATE public.stockbyestablishment SET time = '2024-06-20 08:58:54.000000' WHERE id = 33;
UPDATE public.stockbyestablishment SET time = '2024-04-20 08:58:54.000000' WHERE id = 34;
UPDATE public.stockbyestablishment SET time = '2024-04-20 08:58:54.000000' WHERE id = 35;


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