// ICHING sketch; this one makes toss a 2D array to save all rolls;
// "moving" lines are given two different values, while "at rest" lines
// are given two of the same value.

// Two hexigrams are given and the number for the entry are given - the
// first is the dominant hexigram, the second is the "additional" hex
// that results from "moving" lines.

// The program also brings up a screen visualizing the hexigram, as
// well as the numbers.  The hexigram is rolled on a mouse click.
// universal variables:

// hexigram number, adding the H and T values of all arrays

// first: 2D array for ICHING matrix
// here it is in ORDER (for reference):
//            iching = {  { 1, 34,  5, 26, 11,  9, 14, 43},
//                        {25, 51,  3, 27, 24, 42, 21, 17},
//                        { 6, 40, 29,  4,  7, 59, 64, 47},
//                        {33, 62, 39, 52, 15, 53, 56, 31},
//                        {12, 16,  8, 23,  2, 20, 35, 45},
//                        {44, 32, 48, 18, 46, 57, 50, 28},
//                        {13, 55, 63, 22, 36, 37, 30, 49},
//                        {10, 54, 60, 41, 19, 61, 38, 58}  };
var bit = [
  "#ffffff", //white - heaven
  "#ffff00", //yellow - thunder
  "#0000ff", //blue - water
  "#ff00ff", //magenta - mountain
  "#808080", //black - earth
  "#00ffff", //cyan - wind
  "#ff0000", //red - fire
  "#00ff00", //cyan - lake
];

var bk = [
  "#ff0000",
  "#ff3333",
  "#ff6600",
  "#ff9933",
  "#ffcc00",
  "#ffff00",
  "#ccff33",
  "#99ff33",
  "#66ff33",
  "#33cc33",
  "#00ff00",
  "#00ff99",
  "#00ffcc",
  "#33cccc",
  "#00ccff",
  "#0099ff",
  "#0066ff",
  "#6666ff",
  "#9966ff",
  "#cc33ff",
  "#ff00ff",
  "#ff33cc",
  "#ff0066",
  "#ff3399",
  "#ff5050",
  "#ff6666",
  "#ff9966",
  "#ffcc66",
  "#ffff66",
  "#ccff66",
  "#99ff66",
  "#66ff66",
  "#66ff99",
  "#66ffcc",
  "#00ffff",
  "#66ccff",
  "#99ccff",
  "#9999ff",
  "#cc66ff",
  "#ff66ff",
  "#ff66cc",
  "#ff6699",
  "#ff9999",
  "#ffcc99",
  "#ffff99",
  "#ccff99",
  "#99ff99",
  "#99ffcc",
  "#66ffff",
  "#ccccff",
  "#cc99ff",
  "#ff99ff",
  "#ff99cc",
  "#ffcccc",
  "#ffffcc",
  "#ccffcc",
  "#ccffff",
  "#00cc66",
  "#99cc00",
  "#cccc00",
  "#0099cc",
  "#00cc99",
  "#ff9900",
  "#00cc00"
];

var font;

var heaven;
var lake;
var fire;
var thunder;
var wind;
var water;
var mountain;
var earth;

var savedTime;
var totalTime = 5000;

var iching = [
  [1, 34, 5, 26, 11, 9, 14, 43],
  [25, 51, 3, 27, 24, 42, 21, 17],
  [6, 40, 29, 4, 7, 59, 64, 47],
  [33, 62, 39, 52, 15, 53, 56, 31],
  [12, 16, 8, 23, 2, 20, 35, 45],
  [44, 32, 48, 18, 46, 57, 50, 28],
  [13, 55, 63, 22, 36, 37, 30, 49],
  [10, 54, 60, 41, 19, 61, 38, 58]
];

// [columns][rows] of the trigram matrix
var tri = [
  [
    1, 1, 1
  ],
  [
    1, 0, 0
  ],
  [
    0, 1, 0
  ],
  [
    0, 0, 1
  ],
  [
    0, 0, 0
  ],
  [
    0, 1, 1
  ],
  [
    1, 0, 1
  ],
  [
    1, 1, 0
  ]
];

var H = 3; //heads
var T = 2; //tails

// possibilities for a coin toss are H (heads) or T (tails)
//int[] coin = {H, T};

// sums are converted into 1s and 0s to enter into hex array
var s1;
var s2;

