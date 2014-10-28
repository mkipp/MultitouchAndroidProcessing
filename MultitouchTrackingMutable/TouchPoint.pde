/**
 *  representation of a single touch point.
 */
class TouchPoint {

  final static float MAX_RING_WIDTH = 18;
  final static float CIRC_RADIUS = 60;

  boolean active = true;
  int id;
  float x;
  float y;
  float pressure;
  float size;
  float orient; // orientation in radians, 0 = up

  public TouchPoint(int id, float x, float y, float pressure, float size, float orient) {
    this.id = id;
    this.x = x;
    this.y = y;
    this.pressure = pressure;
    this.size = size;
    this.orient = orient;
  }

  /*
  public TouchPoint(TouchPoint p) {
    set(p);
  }


  public void set(TouchPoint p) {
    id = p.id;
    x = p.x;
    y = p.y;
    pressure = p.pressure;
    size = p.size;
    orient = p.orient;
    active = p.active;
  }
  */

  void draw() {
    fill(255);
    noStroke();
    ellipse(x, y, 40, 40);
    stroke(255, 80);
    noFill();

    // outer ring width is proportional to size
    strokeWeight(size * MAX_RING_WIDTH);

    // inner circle
    ellipse(x, y, 2*CIRC_RADIUS, 2*CIRC_RADIUS);

    // orientation line
    stroke(#FF3B3B); // red
    strokeWeight(2);
    line(x - CIRC_RADIUS * cos(PI/2-orient), 
    y - CIRC_RADIUS * sin(PI/2-orient), 
    x + CIRC_RADIUS * sin(orient), 
    y + CIRC_RADIUS * cos(orient));


    // info text
    textAlign(LEFT, CENTER);
    text("x: " + x, x + CIRC_RADIUS + 15, y - 8);
    text("y: " + y, x + CIRC_RADIUS + 15, y + 8);
    text("s: " + size, x + CIRC_RADIUS + 15, y + 24);
    text("p: " + pressure, x + CIRC_RADIUS + 15, y + 40);
    text("o: " + orient, x + CIRC_RADIUS + 15, y + 56);
    textAlign(CENTER, CENTER);
    fill(0);
    text("" + id, x, y - CIRC_RADIUS);
    text("" + id, x, y + CIRC_RADIUS);
  }
}

