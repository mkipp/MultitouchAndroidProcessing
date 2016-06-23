processing-mt-android
=====================

Processing code for displaying multitouch points on an Android device.

This repo contains two Processing sketches that can be run on Android devices. One uses immutable objects to represent touch points, the other using mutable objects.

Use the immutable version by default. Use the mutable version if you need to relate to individual "fingers" over time by using a TouchPoint object.

You find an explanation of this in my lecture on "Interaction Engineering" (German): http://michaelkipp.de/interaction/interactive.html

Tested on:
- ASUS TF101 (Android 4.0.3)
- Nexus 7 (Android 4.4.3)