// row and column coordinates to access iching matrix
var row1;
var row2;
var col1;
var col2;

// choices of heads or tails
var coin = [
  H, T
];

// each toss, yielding a "moving" or "at rest" line
var toss = [3];

// stores values that will print as overlaid hexigram lines
var overlay = [6];

// two hexigrams, dependent upon "moving" or "at rest" lines
var hexigram_1 = [6];
var hexigram_2 = [6];

// each of the four trigrams, parsed from the hexigram to access matrix
var tri_1a = [3];
var tri_1b = [3];
var tri_2a = [3];
var tri_2b = [3];

// LAYOUT:

var b = 40; // border around iching hexigram, if any

// COLORS:

// line colors:
var m;
var r;

// fill color for background:
var bg;

var num = 3.984375;

var h = 64;

//for text elements
var p1;
var p2;
var lines = [];
var txt = [];

function preload() {
  heaven = loadImage("data/heaven.png");
  lake = loadImage("data/lake.png");
  fire = loadImage("data/fire.png");
  thunder = loadImage("data/thunder.png");
  wind = loadImage("data/wind.png");
  water = loadImage("data/water.png");
  mountain = loadImage("data/mountain.png");
  earth = loadImage("data/earth.png");

  //lines1 = loadStrings('data/1.txt');
  //lines2 = loadStrings('data/2.txt');

  //font = loadFont("data/TwCenMT-Bold-48.vlw");
  //font = textFont('Helvetica');


  for (var i = 0; i < h; i++) {
    lines[i] = loadStrings("data/"+(i+1)+".txt");
  }

}

function setup() {
  createCanvas(450, 600);

  // join() joins the elements of an array
  // Here we pass in a line break to retain formatting

  for (var i = 0; i < h; i++) {
    txt[i] = join(lines[i], "<br/><br/>");
  }

  savedTime = millis();

  m = color(255, 100); // color of moving line
  r = color(255, 75); // color of at rest line

  // fill color for background:
  bg = color(198, 231, 206);

  //PImage[] face = new PImage[8];

  background(bg);

  //textFont(font, 32);

  textAlign(CENTER, CENTER);
  text("ONLINE ICHING\n\nCLICK HERE TO ASK A QUESTION AND RECEIVE GUIDANCE\n\nTips:\n\nThe question should be something that currently preoccupies you.\nMake sure your official question and your real question are one and the same.\nThe timeframe should be over the next few weeks or months.\n\nChanging signs mean you have TWO readings.\nTHE FIRST READING is how things currently are.\nTHE SECOND READING is how things will be after the period of change is over.", width / 2, height / 2);
}

function draw() {
  //noStroke();
}

// IF AUTOMATING THE "MOUSEPRESSED" FUNCTION:
//  int passedTime = millis() - savedTime;
//    ** comment out "mousePressed()" and put in "draw" function,
//    ** within an "if" statement
// Has five seconds passed?
//  if (passedTime > totalTime) {

function mousePressed() {
  //generates the hexigrams:
  hexigram();
  //populates the trigrams from generated hexigrams:
  trigram(hexigram_1, hexigram_2);

  //INCLUDE FOR AUTOMATION: savedTime = millis(); // Save the current time to restart the timer!

  //generates the hexigram number from the 2D array:
  hexNum(tri, tri_1a, tri_1b, tri_2a, tri_2b);

  //generates background color from hex #
  var c = bk[(iching[row1][col1]) - 1];
  fill(color(c));
  //print(hue[(iching[row1][col1])-1]);
  //fill(c);
  //fill(hue[(iching[row2][col2])-1], 100);
  noStroke();
  rect(0, 0, width, height);

  //calls the images corresponding to the 2 trigrams
  triImage();

  //generates the hexigram overlay
  hexOverlay(overlay, b);

  // number text for reference
  fill(255, 200);
  if (iching[row1][col1] == iching[row2][col2]) {
    text(iching[row1][col1], width / 2, height / 2);

    // paragraph for reading
p1 = createP(txt[(iching[row1][col1])-1]).addClass("text1");
//p = createP((iching[row1][col1])+".txt");
p1.position(450, 0);
p1.size(830, 570);

    tint(255, 180);
  } else {
    text(iching[row1][col1] + " / " + iching[row2][col2], width / 2, height / 2);

//p = createP(iching[row1][col1] + " / " + iching[row2][col2], width / 2, height / 2);
//var para2 = table.getRow(iching[row1][col1]+1); //get() for the specific column value you want
//var para3 = table.getRow(iching[row2][col2]+1);
//p = createP(para2 + " / " + para3);
p1 = createP(txt[(iching[row1][col1])-1]).addClass("text1");
p1.position(450, 0);
p1.size(400, 570);

p2 = createP(txt[(iching[row2][col2])-1]).addClass("text2");
p2.position(880, 0);
p2.size(400, 570);

    tint(255, 180);
    push();
    translate(width, 0);
    scale(-1, 1);
    pop();
  }
}

