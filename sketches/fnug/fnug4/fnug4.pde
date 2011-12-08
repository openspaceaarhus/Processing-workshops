final int ANTAL = 100;

Fnug[] fnug = new Fnug[ANTAL];

void setup() {
  size(400, 400);  
  noStroke();
  smooth();
  
  for (int i = 0; i < ANTAL; i++) {
    fnug[i] = new Fnug();
    fnug[i].posX = random(0, width);
    fnug[i].posY = random(0, height);
    fnug[i].velY = random(1, 3);
    fnug[i].velX = random(-1, 1);
  }
}

void draw() {
  background(50, 100, 200);

  for (int i = 0; i < ANTAL; i++) {
    fnug[i].update();  
    fnug[i].paint();
  }
}

