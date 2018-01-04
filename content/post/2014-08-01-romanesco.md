---
author: arthur.sw
date: 2014-08-01T00:00:49Z
image: /images/romanesco-thumb.png
title: Romanesco
url: /romanesco/
tags:
  - application
  - experiment
  - from1to18months
---

![Romanesco](/images/romanesco.png)

I always wanted to study and exploit the potential of the internet. 

More specifically I am interested in the way people collaborate and create together. Hence I started working on Romanesco, a collaborative drawing application based on an infinite canvas. 

The goal of this project is also to bring developers together to create a wide library of diverse drawing tools.

This is a huge hobby project which I developed alone, I see it as an experiment and a proof-of-concept.

### Main techologies

 - **Client side**: Coffeescript, paper.js, jquery (and ace, domReady, aceTools, underscore, jquery, jqueryUi, mousewheel, scrollbar, tinycolor, bootstrap, paper, three, gui, typeahead, pinit, howler, spin, zeroClipboard, diffMatch, aceDiff, colorpickersliders, requestAnimationFrame, coffee, tween, socketio, oembed, jqtree, js-cookie, octokat, spacebrew, jszip, fileSaver, color-classifier)

 - **Server side**: Python, Django & MongoDB (and virtualenv, cefpython, gevent-websocket, oauthlib, Pillow, pymongo)

### Features

Many feature were working one day and are not working anymore.

#### Canvas

Actions are transmitted from users to users via websockets, so one can see other people drawing live.

#### Sign in/up

It is possible to create an account with Google, Facebook, Github or Romanesco. Behind the scene, Romanesco uses the great Django allauth plugin to connect to social accounts.

#### City

In Romanesco terminology, a city is a infinite document. Users can load, create, modify or delete public or private cities. 
Anybody can edit public cities.

#### Favorite tools

Users can find their favorite tools here ; they can define any tool as favorite in the "All tools" list.

Main tools:

 - hand / move tool: to navigate in the infinite sheet,
 - cursor: to select items, paths, points and handles, 
 - screenshot: to export an image from Romanesco,
 - lock: to lock an area (which other user wont be able to modify afterwards)
   - this tool is useful for people who want to protect their artwork / website,
   - this feature could be non free, user would have to pay to protect their work / advertisment
 - text: to add text, with the possibility to choose the text area, the font type, font size, color, effects and styles
   - typeahead enables to quickly find a font among all the available fonts
   - all google fonts are available
 - media: an image, video or sound can be added via an valid url,
 - car: very handy to navigate quickly on the canvas with keyboard arrows, and possibly to play race games in Romanesco,
 - pen: a tool to draw an editable fully featured curve with keypoints, handles, different types of corners, etc.
 - square and circle: useful shape tools
 - speed and dynamic brush: brushes which expand depending on the speed of the mouse while drawing,
   - speed can be edited afterwards to obtain the perfect curve

#### All tools

The goal of Romanesco is to provide a tool list which anyone can extend. To facilitate navigation among tools, a search box enable to quickly find tools by name, and to set them as favorite.

#### History

It is possible to go back and forth in the action history. Many actions are stored.

#### Items

All items on the current area of the canvas are listed here. One can select or re-arrange items on this list.

#### Code

This is the best feature of Romanesco.

The entire client code of Romanesco can be modified via a code editor which communicates with github to update users forks.
In this way, people can modify the project and propose new features or tools and create pull requests directly within Romanesco. The goal is to encourage people to create new tools.

#### Chat

A simple chat to talk with people arround the current area.