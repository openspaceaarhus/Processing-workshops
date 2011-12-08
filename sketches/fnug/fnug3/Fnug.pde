class Fnug {
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
}

