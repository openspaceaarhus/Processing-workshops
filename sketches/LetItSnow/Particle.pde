public class Particle {
  PVector pos;
  PVector vel;
  float dampening = .996;
  PVector acc;
  float dt = .60;
  float R = 1.4; //radius
  int age;
  color col;

  public Particle(float x, float y) {
    this.pos = new PVector(x, y);
    this.vel = new PVector();
    this.acc = new PVector(); 
    age = 0;
  }

  void tick() {
    PVector dv = acc.get();
    dv.mult(dt);
    vel.add(dv);
    vel.mult(dampening);

    PVector ds = vel.get();
    ds.mult(dt);
    pos.add(ds);
    age++;
    
    //wrap X
    if (pos.x > width)
    pos.x -= width;
    else if (pos.x < 0)
    pos.x += width;
  }

  void draw() {
    fill(col);
    noStroke();
    ellipseMode(CENTER);
    ellipse(pos.x, pos.y, 2*R, 2*R);
    //openGL likes quads...
//    rectMode(CENTER);
//    rect(pos.x, pos.y, 2*R, 2*R);
  }

  //borrowed from Daniel Shiftman
  void displayVector(PVector v, float x, float y, float scayl) {
    pushMatrix();
    float arrowsize = 4;
    // Translate to location to render vector
    translate(x, y);
    stroke(255);
    // Call vector heading function to get direction (note that pointing up is a heading of 0) and rotate
    rotate(v.heading2D());
    // Calculate length of vector & scale it to be bigger or smaller if necessary
    float len = v.mag()*scayl;
    // Draw three lines to make an arrow (draw pointing up since we've rotate to the proper direction)
    line(0, 0, len, 0);
    line(len, 0, len-arrowsize, +arrowsize/2);
    line(len, 0, len-arrowsize, -arrowsize/2);
    popMatrix();
  }

  void reflect(PVector N) {
    PVector tmp = N.get();
    tmp.mult(2 * N.dot(vel));
    vel.sub(tmp);
  }

  void  displayVector() {
    displayVector(vel, pos.x, pos.y, R);
  }

  void setColor(color col) {
    this.col = col;
  }
  
}

