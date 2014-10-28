/*
 * Displaying touch points and all information that come with them.
 * Size and pressure seem to be equivalent with size being in 
 * the more useful value range [0, 1].
 *
 * Orientation does not seem work on my testing device (Nexus 7).
 *
 * (c) 2014 Michael Kipp
 * Augsburg University of Applied Sciences
 * http://michaelkipp.de
 */

import java.util.*;
import android.view.MotionEvent;

Object lock = new Object(); // for sync lock
List<TouchPoint> points = new ArrayList<TouchPoint>();

void setup() {
  smooth();
  fill(255);
  stroke(255);
  textSize(14);
}

void draw() {
  background(#BA5EF5);

  // draw touch points
  synchronized (lock) {
    for (TouchPoint p: points) {
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
    points.clear();
    for (int i = 0; i < event.getPointerCount(); i++) {
      // ignore the point where finger is being lifted right now
      if (i != event.getActionIndex() || event.getActionMasked() != MotionEvent.ACTION_UP)
        points.add(new TouchPoint(event.getPointerId(i), 
        event.getX(i), event.getY(i), event.getPressure(i), 
        event.getSize(i), event.getOrientation(i)));
        //println("orient: " + event.getOrientation(i));
    }
  }

  println(points.size() + " touches");
  return super.dispatchTouchEvent(event);        // pass data along when done!
}

