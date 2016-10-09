// ICHING sketch; this one makes toss a 2D array to save all rolls;
// "moving" lines are given two different values, while "at rest" lines
// are given two of the same value.

// Two hexigrams are given and the number for the entry are given - the
// first is the dominant hexigram, the second is the "additional" hex
// that results from "moving" lines.

// The program also brings up a screen visualizing the hexigram, as
// well as the numbers.  The hexigram is rolled on a mouse click.

void setup() {
  size (600, 800);
  savedTime = millis();

  heaven = loadImage("heaven.png");
  lake = loadImage("lake.png");
  fire = loadImage("fire.png");
  thunder = loadImage("thunder.png");
  wind = loadImage("wind.png");
  water = loadImage("water.png");
  mountain = loadImage("mountain.png");
  earth = loadImage("earth.png");

  background(b);
  fill(f1);
  stroke(255);

  font = loadFont("TwCenMT-Bold-48.vlw");
  textFont(font, 32);

  textAlign(CENTER);
  text("[click here]", width/2, height/2);
}

void draw() {
  noStroke();
}

//int passedTime = millis() - savedTime;
// Has five seconds passed?
//if (passedTime > totalTime) {

void mousePressed() {
  fill(b);
  rect(0, 0, width, height);

  // possibilities for a coin toss are H (heads) or T (tails)
  int[] coin = {
    H, T
  };

  // three coins are tossed six times:
  for (int j = 0; j < 6; j++) {

    // toss the coin three times:
    for (int i = 0; i < 3; i++) {
      int index = int(random(coin.length)); // this picks either an H or T

      if (coin[index] == 3) {
        toss[i] = H; // add H to int[] toss
      } else if (coin[index] == 2) {
        toss[i] = T; // add T to int[] toss
      }
      //println(toss); // prints value of individual tosses
    }
    // this finds the sum of an individual toss
    int sum = 0;
    for (int i=0; i<toss.length; i++) {
      sum += toss[i];
    }
    // these totals indicate whether lines are "moving" or "at rest"
    if (sum == 8) {
      s1 = 1;
      s2 = 1;
      println("___ 8 | I");
      fill(f1);
      rect(x, height-(j*y)-y, w, h);
    } else if (sum == 7) {
      s1 = 0;
      s2 = 0;
      println("_ _ 7 | O");
      fill(f1);
      rect(x, height-(j*y)-y, w/2.5, h);
      rect(x+w-(w/2.5), height-(j*y)-y, w/2.5, h);
    } else if (sum == 9) {
      s1 = 1;
      s2 = 0;
      println("_+_ 9 | I/O");
      fill(f2);
      rect(x, height-(j*y)-y, w, h);
    } else {
      s1 = 0;
      s2 = 1;
      println("_._ 6 | O/I");
      fill(f2);
      rect(x, height-(j*y)-y, w/2.5, h);
      rect(x+w-(w/2.5), height-(j*y)-y, w/2.5, h);
    }
    // grow array for each hex reading

    hexigram_1[j] = s1;
    hexigram_2[j] = s2;
  }
  //println(hexigram_1);
  //println(hexigram_2);

  // write code here to section out trigrams,
  // then compare them to ICHING matrix.

  tri_1a[0] = hexigram_1[0];
  tri_1a[1] = hexigram_1[1];
  tri_1a[2] = hexigram_1[2];

  tri_1b[0] = hexigram_1[3];
  tri_1b[1] = hexigram_1[4];
  tri_1b[2] = hexigram_1[5];

  tri_2a[0] = hexigram_2[0];
  tri_2a[1] = hexigram_2[1];
  tri_2a[2] = hexigram_2[2];

  tri_2b[0] = hexigram_2[3];
  tri_2b[1] = hexigram_2[4];
  tri_2b[2] = hexigram_2[5];

  println(tri_1a);
  println(tri_1b);
  println(tri_2a);
  println(tri_2b);

  float imgX1 = 0;
  float imgY1 = height*.4;
  float imgX2 = 0;
  float imgY2 = 30;
  float imgW = width;
  float imgH = height*.6;

  // top trigram .png loads:
  if (tri_1b[0] == 1 && tri_1b[1] == 1 && tri_1b[2] == 1) {
    image(heaven, imgX2, imgY2, imgW, imgH);
  } else if (tri_1b[0] == 1 && tri_1b[1] == 0 && tri_1b[2] == 0) {
    image(thunder, imgX2, imgY2, imgW, imgH);
  } else if (tri_1b[0] == 0 && tri_1b[1] == 1 && tri_1b[2] == 0) {
    image(water, imgX2, imgY2, imgW, imgH);
  } else if (tri_1b[0] == 0 && tri_1b[1] == 0 && tri_1b[2] == 1) {
    image(mountain, imgX2, imgY2, imgW, imgH);
  } else if (tri_1b[0] == 0 && tri_1b[1] == 0 && tri_1b[2] == 0) {
    image(earth, imgX2, imgY2, imgW, imgH);
  } else if (tri_1b[0] == 0 && tri_1b[1] == 1 && tri_1b[2] == 1) {
    image(wind, imgX2, imgY2, imgW, imgH);
  } else if (tri_1b[0] == 1 && tri_1b[1] == 0 && tri_1b[2] == 1) {
    image(fire, imgX2, imgY2, imgW, imgH);
  } else {
    image(lake, imgX2, imgY2, imgW, imgH);
  }

  // bottom trigram .png loads:
  if (tri_1a[0] == 1 && tri_1a[1] == 1 && tri_1a[2] == 1) {
    image(heaven, imgX1, imgY1, imgW, imgH);
  } else if (tri_1a[0] == 1 && tri_1a[1] == 0 && tri_1a[2] == 0) {
    image(thunder, imgX1, imgY1, imgW, imgH);
  } else if (tri_1a[0] == 0 && tri_1a[1] == 1 && tri_1a[2] == 0) {
    image(water, imgX1, imgY1, imgW, imgH);
  } else if (tri_1a[0] == 0 && tri_1a[1] == 0 && tri_1a[2] == 1) {
    image(mountain, imgX1, imgY1, imgW, imgH);
  } else if (tri_1a[0] == 0 && tri_1a[1] == 0 && tri_1a[2] == 0) {
    image(earth, imgX1, imgY1, imgW, imgH);
  } else if (tri_1a[0] == 0 && tri_1a[1] == 1 && tri_1a[2] == 1) {
    image(wind, imgX1, imgY1, imgW, imgH);
  } else if (tri_1a[0] == 1 && tri_1a[1] == 0 && tri_1a[2] == 1) {
    image(fire, imgX1, imgY1, imgW, imgH);
  } else {
    image(lake, imgX1, imgY1, imgW, imgH);
  }


  for (int i = 0; i < 8; i++) {
    if (tri_1a[0] == tri[i][0] && tri_1a[1] == tri[i][1] && tri_1a[2] == tri[i][2]) {
      // now i = the row of the iching matrix
      row1 = i;
      println(row1);
    }
  }
  for (int j = 0; j < 8; j++) {
    if (tri_1b[0] == tri[j][0] && tri_1b[1] == tri[j][1] && tri_1b[2] == tri[j][2]) {
      // now i = the column of the iching matrix
      col1 = j;
      println(col1);
    }
  }
  for (int k = 0; k < 8; k++) {
    if (tri_2a[0] == tri[k][0] && tri_2a[1] == tri[k][1] && tri_2a[2] == tri[k][2]) {
      // now i = the row of the iching matrix
      row2 = k;
      println(row2);
    }
  }
  for (int m = 0; m < 8; m++) {
    if (tri_2b[0] == tri[m][0] && tri_2b[1] == tri[m][1] && tri_2b[2] == tri[m][2]) {
      // now i = the column of the iching matrix
      col2 = m;
      println(col2);
    }
  }
  // this should print the first hexigram #:
  println(iching[row1][col1], iching[row2][col2]);

  fill(f1);
  if (iching[row1][col1] == iching[row2][col2]) {
    text(iching[row1][col1], width/2, height/2);
  } else {
    text(iching[row1][col1]+" / "+iching[row2][col2], width/2, height/2);
  }
  //    }
  savedTime = millis(); // Save the current time to restart the timer!
}