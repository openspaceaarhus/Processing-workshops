
size(400, 400);
int x = 200, y = 200;

background(#FFFFFF);
int d = 20;
fill(#FFF000);  
ellipse(x, y, 120, 120);
strokeWeight(3.5);
noFill();
ellipse(x+d, y-d, d, d);
ellipse(x-d, y-d, d, d);

stroke(0);
strokeWeight(5);
arc(x, y+5, 30, 30, 0, PI);
fill(#FF0000);
triangle(x-15, y-50, x, y-100, x+15, y-50);

