/**
 * a sketch with some different drawing techniques
 * And a "generic particle"
 * Uncomment some lines for OpenGL
 */
import processing.opengl.*;
import javax.media.opengl.*; 

int W = 600, H = 600;
float CX = W/2, CY = H/2;

int NUM = 100;
Particle[] particles;

boolean drawVel = false;
boolean drawLines = true;
boolean drawBalls = false;

void setup() {
  size(W, H, OPENGL);
  hint(DISABLE_OPENGL_2X_SMOOTH);
  hint(ENABLE_OPENGL_4X_SMOOTH);
  //size(400, 400);
  ellipseMode(CENTER);
  //  colorMode(HSB);
  reset();
  background(0);
  smooth();
}

void reset() {
  particles = new Particle[NUM];
  float s = 1.0 / sqrt(NUM);
  s *= 10.3;
  float l = sqrt(NUM);
  for (int i = 0; i < NUM; i++) {
    float x = i%l;
    float y = i/l;
    Particle p = new Particle((float)mouseX, (float)mouseY);
    p.vel = new PVector( (l*s)/2 - x*s, (l*s)/2 - y *s);
    p.acc = new PVector(0, .031);
    particles[i] = p;
  }
}

void draw() {

  //openGL fun
  PGraphicsOpenGL pgl = (PGraphicsOpenGL) g;  // g may change
  GL gl = pgl.gl; 
  // This fixes the overlap issue
  gl.glDisable(GL.GL_DEPTH_TEST);
  //smoothing
  gl.glEnable (GL.GL_LINE_SMOOTH);
  gl.glEnable(GL.GL_POLYGON_SMOOTH);

  // Turn on the blend mode
  gl.glEnable(GL.GL_BLEND);
  gl.glBlendFunc(GL.GL_ZERO, GL.GL_ONE_MINUS_SRC_ALPHA);

  fill(0, 0, 0, 18);
  rectMode(CORNER);
  rect(0, 0, W, H);

  // Define the openGL blend mode
  gl.glBlendFunc(GL.GL_ONE, GL.GL_ONE);

  noFill();
  stroke(23, 355, 255);
  strokeWeight(3);
  ellipseMode(CORNER);
  ellipse(0, 0, W, H);
  strokeWeight(1);



  PVector last = null;
  for (int i = 0; i < NUM; i++) {
    Particle p = particles[i];
    p.tick();

    //a vector pointing to the center
    PVector N = new PVector(CX - p.pos.x, CY - p.pos.y);
    float d = N.mag();
    float outside = (d+p.R) - W/2;
    if (outside > 0) {
      N.normalize();
      p.reflect(N);
      //move the particle inside along th normal
      N.mult(outside);
      p.pos.add(N);
    }
    if (drawBalls) {
      p.draw();
    }
    if (drawVel) {
      p.displayVector();
    }
    if (drawLines) {
      noFill();
      strokeWeight(2.3);
    
      stroke(p.getColor());
      if (last != null && i%sqrt(NUM) != 0 ) {
        line(p.pos.x, p.pos.y, last.x, last.y);
      }
      last = p.pos.get();
    }
  }
}

void mousePressed() {
  reset();
}

void keyPressed() {
  if ('v' == key) {
    drawVel = !drawVel;
  }
  if ('l' == key) {
    drawLines = !drawLines;
  }

  if ('b' == key) {
    drawBalls = !drawBalls;
  }

  if ('a' == key) {
    NUM += 50; 
    println("Num: " + NUM);
    reset();
  }

  if ('c' == key) {
    background(0);
  }

  if ('d' == key) {
    NUM -= 50;
    NUM = max(0, NUM);
    println("Num: " + NUM);
    reset();
  }
}

