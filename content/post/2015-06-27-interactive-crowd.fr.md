---
author: arthur.sw
date: 2015-06-27T00:00:08Z
image: /images/duck-hunt-thumb.png
title: Interactive Crowd
url: /fr/interactive-crowd/
tags:
  - experiment
  - interactive
  - from1to18days
---

![Interactive Crowd](/images/interactive-crowd.jpg)

# Interactive crowd

## Origine du projet

Le projet tente d’apporter une réponse à la problématique de l’interaction entre une foule de spectateurs et une installation de grande envergure (par exemple du mapping vidéo sur un bâtiment). Les installations interactives destinée à un large public proposent généralement des contrôleurs confinés dans un espace limité et accessibles uniquement par quelques individus (par exemple http://pixelpyros.org/).

Interactive crowd tente de résoudre ce problème en proposant un dispositif composé de contrôleurs simples (à bas coût) distribués dans la foule.

## Différentes déclinaisons

Différentes versions du système peuvent être imaginées. 

Dans la première version, les contrôleurs sont des pointeurs lasers dont les points réfléchis sur l’oeuvre (typiquement une façade de bâtiment) sont captés par une caméra. Ils agissent donc comme des pointeurs sur un écran.

Le problème majeur de cette solution est que les lasers peuvent être dangereux s’ils sont directement dirigés dans les yeux. Deux solutions sont (peut-être ?) envisageables : soit le dispositif peut fonctionner avec des lasers de faible puissances qui ne sont pas dangereux pour les yeux et donc autorisés pour tout usage ; soit les utilisateurs doivent être isolée du public afin qu’il ne puisse viser autre chose que l’oeuvre (par exemple sur une estrade confinée qui donnerai un accès visuel uniquement sur l’oeuvre, ou bien en installant les contrôleurs sur des pieds d’appareils photos fixés au sol (ou système similaire) réglés pour ne pas être orientable vers les zone à risque).

Dans une seconde version, les contrôleurs fonctionnent avec des accéléromètres (et gyroscope ?) à la manière du contrôleur Nunchuk de la wii. Cela résout le problème de la sécurité, mais ne permet pas l’interaction directe et immédiate que l’on peut obtenir avec un laser. De plus, cela implique une liaison avec un ordinateur (donc un fil) ; il y a donc des contraintes techniques quant au nombre d’utilisateur et à leurs positions par rapport à l’ordinateur (la encore un espace dédié semble indispensable). Le prix serait probablement supérieur à celui de la version basée pointeur laser.

## Applications

Les applications d’un tel dispositif sont nombreuses. 

Bon nombre de jeux vidéos peuvent être adaptés à ce type d’installation, le légendaire Duck Hunt en est un bon exemple, Vigilance 1.0 en est un autre. Des dérivés ou d’autres types de jeux sont envisageables.
Mais il est également pertinent de travailler sur l’interaction entre le son et l’image, dans la mesure ou le public peut ainsi bénéficier du résultat de l’interaction (par exemple, le public peut profiter de la musique générée par les utilisateurs). Ainsi, des applications axées sur l’interaction son/image ou sur une transcription de l’image vers la musique sont adaptées. Plusieurs exemples ressortent, comme Incredibox, Balldroppings, Patatap, Plink ou encore Guitare Hero. Les applications finales pourront être conçues sur mesure pour respecter les contraintes techniques et les directives artistique des projets.

## Réalisation technique

### Système laser

#### Contrôleur

Le contrôleur sera composé :

 - d’un bouton actionneur (la gâchette),
 - (éventuellement) d’un bouton (trois états ?) pour choisir le mode d’action, (action continue, impulsion, ou rafale selon l’application),
 - d’une arduino (nano) pour programmer et commander les mode d’action,
 - du laser ou des capteurs.

Une forme de pistolet offrira une ergonomie optimal pour viser les cibles de l’application.

Le coût du contrôleur doit rester relativement bas pour pouvoir être produit en plusieurs exemplaires (4 unités minimum ?).

Cette contrainte de prix laisse deux solutions : hacker un jouet existant (probablement en plastique) pour intégrer le dispositif à l’intérieur, ou créer un schéma de découpe laser adapté (l’impression 3D semble trop coûteuse en temps). Il est difficile de trouver un jouet approprié (laissant suffisamment de place pour intégrer les différents composants) peu coûteux et en quantité suffisante (les jouets d’occasion sont rarement vendu en lot). Il semble donc plus raisonnable de partir sur un assemblage de planches découpés au laser. L’avantage d’un produit entièrement fabriqué de A à Z est de pouvoir partager les plans et le code de l’application et d’en faire un projet open source.

### Capteur

Le code permettant de déterminer la position du point lumineux sur la façade pour interagir dans l’image vidéo projetée est déjà développé. Cela consiste à trouver la matrice de transformation qui permet de passer des quatre coins de l’image projetée (tel qu’elle est captée dans l’image de la camera) aux quatre coins de l’image de sortie (qui est envoyé au vidéo projecteur). Cette discussion permet d’implémenter l’algorithme de conversion. Un prototype d’application est déjà fonctionnel (développé avec openframeworks et en html/javascript).

### Système basé sur l’accéléromètre

De nombreux hack du nunchuk sont disponibles sur le net, et des versions low costs semblent accessibles et réalisables...

### Todo list

 - déterminer la faisabilité d’un contrôleur laser (problème de législation),
 - faire le schéma de montage du contrôleur, (choix des matériaux et dispositions des composants),
 - dessiner les plans pour la découpe laser (fichiers .stl),
 - programmer l’arduino (différents modes d’actions, etc.),
 - programmer les applications. (un hack du Duck Hunt est déjà réalisé)

### Avancement

![Duck Hunt](/images/duck-hunt.png)

 - Plans 3D et plans de découpe
 - Hack de l’émulateur fceux pour contrôler le pointeur de [Duck hunt](https://fr.wikipedia.org/wiki/Duck_Hunt) avec une application de détection du point lumineux

## Notes et commentaires

### Origine du projet

À l’origine, le projet est conçue comme une installation vidéo mapping interactive sur la façade du bâtiment de la CAF à Rennes ; cette idée a émergé au sein de La Sophiste suite à l’évocation d’une possibilité de financement pour une installation sur cette façade.
A propos de la faisabilité

Les contraintes techniques ne permettrons probablement pas de distribuer les contrôleurs n'importe ou dans la foule. Cependant, le projet reste pertinent des lors qu’il propose une nouvel forme d’interaction multi-utilisateur. 

La possibilité de mise en oeuvre du contrôleur laser semble compromis par la législation en vigueur sur l’utilisation des lasers pour le spectacle ; cependant les différentes facettes du problème n’ont pas encore été explorées.

La solution laser pose problème dès lors qu’il faut différentier les utilisateurs. Il est peut-être envisageable d’utiliser deux couleurs différentes (rouge et vert), mais il est globalement plus réaliste de considérer des applications ou la différentiation des utilisateurs n’est pas indispensable. Il est cependant possible de concevoir des applications composés de zones limitées propres à chaque utilisateur (ou groupe d’utilisateur). 
La solution basé sur l’accéléromètre ne pose pas ce problème de différentiation.

D’autres interactions plus simple (à base de marqueurs visuels distribué dans le public) peuvent être imaginés.

### A propos des applications

#### Vigilance 1.0

L’idée de la délation soulevé par Martin Le Chevalier, peut être adapté au monde du travail et à l’univers des bureaux et openspace. Cette perspective correspond à un projet de vidéo projection interactive sur la façade de la CAF. Les spectateurs pourront indiquer les employés (visible à travers les fenêtres de la façade, par vidéo projection) qui ne font pas bien leur travail (pause café trop longue, facebook, etc.).
« Un jeu vidéo pour surveiller ses contemporains. Le contrôle social en s’amusant.

Le numérique pour ce qu’il révèle de nos vies. »

#### Hack de Duck Hunt

Un hack du jeu Duck Hunt peut être un outil démonstratif simple et efficace, ou bien une oeuvre retro gaming à part entière.
Intervention sur le bâtiment

#### Autres

Les spectateurs peut construire (ajouter des pierres, peintures, bardages ou papiers peints) ou au contraire démolir le bâtiment vidéo mappé.
