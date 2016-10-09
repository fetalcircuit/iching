// ICHING sketch; this one makes toss a 2D array to save all rolls;
// "moving" lines are given two different values, while "at rest" lines
// are given two of the same value.

// Two hexigrams are given and the number for the entry are given - the
// first is the dominant hexigram, the second is the "additional" hex
// that results from "moving" lines.

// The program also brings up a screen visualizing the hexigram, as
// well as the numbers.  The hexigram is rolled on a mouse click.
import processing.pdf.*;

void setup() {
  size (600, 800);
  //fullScreen();
  savedTime = millis();

  heaven = loadImage("heaven.png");
  lake = loadImage("lake.png");
  fire = loadImage("fire.png");
  thunder = loadImage("thunder.png");
  wind = loadImage("wind.png");
  water = loadImage("water.png");
  mountain = loadImage("mountain.png");
  earth = loadImage("earth.png");

  //PImage[] face = new PImage[8];
  
  /*for ( int i = 0; i < face.length; i++ )
  {
    face[i] = loadImage(i + ".png");   // make sure images "0.jpg" to "11.jpg" exist
  }*/

  face[0] = loadImage("0.png");
  face[1] = loadImage("1.png");
  face[2] = loadImage("2.png");
  face[3] = loadImage("3.png");
  face[4] = loadImage("4.png");
  face[5] = loadImage("5.png");
  face[6] = loadImage("6.png");
  face[7] = loadImage("7.png");
  face[8] = loadImage("8.png");
  face[9] = loadImage("9.png");
  face[10] = loadImage("10.png");

  background(bg);

  font = loadFont("TwCenMT-Bold-48.vlw");
  textFont(font, 32);

  textAlign(CENTER);
  text("[click here]", width/2, height/2);
}

void draw() {
  //noStroke();
}

// IF AUTOMATING THE "MOUSEPRESSED" FUNCTION: 
//  int passedTime = millis() - savedTime;
//    ** comment out "mousePressed()" and put in "draw" function, 
//    ** within an "if" statement
// Has five seconds passed?
//  if (passedTime > totalTime) {

void mousePressed() {
  //generates the hexigrams:
  hexigram();
  //populates the trigrams from generated hexigrams:
  trigram(hexigram_1, hexigram_2);

  //INCLUDE FOR AUTOMATION: savedTime = millis(); // Save the current time to restart the timer!

  //generates the hexigram number from the 2D array:
  hexNum(tri, tri_1a, tri_1b, tri_2a, tri_2b);

  //generates background color from hex #
  fill(hue[(iching[row1][col1])-1]);
  //fill(hue[(iching[row2][col2])-1], 100);
  noStroke();
  rect(0, 0, width, height);

  //calls the images corresponding to the 2 trigrams
  triImage();

  /*
  tint(255, 180);
   //image(face7, 0, 0, width, height);
   pushMatrix();
   translate(width, 0);
   scale(-1, 1);
   //image(face4, 0, 0, width, height);
   popMatrix();
   */

  //generates the hexigram overlay
  hexOverlay(overlay, b);

  println(face);

  // number text for reference
  fill(255, 200);
  if (iching[row1][col1] == iching[row2][col2]) {
    text(iching[row1][col1], width/2, height/2);

    tint(255, 180);
    //image(face[int(random(11))] /*face[iching[row1][col1]]*/, 0, 0, width, height);
  } else {
    text(iching[row1][col1]+" / "+iching[row2][col2], width/2, height/2);

    tint(255, 180);
    //image(face[int(random(11))] /*face[iching[row1][col1]]*/, 0, 0, width, height);
    pushMatrix();
    translate(width, 0);
    scale(-1, 1);
    //image(face[int(random(11))] /*face[iching[row2][col2]]*/, 0, 0, width, height);
    popMatrix();
  }
}

void keyPressed() {
  if (key == ' ') {
    saveFrame("image-###.png");
  }
}