function hexigram() {
  // possibilities for a coin toss are H (heads) or T (tails)
  var coin = [
    H, T
  ];

  // three coins are tossed six times:
  for (var j = 0; j < 6; j++) {

    // toss the coin three times:
    for (var i = 0; i < 3; i++) {
      var index = int(random(coin.length)); // this picks either an H or T

      if (coin[index] == 3) {
        toss[i] = H; // add H to int[] toss
      } else if (coin[index] == 2) {
        toss[i] = T; // add T to int[] toss
      }
      //println(toss); // prints value of individual tosses
    }
    // this finds the sum of an individual toss
    var sum = 0;
    for (var i = 0; i < toss.length; i++) {
      sum += toss[i];
    }
    // these totals indicate whether lines are "moving" or "at rest"
    if (sum == 8) {
      s1 = 1;
      s2 = 1;
      print("___ 8 | I");
      //fill(f1);
      //rect(x, height-(j*y)-y, w, h);
      // populate array with time through for cycle, and sum:
      overlay[j] = sum;
    } else if (sum == 7) {
      s1 = 0;
      s2 = 0;
      print("_ _ 7 | O");
      overlay[j] = sum;
    } else if (sum == 9) {
      s1 = 1;
      s2 = 0;
      print("_+_ 9 | I/O");
      overlay[j] = sum;
    } else {
      s1 = 0;
      s2 = 1;
      print("_._ 6 | O/I");
      overlay[j] = sum;
    }
    // grow array for each hex reading

    hexigram_1[j] = s1;
    hexigram_2[j] = s2;
  }
}

//function hexNum (var[][] t, var[] t1, var[] t2, var[] t3, var[] t4) {
function hexNum(t, t1, t2, t3, t4) {

  for (var i = 0; i < 8; i++) {
    if (t1[0] == t[i][0] && t1[1] == t[i][1] && t1[2] == t[i][2]) {
      // now i = the row of the iching matrix
      row1 = i;
      print(row1);
    }
  }
  for (var j = 0; j < 8; j++) {
    if (t2[0] == t[j][0] && t2[1] == t[j][1] && t2[2] == t[j][2]) {
      // now i = the column of the iching matrix
      col1 = j;
      print(col1);
    }
  }
  for (var k = 0; k < 8; k++) {
    if (t3[0] == t[k][0] && t3[1] == t[k][1] && t3[2] == t[k][2]) {
      // now i = the row of the iching matrix
      row2 = k;
      print(row2);
    }
  }
  for (var m = 0; m < 8; m++) {
    if (t4[0] == t[m][0] && t4[1] == t[m][1] && t4[2] == t[m][2]) {
      // now i = the column of the iching matrix
      col2 = m;
      print(col2);
    }
  }
  // this should print the first hexigram #:
  print(iching[row1][col1], iching[row2][col2]);
}

function hexOverlay(hOver, b) {

  for (var i = 0; i < hOver.length; i++) {
    // these totals indicate whether lines are "moving" or "at rest"

    var h = (height - (7 * b)) / (hOver.length); // height of the lines

    var y = (height - b - ((i + 1) * h)) - (b * i); // y-coordinate of the lines

    var sl = width - 2 * b; // width of solid hex line
    var bl = (width - 2 * b) / 2.5; //width of broken line

    var xbl = b + sl - (bl); // x-coordinate of second dash of broken line

    strokeWeight(3);
    noFill();

    if (hOver[i] == 8) {
      fill(r);
      noStroke();
      rect(b, y, sl, h);
    } else if (hOver[i] == 7) {
      fill(r);
      noStroke();
      rect(b, y, bl, h);
      rect(xbl, y, bl, h);
    } else if (hOver[i] == 9) {
      stroke(m);
      noFill();
      rect(b, y, sl, h);
    } else {
      stroke(m);
      noFill();
      rect(b, y, bl, h);
      rect(xbl, y, bl, h);
    }
  }
}

