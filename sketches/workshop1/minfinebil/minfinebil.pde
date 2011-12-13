/**
 * Bruger processings tegnefunktioner til at
 * tegne en lille rød bil
 *
 * Processing workshop 1
 * Open Space Aarhus
 * 
 * http://gfx.osaa.dk
 */

// åben et vindue der er 400x400 pixels
size(400, 400);

// tegn pænt
smooth();

// farv hele skærmen lysegrå
background(200, 200, 200);

// de næste figure tegnes uden kant
noStroke();

// tegn to røde kasser (karrosseriet)
fill(255, 0, 0);
rect(100, 300, 200, 50);
rect(200, 250, 5, 100); 

// tegn to sorte cirkler (hjul)
fill(0, 0, 0);
ellipse(150, 350, 50, 50);
ellipse(250, 350, 50, 50);

// tegn to hvide cirkler (hjulkapsler)
fill(255, 255, 255);
ellipse(150, 350, 20, 20);
ellipse(250, 350, 20, 20);

// næste figurer skal ikke udfyldes
noFill();

// men kanten skal farves rød og være 5 pixels bred
stroke(255, 0, 0);
strokeWeight(5);

// tegn en bue (bilens tag)
arc(200, 300, 100, 100, -PI, 0);

// gem resultatet i en fil i data-folderen
saveFrame("minFineBil.jpg");

