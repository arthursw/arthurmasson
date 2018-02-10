---
author: arthur.sw
date: 2018-01-08T00:00:11Z
image: /images/gosper-thumb.png
title: Space Filling Curve
url: /fr/space-filling-curve/
tags:
  - artwork
  - from1to18hours
---

![Gosper](/images/gosper.png)]
![Hilbert](/images/hilbert.png)]

[Space Filling Curves](https://arthursw.github.io/space-filling-curves/) est un générateur de courbe de remplissage de l'espace basé sur une image.

L'algorithme génère une image à partir d'un seul tracé qui ne se croise jamais.

 - [Sources](https://github.com/arthursw/space-filling-curves/)
 - [Démo](https://arthursw.github.io/space-filling-curves/)

Glissez-déposez l'image de votre choix sur l'image pour générer une version "courbe de remplissage" (courbe de Hilber ou de Gosper).

## Comment cela fonctionne ?

Une [courbe de remplissage de l'espace](https://en.wikipedia.org/wiki/Space-filling_curve) ([une courbe de Hilbert](https://en.wikipedia.org/wiki/Hilbert_curve) ou une [courbe de Gosper](https://en.wikipedia.org/wiki/Gosper_curve)) est générée à partir d'une image noir et blanc, raffinée la ou l'image est plus sombre que le seuil définie.

### Concept

L'image est récursivement divisée en cases.

 - Générer les images mipmaps: séquence d'image précalculées, suite progressive d'image de résolution de plus en plus faible,
 - Subdiviser l'image avec la plus basse résolution en cases, et pour chaque case :
   - si la case est plus foncée que le seuil :
     - resubdiviser en cases et continuer de manière récursive jusqu'à ce que les cases soient assez claires,
   - sinon dessiner la courbe de remplissage correspondante à l'échelle

### Courbe de Gosper

 - [La courbe de Gosper sur wikipedia](https://en.wikipedia.org/wiki/Gosper_curve)
 - [Fractalcurves.com: The Root 7 Family](http://www.fractalcurves.com/Root7.html)
 - [Space filling hexagon](https://spacefillingcurves.files.wordpress.com/2016/09/hex.jpg?w=662&h=221)

### Courbe de Hilbert

 - [La courbe de Hilbert sur wikipedia](https://en.wikipedia.org/wiki/Hilbert_curve)

L'implementation est beaucoup plus spécifique que pour la courbe de Gosper, donc un peu plus compliquée et moins élégante.

Pour la courbe de Hilbert, les cases sont 4 cadrants, numérotés de 0 à 3.

<!-- 


  1____2
  |    | 
  |    | 
  0    3

 ___    __
 |  |  |  |
 |  |__|  |
 |___   __|
    |  |
 ___|  |___

 
 --> 

L'objectif est de calculer l'ordre de parcours de la courbe (par exemple [0, 1, 2, 3], [3, 0, 1, 2], etc.).

La difficulté est de tourner la courbe dans la bonne direction quand elle doit être raffinée.

Le premier et le dernier cadrants doivent être orientés dans des directions opposées ; l'ordre de parcours des cadrant doit être inversé, et en fonction de l'étape précédente les rotations peuvent avoir lieu dans un sens ou dans l'autre.

L'algorithme final mémorise les rotations qui s'additionnent à chaque itération, et détermine si les rotations doivent être inversées ou non.

A chaque iteration, la rotation et l'inversion sont calculés de cette façon :

 - pour le cadrant 0: 
   - rotation += inversion ? -1 : 1
   - inversion = !inversion
   - inverser l'ordre de parcours des cadrants
 - pour le cadrant 1:
   - rotation += inversion ? 1 : -1
   - inversion = !inversion
   - inverser l'ordre de parcours des cadrants
 - pour les cadrans 2 et 3:
   - ne rien changer