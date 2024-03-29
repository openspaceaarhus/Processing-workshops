/**
 * Denne Fnug klasse indkapsler tilstanden for et snefnug
 * samt de funktioner der skal bruges til at opdatere og
 * tegne snefnugget.
 *
 * Processing Workshop 4
 * Open Space Aarhus 
 *
 * http://gfx.osaa.dk
 */

class Fnug {
  float posX;
  float posY;

  float velX = 0;
  float velY = 1;
  
  float fnugSize;

  // constructor
  Fnug(float x, float y, float vy) {
    posX = x;
    posY = y;
    velY = vy;
    velX = random(-1, 1);
    fnugSize = random(3, 8);
  }

  void update() {
    posX += velX;
    posY += velY;

    if (posY > height) {
      posY = 0;
    }
  }

  void paint() {
    ellipse(posX, posY, fnugSize, fnugSize);
  }
}

