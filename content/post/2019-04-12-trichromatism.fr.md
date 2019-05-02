---
author: arthur.sw
date: 2019-04-12T00:00:11Z
image: /images/trichromatism/trichromatism-thumb.png
title: Trichromatism
url: /fr/trichromatism/
tags:
  - artwork
  - experiment
  - application
  - from1to18days
---

[Trichromatism](http://arthur.sw.gitlab.io/trichromatism/) est un outil de conversion d'image bitmap en image vectorielle composée de lignes de 3 couleurs qui peuvent ensuite être dessinée par un traceur comme [le Tipibot](http://arthurmasson.xyz/tipibot/).

Un shader de previsualisation permet de faire un réglage des paramètres en temps réel.

Un algrithme similaire est ensuite executé sur le CPU pour générer le fichier vectoriel SVG correspondant.

## Quelques resultats

![Bike](/images/trichromatism/bike.jpg)
![King Fisher](/images/trichromatism/king-fisher.jpg)
![Nyala](/images/trichromatism/nyala.jpg)

## Rendu

L'objectif est le suivant :
 
 - calculer 4 nouvelles couleurs à partir des 3 couleurs données (mélanger la couleur A avec la couleur B, la A avec la C, la B avec la C, puis les trois ensemble)
 - cela donne donc 7 couleurs, plus le noir et le blanc,
 - pour chaque pixel de l'image, trouver la couleur la plus proche,
 - dessiner les lignes correspondantes avec l'angle donné.

Le shader est compliqué.

Pour obtenir un rendu réaliste des lignes, j'ai du appliquer un déplacement à la lecture du pixel, comme illustré sur l'image suivante:

![Line offset](/images/trichromatism/line-offset.jpg)

Cela signifie que l'algorithme être appliqué trois fois sur l'image (une fois par angle) pour obtenir la couleur final du pixel et dessiner les lignes correpondantes ; comme le montre les images suivantes :

![Angles](/images/trichromatism/angles.jpg)

Cela permet d'obtenir des fins de ligne réalistes (image de gauche ci-dessous). Sans déplacement, les fins de ligne suivraient les conteurs de l'image ce qui laisserait apparaître beaucoup de détails qui ne seraient pas retranscrits par les lignes (image de droite ci-dessous).

![Edges](/images/trichromatism/edges.jpg)

Pour calculer la distance entre les couleurs, j'ai utilisé la formule [CIE Lab - delta E* CIE94 détaillée sur Wikipedia](https://en.wikipedia.org/wiki/Color_difference).

J'ai implémenté la conversion de couleurs à la fois sur le shader et sur l'algorithme executé sur le CPU.

Pour mélanger deux couleur, j'ai choisi de les convertir en CMJN, de les ajouter, puis les diviser par un poids donné. Plus le poids est élevé, plus les couleurs obtenues seront claires.


## Améliorations

Il est possible d'implémenter plusieurs variantes :

 - Donner N couleurs, chacune avec un angle, et ne pas les mélanger, juste dessiner la couleur la plus proche.
 - Convertir l'image en CMJN, seuiller chaque composante séparément, et dessiner les lignes en fonction des valeurs obtenues. Cela pourrait également fonctionner en RVB.
 - Utiliser des motifs différents des lignes droites.
 - Utiliser [une courbe de remplissage de l'espace](http://arthurmasson.xyz/fr/space-filling-curves/) pour dessiner chaque composante (CMJN) de l'image avec une ligne dédiée.
