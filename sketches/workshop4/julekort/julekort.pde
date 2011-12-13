/**
 * Et julekort fra OSAAs processing workshop
 * Giver et eksempel på hvordan man kan lave sine egne klasser.
 *
 * Processing Workshop 4
 * Open Space Aarhus 
 *
 * http://gfx.osaa.dk
 */

final int ANTAL = 500;
Fnug[] snevejr = new Fnug[ANTAL];

PFont font;

void setup() {
  size(400, 400);
  smooth();
  noStroke();

  font = loadFont("Verdana-Bold-48.vlw");
  textFont(font, 100);

  for (int i = 0; i < ANTAL; i++) {
    float x = random(width);
    float y = random(height);
    float velY = random(1, 3);

    snevejr[i] = new Fnug(x, y, velY);
  }  
}

void shadowText(String besked, float x, float y) {
  fill(0);
  text(besked, x + 2, y + 2);

  fill(255);
  text(besked, x - 2, y - 2);

  fill(255, 0, 0);
  text(besked, x, y);  
}

void draw() {
  background(50, 100, 200);

  fill(255);
  for (int i = 0; i < ANTAL; i++) {
    Fnug fnug = snevejr[i];
    fnug.update();
    fnug.paint();
  }
  
  fill(255, 0, 0);  
  shadowText("God", 100, 200);

  fill(255, 0, 0);  
  shadowText("Jul", 100, 300);
}

