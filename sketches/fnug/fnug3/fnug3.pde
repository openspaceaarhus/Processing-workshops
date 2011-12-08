Fnug fnug = new Fnug();

void setup() {
  size(400, 400);  
  noStroke();
  smooth();
}

void draw() {
  background(50, 100, 200);
  fnug.update();
  fnug.paint();
}

