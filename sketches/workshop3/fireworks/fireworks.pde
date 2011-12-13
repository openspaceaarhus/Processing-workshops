import processing.opengl.*;

/**
 * En fontæne som skyder masser af gnister afsted.
 *
 * Drej kanonen med piletasterne og skyd med mellemrumstasten
 * Kan også styres med musen
 *
 * Processing Workshop 3
 * Open Space Aarhus 
 *
 * http://gfx.osaa.dk
 */

final int ANTAL = 400;

// kanonkuglens position
float[] boldX = new float[ANTAL];
float[] boldY = new float[ANTAL];

// kanonkuglens hastighed
float[] deltaX = new float[ANTAL];
float[] deltaY = new float[ANTAL];

int[] alder = new int[ANTAL];

// tyngdeacceleration
float tyngdeAcc = 0.05;

// kanonens vinkel (45 grader)
float cannonA = -PI / 4.0;

// målskivens position
float targetX = 300;
float targetY = 300;

void setup() {
  size(600, 400, OPENGL);
  smooth();

  ellipseMode(CENTER);
  noStroke();
}

void draw() {
  // tegn et gennemsigtigt rektangel der fylder hele skærmen
  // det får tidligere billeder til at fade stille ud
  fill(0, 0, 0, 40);
  rect(0, 0, width, height);

  // send nye partikler afsted
  for (int i = 0; i < 2; i++) {
    skyd();
  }
  
  // opdater tilstanden af alle partikler
  for (int i = 0; i < ANTAL; i++) {
    // opdater alder
    alder[i]++;
    
    // tyngdekraft
    deltaY[i] += tyngdeAcc;

    // flyt kanonkuglen  
    boldX[i] += deltaX[i];
    boldY[i] += deltaY[i];

    // skift retning når bolden rammer venstre eller højre kant
    if (boldX[i] > width || boldX[i] < 0) {
      deltaX[i] = -deltaX[i];
      boldX[i] = constrain(boldX[i], 0, width);
    }

    // skift retning når bolden rammer bunden
    if (boldY[i] > height) {
      deltaY[i] = -deltaY[i];
      deltaX[i] *= 0.75;
      deltaY[i] *= 0.75;
      boldY[i] = constrain(boldY[i], 0, height);
    }

    // tegn kanonkugle
    fill(255, 255 - alder[i], 0);
    ellipse(boldX[i], boldY[i], 3, 3);
  }

  // tegn kanonen
  fill(200);
  translate(0, 400);
  rotate(cannonA);  
  rect(0, -10, 50, 20);
}

// hvilken kugle skyder vi med næste gang
int skyderMed = 0;

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

void mousePressed() {
  skyd();
}

float vinkelTilMus(float x, float y) {
  return atan2(mouseY - y, mouseX - x);
}

void mouseMoved() {
  cannonA = vinkelTilMus(0, 400);
}

void skyd() {
    float spredning = random(-0.05, 0.05);
    float vinkel = cannonA + spredning;
  
    // kanonkuglens start position
    boldX[skyderMed] = 0 + 50 * cos(vinkel);
    boldY[skyderMed] = 400 + 50 * sin(vinkel);

    float fart = random(5, 8);

    // kanonkuglens start hastighed
    deltaX[skyderMed] = fart * cos(vinkel);
    deltaY[skyderMed] = fart * sin(vinkel);

    // nulstil alder
    alder[skyderMed] = 0;
    
    // skyd med anden partikel næste gang
    skyderMed++;
    if (skyderMed == ANTAL) {
      skyderMed = 0;        
    }  
}

