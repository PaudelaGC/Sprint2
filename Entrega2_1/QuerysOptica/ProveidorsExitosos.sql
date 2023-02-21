select proveïdors.nom as Proveidors_Exitosos
from ulleres
inner join proveïdors on proveïdors.Id = ulleres.Proveidor
inner join ventes on ventes.Ulleres = ulleres.Id
group by proveïdors.nom;