---
author: arthur.sw
date: 2016-10-01T00:00:24Z
image: /wp-content/uploads/2017/06/Capture-d’écran-2017-06-20-à-14.19.04-thumb.png
title: Musical Gears
url: /engrenage-musical-musical-game-of-life/
tags:
  - artwork
  - experiment
  - interactive
  - la-sophiste
  - from1to18hours
---

> Création de : Arthur Masson  & Gaëtan Hervé

![Engrenage musical](/wp-content/uploads/2017/06/Capture-d’écran-2017-06-20-à-14.19.04.png)


[Musical Gears](https://arthursw.github.io/dx7-gears/) is an artwork which takes inspiration from [the game of life](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life) designed by [John Horton Conway](https://en.wikipedia.org/wiki/John_Horton_Conway "John Horton Conway") in 1970.

> The game made Conway instantly famous, but it also opened up a whole new field of mathematical research, the field of cellular automata ... Because of Life's analogies with the rise, fall and alterations of a society of living organisms, it belongs to a growing class of what are called "simulation games" (games that resemble real life processes).

The game takes place on a two-dimensional grid on which cells can take two distinct states: "alive" or "dead".

At each step, the evolution of the cell depends on its eight neighbours:
 - a dead cell which has exactly three living neighbours becomes alive (birth),
 - a living cell which has two or three living cell remains alive, otherwise it dies.

[An implementation of the Game of Life](https://www.khanacademy.org/computer-programming/game-of-life/879123336) in javascript is available on the Khan Academy. It helps understanding easily the game and its code.

Another implementation on GPU is [available here](http://xpl.github.io/expression/). In this version, each pixel is a cell. It is possible to zoom to see the algorithm running precisely. It is possible to modify the rules of the game (the number of neighbours which gives birth or death or keep the same state).

The final artwork, made with Thomas Girault and Gaetan Hervé, is available on github:

  - The application: <https://arthursw.github.io/dx7-gears/>
  - The code: <https://github.com/arthursw/dx7-gears>

A few things to try :
  
  - play one note for a while (press a key and keep the key down),
  - try with two notes and let it evolve,
  - try symetric patterns,
  - paint with the mouse,
  - use a midi keyboard to really play melodies,
  - open midi files,
  - etc.

Other videos about the game of life:
 - https://www.youtube.com/watch?v=C2vgICfQawE
 - https://www.youtube.com/watch?v=xP5-iIeKXE8
 - https://www.youtube.com/watch?v=Su1Uu4_wIak
 - https://www.youtube.com/watch?v=S-W0NX97DB0
