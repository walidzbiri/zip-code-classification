# ZIP code Classification using cavities

La reconnaissance automatique de l’écriture est un domaine de recherche qui a trouvé une application
à grande échelle dans le tri du courrier. En effet, une grande partie du courrier est actuellement triée de
manière entièrement automatique. Les enveloppes passent devant une caméra, et chaque image est traitée automatiquement par une machine qui localise le code postal et le reconnaît. Dans ce TP, nous nous
proposons de mettre en oeuvre une méthode de reconnaissance de code postaux.

La reconnaissance des chiffres du code postal est un problème difficile, surtout lorsqu’il s’agit d’écriture
manuscrite car chaque ligne de chiffres est écrite par une personne différente et il existe donc une grande
variabilité de l’écriture, lorsque l’on passe d’une personne à l’autre. Même pour une personne donnée,
l’écriture n’est jamais parfaitement stable.
Les méthodes de reconnaissance de chiffres fonctionnent généralement en deux étapes. La première
étape consiste à caractériser la forme du chiffre, en détectant dans l’image des zones particulières.

La caractéristique utilisée ici est la cavité. Les cavités se définissent par leur direction d’ouverture. Cinq
types de cavités sont ainsi définis :
- cavité Nord : vers le haut
- cavité Est : vers la droite
- cavité Sud : vers le bas
- cavité Ouest : vers la gauche
- cavité Centrale : au centre
