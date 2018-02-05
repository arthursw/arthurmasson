---
author: arthur.sw
date: 2018-01-08T00:00:11Z
image: /images/hilbert-thumb.png
title: Hilbert
url: /hilbert/
tags:
  - artwork
  - from1to18hours
---

![Hilbert](/images/hilbert.png)]

[Hilbert](https://arthursw.github.io/hilbert/) is an "image based Hilbert curve generator".

It generates an image from a single non-self-intersecting path.

[Sources](https://github.com/arthursw/hilbert/).

Drag'n'drop the image of your choice on the canvas to generate a hilbert version.

## How does it work?

A [Hilbert curve](https://en.wikipedia.org/wiki/Hilbert_curve) is computed from a grayscale image, refined where the image is darker than thredhold.

 - Generate image mipmaps: pre-calculated, optimized sequences of images, each of which is a progressively lower resolution representation of the same image
 - Subdivide the image with the lowest resolution in four quadrants and for each quadrant:
   - if the quadrant is darker than *threshold*:
      - resubdivide in quadrant and continue recursively until the quadrant is light enough
   - otherwise draw the corresponding hilbert curve at proper scale

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

The tricky part is to rotate the curve in the proper way when it must be refined.
The first and last quadrant must be rotated in opposite direction, the traversing order of the quadrants must be inverted, and depending on the previous refinements the rotations must happen in one way or another.

The final algorithm keeps track of the rotation which sums up at each iteration, and whether or not rotation inversion must happen.

At each resolution, the image can be divided into four quadrants, numbered from 0 to 3.

The goal is to compute the traversing order of the quadrants (for example [0, 1, 2, 3], [3, 0, 1, 2], etc.).

At each iteration, the rotation and inversion is computed in the following way:

 - for quadrant 0: 
   - rotation += inversion ? -1 : 1
   - inversion = !inversion
   - inverse the traversing order of the quadrants
 - for quadrant 1:
   - rotation += inversion ? 1 : -1
   - inversion = !inversion
   - inverse the traversing order of the quadrants
 - for quadrant 2 and 3:
   - do not change anything