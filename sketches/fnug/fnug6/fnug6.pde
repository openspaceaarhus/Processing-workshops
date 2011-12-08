final int ANTAL = 100;

Fnug[] fnug = new Fnug[ANTAL];
PFont font;
PImage baggrund;

void shadowText(String txt, float x, float y) {
  fill(0);
  text(txt, x + 2, y + 2);
  fill(255);
  text(txt, x - 2, y - 2);
  fill(255, 0, 0);
  text(txt, x, y);  
}

void setup() {
  size(400, 400);  
  noStroke();
  smooth();
  
  font = loadFont("Verdana-Bold-48.vlw");
  textFont(font, 100);
  
  baggrund = loadImage("snelandskab.jpg");
  
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
  
  image(baggrund, 0, 0);

  fill(255);
  for (int i = 0; i < ANTAL; i++) {
    fnug[i].update();  
    fnug[i].paint();
  }
  
  shadowText("God", 100, 150);  
  shadowText("Jul", 120, 250);  
}

