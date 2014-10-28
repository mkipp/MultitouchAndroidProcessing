/*
 * Displaying touch points and all information that come with them.
 * Size and pressure seem to be equivalent with size being in 
 * the more useful value range [0, 1].
 *
 * Touch points are kept in a hash map and are not IMMUTABLE!
 *
 * (c) 2013 Michael Kipp
 * Augsburg University of Applied Sciences
 * michael.kipp@hs-augsburg.de
 */


import java.util.*;
import android.view.MotionEvent;

Object lock = new Object(); // for sync lock
HashMap<Integer, TouchPoint> points = new HashMap<Integer, TouchPoint>();
PFont touchPointFont;

void setup() {
  // Turn on smoothing to make everything pretty.
  smooth();
  fill(255);
  stroke(255);
  touchPointFont = loadFont("OCRAStd-14.vlw");
  
}

void draw() {
  background(#BA5EF5);

  // draw touch points
  synchronized (lock) {
    for (TouchPoint p: points.values()) {
      if (p.active)
        p.draw();
    }
  }
}



// add the following to the bottom of your sketch; this code overrides the
// built-in method, then sends the data on after we capture it
@Override
public boolean dispatchTouchEvent(MotionEvent event) {

  // create touch points
  synchronized (lock) {
    //points.clear();

    for (TouchPoint p: points.values())
      p.active = false;

    for (int i = 0; i < event.getPointerCount(); i++) {
      // ignore the point where finger is being lifted right now
      if (i != event.getActionIndex() || event.getActionMasked() != MotionEvent.ACTION_UP) {

        TouchPoint p = points.get(i);
        if (p == null) { 
          points.put(event.getPointerId(i), new TouchPoint(event.getPointerId(i), 
          event.getX(i), event.getY(i), event.getPressure(i), 
          event.getSize(i), event.getOrientation(i)));
        } 
        else {
          p.active = true;
          p.id = event.getPointerId(i);
          p.x = event.getX(i);
          p.y = event.getY(i);
          p.pressure = event.getPressure(i);
          p.orient = event.getOrientation(i);
          p.size = event.getSize();
        }
      }
    }
  }

  return super.dispatchTouchEvent(event);        // pass data along when done!
}

