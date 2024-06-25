SELECT sum(disheprice - dishepurchaseprice) as benefits,c.idestablishment,establishment.name FROM foodorder f
JOIN customers c on c.id = f.customerid JOIN establishment on establishment.id = idestablishment GROUP BY idestablishment,establishment.name WHERE ordertime BETWEEN :starDate and :endDate;

SELECT sum(disheprice - dishepurchaseprice) as benefits,idType,dt.libelle FROM foodorder f
JOIN customers c on c.id = f.customerid JOIN dishes d ON d.id = iddishes JOIN dishetype dt ON dt.id = d.idtype  WHERE idestablishment=2 AND ordertime BETWEEN '2024-06-17' AND '2024-07-12' GROUP BY idType,libelle;

SELECT sum(disheprice - dishepurchaseprice) as benefits,idType,dt.libelle FROM foodorder f
JOIN customers c on c.id = f.customerid JOIN dishes d ON d.id = iddishes JOIN dishetype dt ON dt.id = d.idtype AND ordertime BETWEEN '2000-06-17' AND '2024-07-12' GROUP BY idType,libelle;

