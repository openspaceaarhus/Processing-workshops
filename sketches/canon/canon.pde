/**
 * Processing Workshop 2
 * Open Space Aarhus 
 * http://gfx.osaa.dk
 *
 * Drej kanonen med piletasterne og skyd med mellemrumstasten
 */

// kanonkuglens position
float boldX = 0;
float boldY = 400;

// kanonkuglens hastighed
float deltaX = 0;
float deltaY = 0;

// tyngdeacceleration
float tyngdeAcc = 0.1;

// kanonens vinkel (45 grader)
float cannonA = -PI / 4.0;

// målskivens position
float targetX = 300;
float targetY = 300;

void setup() {
  size(600, 400);
  smooth();
  
  ellipseMode(CENTER);
}

void draw() {
  // slet skærmen med en himmelblå farve
  background(200, 200, 255);

  // tyngdekraft
  deltaY += tyngdeAcc;
  
  // vindmodstand
  deltaX *= 0.996;
  deltaY *= 0.996;

  // flyt kanonkuglen  
  boldX += deltaX;
  boldY += deltaY;
  
  // skift retning når bolden rammer venstre eller højre kant
  if (boldX > width || boldX < 0) {
    deltaX = -deltaX;
    boldX = constrain(boldX, 0, width);
  }
  
  // skift retning når bolden rammer toppen eller bunden
  if (boldY > height || boldY < 0) {
    deltaY = -deltaY;
    deltaX *= 0.75;
    deltaY *= 0.75;
    boldY = constrain(boldY, 0, height);
  }
   
  // flyt målet til et nyt tilfældigt sted, hvis bolden rammer målet 
  if (dist(boldX, boldY, targetX, targetY) < 30) {
    targetX = 100 + random(400);
    targetY = 100 + random(200);
  }   
   
  // tegn kanonkugle
  fill(0);
  ellipse(boldX, boldY, 20, 20);  
  
  // tegn målskiven
  fill(255, 0, 0);
  ellipse(targetX, targetY, 40, 40);

  fill(255, 255, 255);  
  ellipse(targetX, targetY, 30, 30);
  
  fill(255, 0, 0);
  ellipse(targetX, targetY, 10, 10);
  
  // tegn kanonen
  translate(0, 400);
  rotate(cannonA);  
  rect(0, -10, 50, 20);
}

void keyPressed() {
  if (keyCode == LEFT) {
    // drej kanon mod uret
    cannonA -= 0.05;    
  } else if (keyCode == RIGHT) {
    // drej kanon med uret
    cannonA += 0.05;
  } else if (key == ' ') {
    // kanonkuglens start position
    boldX = 50 * cos(cannonA);
    boldY = 400 + 50 * sin(cannonA);
    
    // kanonkuglens start hastighed
    deltaX = 10 * cos(cannonA);
    deltaY = 10 * sin(cannonA);
  }  
}
