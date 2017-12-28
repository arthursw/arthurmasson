---
author: arthur.sw
date: 2013-08-12T15:06:41Z
image: /images/bodybuilding/2-667x1000-thumb.jpg
title: 'Body Building'
url: /bodybuilding/
tags:
  - image-processing
  - artwork
  - from1to18days
---

{{< vimeo 248853847 >}}

Here is a very quick & dirty demo of an interactive dance app I made with OpenCV and Openframeworks.
This is supposed to be used with a Kinect on a theatre or a cinema to create interactive art. 
This demo looks very bad, but I hope it shows the infinite possibilities one can compose with this kind of tool...

I don't really remember how to tweak every effects I implemented in this app, and I didn't show everything, there is probably much more to experiment on stage.

Of course, the motion of the artists can also influence sound or other things.

Sorry I could not find a better silhouette video.

Here is a small preview of some real tests performed for a play (very little effects were tested at this time):

{{< pswp-init >}}

{{< gallery >}}

{{< figure link="/images/bodybuilding/1-667x1000.jpg" thumb="-thumb" size="667x1000" >}}
{{< figure link="/images/bodybuilding/2-667x1000.jpg" thumb="-thumb" size="667x1000" >}}
{{< figure link="/images/bodybuilding/4-667x1000.jpg" thumb="-thumb" size="667x1000" >}}
{{< figure link="/images/bodybuilding/5-667x1000.jpg" thumb="-thumb" size="667x1000" >}}
{{< figure link="/images/bodybuilding/3-1500x1000.jpg" thumb="-thumb" size="1500x1000" >}}

{{< /gallery >}}

### Effects

For all effect, it is possible to change the color (hue, staturation and brightness), the persistance (how long does the previous remains on screen / how does it fades out) and the hue range for effects using multiple colors.

#### Video blend

Apply some video effects like persistence on a color video feed.

#### Star sphere

The body motion controls the rotation of a sphere surrounding the dancer.

#### Star flow

Particles are generated depending on the motion of the body, or emitted from the contour of the body.

Parameters include the number of particles, the speed, the gravity, the curvatur of the trajectories, the particles size, etc.
This effect uses OpenGL by contrast to the "Particle optical flow" effect which renders everything on an OpenCV image.

#### Liner

Generates lines moving from fixed part of the body.

#### 3 Contours & N Contours

Generates a few contours around the body dilated in various ways.

#### Spikes

Generates spikes around the body using different patterns.

#### Smooth

Displays a simplified and smoothed version of the silhouette.

#### Particle optical flow

Similar to "Star Flow" effect but renders on a regular OpenCV image instead of OpenGL.

#### Particle rain

Generates a rain of particles on the silhouette.
Parameters include the size of the cloud, the number of particles, how particle bounce on the body, the gravity, the speed of particles.

#### Particle grid

Generates a grid which is deformed by the motion of the body.
Parameters are mainly the elasticity of the grid and the number of cells.

