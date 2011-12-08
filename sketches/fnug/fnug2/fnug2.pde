float posX = 200;
float posY = 200;

float velX = 0;
float velY = 1;

void update() {
  posX += velX;
  posY += velY;
  
  if (posY > height) {
    posY = 0;
  }
}

void paint() {
  ellipse(posX, posY, 10, 10);  
}

void setup() {
  size(400, 400);  
  noStroke();
  smooth();
}

void draw() {
  background(50, 100, 200);
  update();
  paint();
}