function triImage() {

  var imgX1 = 0;
  var imgY1 = height * .4;
  var imgX2 = 0;
  var imgY2 = 30;
  var imgW = width;
  var imgH = height * .6;

  //int h1 = (iching[row1][col1])-1;
  //int h2 = (iching[row2][col2])-1;

  var t1 = bit[col2];
  var t2 = bit[row2];

  // top trigram .png loads:
  if (tri_1b[0] == 1 && tri_1b[1] == 1 && tri_1b[2] == 1) {
    //tint is derived by the corresponding tri_2b trigram
    tint(t2);
    image(heaven, imgX2, imgY2, imgW, imgH);
  } else if (tri_1b[0] == 1 && tri_1b[1] == 0 && tri_1b[2] == 0) {
    tint(t2);
    image(thunder, imgX2, imgY2, imgW, imgH);
  } else if (tri_1b[0] == 0 && tri_1b[1] == 1 && tri_1b[2] == 0) {
    tint(t2);
    image(water, imgX2, imgY2, imgW, imgH);
  } else if (tri_1b[0] == 0 && tri_1b[1] == 0 && tri_1b[2] == 1) {
    tint(t2);
    image(mountain, imgX2, imgY2, imgW, imgH);
  } else if (tri_1b[0] == 0 && tri_1b[1] == 0 && tri_1b[2] == 0) {
    tint(t2);
    image(earth, imgX2, imgY2, imgW, imgH);
  } else if (tri_1b[0] == 0 && tri_1b[1] == 1 && tri_1b[2] == 1) {
    tint(t2);
    image(wind, imgX2, imgY2, imgW, imgH);
  } else if (tri_1b[0] == 1 && tri_1b[1] == 0 && tri_1b[2] == 1) {
    tint(t2);
    image(fire, imgX2, imgY2, imgW, imgH);
  } else {
    tint(t2);
    image(lake, imgX2, imgY2, imgW, imgH);
  }

  // bottom trigram .png loads:
  if (tri_1a[0] == 1 && tri_1a[1] == 1 && tri_1a[2] == 1) {
    tint(t1);
    image(heaven, imgX1, imgY1, imgW, imgH);
  } else if (tri_1a[0] == 1 && tri_1a[1] == 0 && tri_1a[2] == 0) {
    tint(t1);
    image(thunder, imgX1, imgY1, imgW, imgH);
  } else if (tri_1a[0] == 0 && tri_1a[1] == 1 && tri_1a[2] == 0) {
    tint(t1);
    image(water, imgX1, imgY1, imgW, imgH);
  } else if (tri_1a[0] == 0 && tri_1a[1] == 0 && tri_1a[2] == 1) {
    tint(t1);
    image(mountain, imgX1, imgY1, imgW, imgH);
  } else if (tri_1a[0] == 0 && tri_1a[1] == 0 && tri_1a[2] == 0) {
    tint(t1);
    image(earth, imgX1, imgY1, imgW, imgH);
  } else if (tri_1a[0] == 0 && tri_1a[1] == 1 && tri_1a[2] == 1) {
    tint(t1);
    image(wind, imgX1, imgY1, imgW, imgH);
  } else if (tri_1a[0] == 1 && tri_1a[1] == 0 && tri_1a[2] == 1) {
    tint(t1);
    image(fire, imgX1, imgY1, imgW, imgH);
  } else {
    tint(t1);
    image(lake, imgX1, imgY1, imgW, imgH);
  }
}

function trigram(h1, h2) {
  // write code here to section out trigrams,
  // then compare them to ICHING matrix.

  tri_1a[0] = h1[0];
  tri_1a[1] = h1[1];
  tri_1a[2] = h1[2];

  tri_1b[0] = h1[3];
  tri_1b[1] = h1[4];
  tri_1b[2] = h1[5];

  tri_2a[0] = h2[0];
  tri_2a[1] = h2[1];
  tri_2a[2] = h2[2];

  tri_2b[0] = h2[3];
  tri_2b[1] = h2[4];
  tri_2b[2] = h2[5];

  print(tri_1a);
  print(tri_1b);
  print(tri_2a);
  print(tri_2b);
}
