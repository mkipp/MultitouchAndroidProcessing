processing-mt-android
=====================

Processing code for displaying multitouch points on an Android device.

This repo contains two Processing sketches that can be run on Android devices. One uses immutable objects to represent touch points, the other using mutable objects.

Use the immutable version by default. Use the mutable version if you need to relate to individual "fingers" over time by using a TouchPoint object.

Tested on:
- ASUS TF101 (Android 4.0.3)
- Nexus 7 (Android 4.4.3)
