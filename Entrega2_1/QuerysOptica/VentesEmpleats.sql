SELECT empleats.nom as Empleat, ulleres.marca as Ulleres_Venudes
FROM ventes
INNER JOIN empleats ON ventes.venedor = empleats.id
INNER JOIN ulleres ON ventes.ulleres = ulleres.id
WHERE ventes.Data_Venta between '2023-01-01' and '2024-01-01'
order by empleats.nom;