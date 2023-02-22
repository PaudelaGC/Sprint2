-- Queries de tienda
select nombre from producto; -- Q1
select nombre, precio from producto; -- Q2
select * from producto; -- Q3
select nombre, precio, precio*1.06 from producto; -- Q4
select nombre as `nom de producto`, precio as euros, precio*1.06 as dòlars from producto; -- Q5
select upper(nombre), precio from producto; -- Q6
select lower(nombre), precio from producto; -- Q7
select nombre, upper(left(nombre, 2)) from fabricante; -- Q8
select nombre, round(precio) from producto; -- Q9
select nombre, floor(precio) from producto; -- Q10
select fabricante.codigo from fabricante join producto on fabricante.codigo = producto.codigo_fabricante; -- Q11
select fabricante.codigo from fabricante join producto on fabricante.codigo = producto.codigo_fabricante group by fabricante.codigo; -- Q12
select nombre from fabricante order by nombre asc; -- Q13
select nombre from fabricante order by nombre desc; -- Q14
select nombre from producto order by nombre asc, precio desc; -- Q15
select * from fabricante limit 5; -- Q16
select * from fabricante limit 2 offset 3; -- Q17
select nombre, precio from producto order by precio limit 1; -- Q18
select nombre, precio from producto order by -(precio) limit 1; -- Q19
select nombre from producto where producto.codigo_fabricante = 2; -- Q20
select producto.nombre, precio, fabricante.nombre from producto join fabricante on producto.codigo_fabricante = fabricante.codigo; -- Q21
select producto.nombre, precio, fabricante.nombre from producto join fabricante on producto.codigo_fabricante = fabricante.codigo order by fabricante.nombre asc; -- Q22
select producto.codigo, producto.nombre, fabricante.codigo, fabricante.nombre from producto join fabricante on producto.codigo_fabricante = fabricante.codigo; -- Q23
select producto.nombre, precio, fabricante.nombre from producto join fabricante on producto.codigo_fabricante = fabricante.codigo order by precio asc limit 1; -- Q24
select producto.nombre, precio, fabricante.nombre from producto join fabricante on producto.codigo_fabricante = fabricante.codigo order by precio desc limit 1; -- Q25
select * from producto join fabricante on producto.codigo_fabricante = fabricante.codigo where fabricante.nombre = 'Lenovo'; -- Q26
select * from producto join fabricante on producto.codigo_fabricante = fabricante.codigo where fabricante.nombre = 'Crucial' and precio > 200; -- Q27
select * from producto join fabricante on producto.codigo_fabricante = fabricante.codigo where fabricante.nombre = 'Asus' or fabricante.nombre = 'Seagate' or fabricante.nombre = 'Hewlett-Packard'; -- Q28
select * from producto join fabricante on producto.codigo_fabricante = fabricante.codigo where fabricante.nombre in ('Asus', 'Seagate', 'Hewlett-Packard'); -- Q29
select producto.nombre, precio from producto join fabricante on producto.codigo_fabricante = fabricante.codigo where fabricante.nombre like '%e'; -- Q30
select producto.nombre, precio from producto join fabricante on producto.codigo_fabricante = fabricante.codigo where fabricante.nombre like '%w%'; -- Q31
select producto.nombre, precio, fabricante.nombre from producto join fabricante on producto.codigo_fabricante = fabricante.codigo where precio >= 180 order by precio desc, producto.nombre asc; -- Q32
select fabricante.nombre, fabricante.codigo from fabricante join producto on fabricante.codigo = producto.codigo_fabricante group by fabricante.codigo; -- Q33
select fabricante.nombre, producto.nombre from fabricante left join producto on fabricante.codigo = producto.codigo_fabricante; -- Q34
select * from fabricante left join producto on fabricante.codigo = producto.codigo_fabricante where not exists (select * where fabricante.codigo = producto.codigo_fabricante); -- Q35
select producto.nombre from producto left join fabricante on fabricante.codigo = producto.codigo_fabricante where fabricante.nombre = 'Lenovo'; -- Q36




