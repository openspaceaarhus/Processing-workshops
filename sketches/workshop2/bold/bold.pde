/**
 * En bold der skifter retning når den rammer kanten
 *
 * Processing Workshop 2
 * Open Space Aarhus 
 * http://gfx.osaa.dk
 */

// boldens position
float boldX = 100;
float boldY = 200;

// boldens hastighed
float deltaX = 6;
float deltaY = 4;

void setup() {
  size(600, 400);
  smooth();
  ellipseMode(CENTER);
}

void draw() {
  background(200, 200, 200);

  // flyt kanonkuglen  
  boldX += deltaX;
  boldY += deltaY;
  
  // skift retning når bolden rammer venstre eller højre kant
  if (boldX > width || boldX < 0) {
    deltaX = -deltaX;
  }
  
  // skift retning når bolden rammer toppen eller bunden
  if (boldY > height || boldY < 0) {
    deltaY = -deltaY;
  }
      
  // tegn bold
  fill(0);
  ellipse(boldX, boldY, 20, 20);  
}

