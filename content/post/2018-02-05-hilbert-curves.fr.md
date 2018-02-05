---
author: arthur.sw
date: 2018-01-08T00:00:11Z
image: /images/hilbert-thumb.png
title: Hilbert
url: /fr/hilbert/
tags:
  - artwork
  - from1to18hours
---

![Hilbert](/images/hilbert.png)]

[Hilbert](https://arthursw.github.io/hilbert/) est "un générateur de courbe de hilbert basé sur une image".

L'algorithme génère une image à partir d'un seul tracé qui ne se croise jamais.

[Sources](https://arthursw.github.io/hilbert/).

Glissez-déposez l'image de votre choix sur l'image pour générer une version "courbe de hilbert".

## Comment cela fonctionne ?

Une [courbe de Hilbert](https://en.wikipedia.org/wiki/Hilbert_curve) est générée à partir d'une image noir et blanc, raffinée la ou l'image est plus sombre que le seuil définie.

 - Générer les images mipmaps: séquence d'image précalculées, suite progressive d'image de résolution de plus en plus faible,
 - Subdiviser l'image avec la plus basse résolution en 4 cadrants, et pour chaque cadrant :
   - si le cadrant est plus foncé que le seuil :
     - resubdiviser en cadrants et continuer de manière récursive jusqu'à ce que les cadrants soient assez clairs,
   - sinon dessiner la courbe de hilbert correspondante à l'échelle

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

La difficulté est de tourner la courbe dans la bonne direction quand elle doit être raffinée.

Le premier et le dernier cadrants doivent être orientés dans des directions opposées ; l'ordre de parcours des cadrant doit être inversé, et en fonction de l'étape précédente les rotations peuvent avoir lieu dans un sens ou dans l'autre.

L'algorithme final mémorise les rotations qui s'additionnent à chaque itération, et détermine si les rotations doivent être inversées ou non.

À chaque résolution, l'image peut être divisé en 4 cadrants, numérotés de 0 à 3.

L'objectif est de calculer l'ordre de parcours de la courbe (par exemple [0, 1, 2, 3], [3, 0, 1, 2], etc.).

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