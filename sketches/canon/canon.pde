import processing.opengl.*;

/**
 * Processing Workshop 2
 * Open Space Aarhus 
 * http://gfx.osaa.dk
 *
 * Drej kanonen med piletasterne og skyd med mellemrumstasten
 */

final int ANTAL = 500;
int skyderMed = 0;
// kanonkuglens position
float boldX[] = new float[ANTAL];
float boldY[] = new float[ANTAL];

// kanonkuglens hastighed
float deltaX[] = new float[ANTAL];
float deltaY[] = new float[ANTAL];

int alder[] = new int[ANTAL];

// tyngdeacceleration
float tyngdeAcc = 0.1;

// kanonens vinkel (45 grader)
float cannonA = -PI / 4.0;

// målskivens position
float targetX = 300;
float targetY = 300;

void setup() {
  size(600, 400); //, OPENGL);
  //  smooth();

  ellipseMode(CENTER);
}

void draw() {
  fill(0, 0, 0, 10);
  rect(0, 0, width, height);
  if (mousePressed) {
    skyd();
    skyd();
    skyd();
  }

  for (int i = 0; i < ANTAL; i++) {
    alder[i]++;
    // tyngdekraft
    deltaY[i] += tyngdeAcc;

    // vindmodstand
    deltaX[i] *= 0.996;
    deltaY[i] *= 0.996;

    // flyt kanonkuglen  
    boldX[i] += deltaX[i];
    boldY[i] += deltaY[i];
    
    //blaesevejr
//    boldX[i] += 22.5;
    
    // skift retning når bolden rammer venstre eller højre kant
    if (boldX[i] > width || boldX[i] < 0) {
      deltaX[i] = -deltaX[i];
      boldX[i] = constrain(boldX[i], 0, width);
    }

    // skift retning når bolden rammer toppen eller bunden
    if (boldY[i] > height || boldY[i] < 0) {
      deltaY[i] = -deltaY[i];
      deltaX[i] *= 0.75;
      deltaY[i] *= 0.75;
      boldY[i] = constrain(boldY[i], 0, height);
    }

    //    // flyt målet til et nyt tilfældigt sted, hvis bolden rammer målet 
    //    if (dist(boldX[i], boldY[i], targetX, targetY) < 30) {
    //      targetX = 100 + random(400);
    //      targetY = 100 + random(200);
    //    }   

    // tegn kanonkugle
    noStroke();
    fill(255, 255-alder[i], 0);
    ellipse(boldX[i], boldY[i], 5, 5);
  }
  // drawTarget(targetX, targetY);
  // tegn kanonen
}

void keyPressed() {
  if (keyCode == LEFT) {
    // drej kanon mod uret
    cannonA -= 0.05;
  } 
  else if (keyCode == RIGHT) {
    // drej kanon med uret
    cannonA += 0.05;
  } 
  else if (key == ' ') {
    skyd();
  }
}

void skyd() {

  float vinkel = random(0, TWO_PI);

  float fart = random(2, 5);
  // kanonkuglens start position
  boldX[skyderMed] = mouseX;
  boldY[skyderMed] = mouseY;

  // kanonkuglens start hastighed
  deltaX[skyderMed] = fart * cos(vinkel);
  deltaY[skyderMed] = fart * sin(vinkel);
  alder[skyderMed] = 0;
  skyderMed = (skyderMed+1)%ANTAL;
}

void drawTarget(float x, float y) {
  // tegn målskiven
  fill(255, 0, 0);
  ellipse(x, y, 40, 40);

  fill(255, 255, 255);  
  ellipse(x, y, 30, 30);

  fill(255, 0, 0);
  ellipse(x, y, 10, 10);
}

float vinkelTilMus(float x, float y) {
  return atan2(mouseY-y, mouseX-x);
}

void mousePressed() {
  skyd();
}

void mouseMoved() {
  cannonA = vinkelTilMus(0, 400);
}

