---
author: arthur.sw
date: 2016-10-01T00:00:24Z
image: /wp-content/uploads/2017/06/Capture-d’écran-2017-06-20-à-14.19.04-thumb.png
title: Engrenage musical
url: /fr/engrenage-musical-musical-game-of-life/
tags:
  - artwork
  - experiment
  - interactive
  - la-sophiste
  - 1 à 18 heures
---

> Création de : Arthur Masson  & Gaëtan Hervé

![Engrenage musical](/wp-content/uploads/2017/06/Capture-d’écran-2017-06-20-à-14.19.04.png)


[Engrenage musical](https://arthursw.github.io/dx7-gears/) est une oeuvre qui s'inspire du [jeu de la vie](https://fr.wikipedia.org/wiki/Jeu_de_la_vie) imaginé par [John Horton Conway](https://fr.wikipedia.org/wiki/John_Horton_Conway "John Horton Conway") en [1970](https://fr.wikipedia.org/wiki/1970 "1970").

> Cet algorithme rendit Conway rapidement célèbre mais il ouvrit aussi un nouveau champ de recherche mathématique, celui des automates cellulaires. En effet, les analogies du jeu de la vie avec le développement, le déclin et les altérations d’une colonie de micro-organismes, le rapprochent des jeux de simulation qui miment les processus de la vie réelle.

Le jeu se déroule sur une grille à deux dimensions, dont les cellules peuvent prendre deux états distincts : « vivantes » ou « mortes ».

À chaque étape, l’évolution d’une cellule est déterminée par l’état de ses huit voisines :

  * Une cellule morte possédant exactement trois voisines vivantes devient vivante (elle naît).
  * Une cellule vivante possédant deux ou trois voisines vivantes le reste, sinon elle meurt.

[Une implémentation du Game of Life](https://www.khanacademy.org/computer-programming/game-of-life/879123336) en javascript est disponible sur la Khan Academy. Elle permet de comprendre simplement comment fonctionne le jeu, et de lire le code de l'algorithme.

Une autre implémentation sur carte graphique est disponible [ici](http://xpl.github.io/expression/). Dans cette version, chaque pixel est une cellule. Il est possible de zoomer pour voir l'algorithme tourner plus précisément. Il est possible d'y modifier les règles du jeu (le nombre de voisins qui donne lui à une naissance, au même état, ou à la mort).

La création finale, réalisée avec Thomas Girault et Gaetan Hervé, est disponible sur github :

  * L'application : <https://arthursw.github.io/dx7-gears/>
  * Le code : <https://github.com/arthursw/dx7-gears>

Les petites choses à essayer :

  * rester appuyer sur une touche,
  * allumer deux lignes puis laisser évoluer,
  * essayer les figures symétriques,
  * peindre des notes avec la souris,
  * utiliser un clavier midi pour faire des mélodies,
  * lancer les fichiers midi,
  * etc.

Autre références sur le jeu de la vie:
 - https://www.youtube.com/watch?v=C2vgICfQawE
 - https://www.youtube.com/watch?v=xP5-iIeKXE8
 - https://www.youtube.com/watch?v=Su1Uu4_wIak
 - https://www.youtube.com/watch?v=S-W0NX97DB0
