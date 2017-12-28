---
author: arthur.sw
date: 2013-08-12T15:06:41Z
image: /images/bodybuilding/2-667x1000-thumb.jpg
title: 'Body Building'
url: /fr/bodybuilding/
tags:
  - image-processing
  - artwork
  - from1to18days
---

{{< vimeo 248853847 >}}

Voici une petite video rapide de démo d'un appli de danse interactive que j'ai créé avec OpenCV et Openframeworks.

L'application est conçue pour être utilisée avec une Kinect dans un théatre ou au cinéma pour créer de l'art intéractif.

Cette démo est très rudimentaire, mais j'espère qu'elle montre les possiblités infinie que l'on peut composer avec ce type d'outil...

Je ne me rappelle plus vraiment comment régler au mieux chaque effet, et je n'ai pas tout montré ; il est probablement possible d'aller beaucoup plus loin sur scène.

Evidement le mouvement de l'artiste peut aussi influencer du son ou d'autre medias.

Je suis désolé de ne pas avoir trouvé de meilleur vidéo de silhouette...

Voici un petit aperçu de tests réels effectués pour une piece de théatre (très peu d'effets ont été testés à cette occasion) :

{{< pswp-init >}}

{{< gallery >}}

{{< figure link="/images/bodybuilding/1-667x1000.jpg" thumb="-thumb" size="667x1000" >}}
{{< figure link="/images/bodybuilding/2-667x1000.jpg" thumb="-thumb" size="667x1000" >}}
{{< figure link="/images/bodybuilding/4-667x1000.jpg" thumb="-thumb" size="667x1000" >}}
{{< figure link="/images/bodybuilding/5-667x1000.jpg" thumb="-thumb" size="667x1000" >}}
{{< figure link="/images/bodybuilding/3-1500x1000.jpg" thumb="-thumb" size="1500x1000" >}}

{{< /gallery >}}

### Effets

Pour tous les effets, il est possible de changer la couleur (teinte, saturation, luminosité), la persistance (combien de temps l'image précédente reste à l'écran / comment le fondu diminue) and l'interval de couleur pour les effets qui comporte différentes couleurs.

#### Video blend

Applique des effets vidéo (comme la persistance) sur un flux vidéo couleur.

#### Star sphere

Le mouvement du corp contrôle la rotation d'une sphère qui englobe le danseur.

#### Star flow

Des particules sont générées en fonction du mouvement du corp, ou émisent depuis le contour du corp.

Les paramètres sont entre autres : le nombre de particules, leur vitesse, la gravité, la courbure de leurs trajectoirs, la taille des particules, etc.
Cet effet utilise OpenGL, contrairement à "Particle optical flow" qui génère les visuels sur une image OpenCV.

#### Liner

Dessine des lignes à partir de points fixes sur le corp.

#### 3 Contours & N Contours

Génère des contours autour du corp dilatés de différentes manières.

#### Spikes

Génère des picques autour du corp en utilisant différents motifs.

#### Smooth

Affiche une version simplifiée et arrondie de la silhouette.

#### Particle optical flow

Similair à l'effet "Star Flow" mais créé le visuel sur une image OpenCV au lieu d'OpenGL.

#### Particle rain

Génère une pluie de particule sur la silhouette.
Les paramètre sont entre autre : la taille du nuage de particule, le nombre de particule, comment les particules rebondissent sur le corp, la gravité et la vitesse des particules.

#### Particle grid

Génère une grille qui se déforme en fonction du mouvement du corp.
Les paramètre consistent surtout en l'élasticité de la grille et du nombre de cellule.


