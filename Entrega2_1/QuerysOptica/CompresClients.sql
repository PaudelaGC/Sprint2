select clients.Nom, count(ventes.id) as CompresTotals from ventes
left join clients on ventes.comprador = clients.id
group by clients.nom;