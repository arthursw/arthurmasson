---
author: arthur.sw
date: 2018-04-21T00:00:11Z
image: /images/game-of-shapes-thumb.png
title: Game of Shapes
url: /game-of-shapes/
tags:
  - artwork
  - from1to18hours
---

![Game of shapes](/images/game-of-shapes.png)

# Game of Shapes

[Game of shapes](https://arthursw.github.io/game-of-shapes/)

Formes générées à partir d'un jeu de la vie 1D.

1) Chaque règle (groupe de 3 cellules) correspond à une forme
2) Les formes sont organisées en colonnes ; une colonne correspond à une série de cellule similaire

## Conversions règle vers forme

 - 000: rien
 - 001: rectangle
 - 010: cercle
 - 011: triangle vers le bas
 - 100: rectangle horizontale
 - 101: rectangle vertical
 - 110: petit cercel
 - 111: triangle vers le haut

## Contrôles

 - ***space***: play / pause l'animation
 - ***gauche / droite***: va à la règle précédente / suivante du jeu de la vie
 - ***haut / bas***: va à l'itération précédente / suivante du jeu de la vie
 - ***click / drag*** (dans la partie supérieur): va à l'itération correpondant à la position de la souris