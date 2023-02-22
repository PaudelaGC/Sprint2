select botigues.localitat as Localitats, SUM(`productes demanats`.quantitat) as BegudesVenudes from `productes demanats`
join productes on`productes demanats`.producte = productes.id 
join comandes on `productes demanats`.comanda = comandes.id
join botigues on comandes.botiga = botigues.id
where productes.tipus = 'Beguda'
group by botigues.localitat