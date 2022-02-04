Exercice 2:
Soit les données suivantes représentant des films de cinéma.


{

nom:"Goodfellas",
annee:1990,
realisateur:{nom:"Scorsese", prenom:"Martin"},
acteurs:[
{nom:"De Niro", prenom:"Robert"},
{nom:"Liotta", prenom:"Ray"},
{nom:"Pesci", prenom:"Joe"}
]}



{
nom:"The Godfather",
annee:1972,
realisateur:{nom:"Coppola", prenom:"Francis Ford"},
acteurs:
[
{nom:"Pacino", prenom:"Al"},
{nom:"Brando", prenom:"Marlon"},
{nom:"Duvall", prenom:"Robert"}
]}



{ nom:"Million Dollar Baby",
realisateur:{nom:"Eastwood", prenom:"Clint"},
acteurs:
[
{nom:"Swank", prenom:"Hilary"},
{nom:"Eastwood", prenom:"Clint"}
]}




{nom:"Gran Torino",
annee:2008,
realisateur:{nom:"Eastwood", prenom:"Clint"},
acteurs:
[
{nom:"Vang", prenom:"Bee"},
{nom:"Eastwood", prenom:"Clint"}
]}



{
nom:"Unforgiven",
realisateur:{nom:"Eastwood", prenom:"Clint"},
acteurs:
[
{nom:"Hackman", prenom:"Gene"},
{nom:"Eastwood", prenom:"Clint"}
]}


{
nom:"Mystic River",
realisateur:{nom:"Eastwood", prenom:"Clint"},
acteurs:
[
{nom:"Penn", prenom:"Sean"},
{nom:"Bacon", prenom:"Kevin"}
]}


{
nom:"Honkytonk Man",
realisateur:{nom:"Eastwood", prenom:"Clint"},
annee:1982,
acteurs:
[{
nom:"Eastwood", prenom:"Kyle"},
{nom:"Bloom", prenom:"Verna"}
]}

1- Créer une nouvelle base MongoDB et insérer les films donnés.

use cinema // create database
db.createCollection('Films') // create collection 

2- Ecrire les requêtes MongoDB permettant de répondre aux questions suivante :

a) Quels sont les films sortis en 1990 ?

* solution : db.Cinema.find({"annee":1990})

b) Quels sont les films sortis avant 2000 ?

// Indice : On utilisera l''objet {$lt:value} à la place de la valeur de l''attribut à tester ($lt pour lesser than).

* solution : db.Cinema.find({"annee":{$lt:2000}})

c) Quels sont les films réalisés par Clint Eastwood ?

//Indice : On utilisera un objet comme valeur.

* solution :  


d) Quels sont les films réalisés par quelqu''un prénommé Clint ? 
// Indice : Utiliser le navigateur de propriété des objets point : object.attribute.

* solution : db.Cinema.find({"realisateur.prenom":"Clint"})



e) Quels sont les films réalisés par quelqu''un prénommé Clint avant 2000 ?

// Indice: Utiliser une liste de conditions attribut:valeur pour spécifier un AND (et logique) :
db.col.find({"attribute1":"value1", "attribute2":"value2"})

*solution : db.Cinema.find({"realisateur.prenom":"Clint", "annee":{$lt:2000}})


f) Quels sont les films dans lesquels joue Clint Eastwood ?

* solution : db.Cinema.find({"realisateur.prenom":"Clint", "annee":{$lt:2000}})

g) Quels sont les films dans lesquels joue un Eastwood ?

// Indice : Vous pouvez utiliser le parser de tableau $elemMatch:{"key":"value"} à la place de la
valeur.

* solution : db.Cinema.find({"acteurs.nom":"Eastwood"})
* solution : db.Cinema.find({"acteurs":{$elemMatch:{"nom":"Eastwood"}}})
h) Quels sont les films qui contiennent le mot "man" dans le nom du film? Vous
pouvez utiliser les expressions réguliéres "/xxx/i" (le i pour insensible à la casse, et
xxx correspond au mot).

h*)Quels sont les films qui contiennent le mot "god" dans le nom du film et réalisé par
"Coppola"?

i) Quels sont les noms des films dans lesquels joue un Eastwood ?

// Indices : Pour gérer
la projection, utiliser un second argument de la clause find():
db.Cinema.find({document JSON de sélection }, {document JSON de projection})
avec document JSON de projection de la forme : {"attribut1":1, "attribut2":1...}
Les identifiants sont toujours affichés par défaut, si on veut les supprimer, on peut
ajouter la clause _id:0 dans le document de projection.

---------------------------------------------------------------------------




db.users.insertMany([
{
 pseudo:"zeyneb",
 liked : 
   [
     {"film":"590c366d70f50381c920ca71","star":3},
     {"film":"590c366d70f50381c920ca72","star":1}
   ]
},
{
 pseudo:"kias",
 liked : 
   [
     {"film":"590c366d70f50381c920ca71","star":2}
   ]
},
{
 pseudo:"zizou",
 liked : 
   [
     {"film":"590c366d70f50381c920ca74","star":3}
   ]
}
])

// Quels sont les utilisateurs qui aiment au moins un film avec 3 étoiles ?

solution : db.users.find({"liked":{$elemMatch:{"star":3}}})


// Quels sont les identifiants des films qui sont aimés au moins une fois avec 3 étoiles ?

Solution : db.User.find({"liked":{$elemMatch:{"star":3}}}, {"_id":0, "liked.film":1})