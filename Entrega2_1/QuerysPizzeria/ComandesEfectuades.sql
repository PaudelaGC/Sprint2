select treballadors.nom as Treballador, count(comandes.id) as ComandesTotals from comandes
join treballadors on comandes.repartidor = treballadors.id
group by treballadors.nom
