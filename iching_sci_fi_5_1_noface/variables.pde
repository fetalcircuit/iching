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

PImage[] face = new PImage[64];

/*
PImage face0;
PImage face1;
PImage face2;
PImage face3;
PImage face4;
PImage face5;
PImage face6;
PImage face7;
*/

color[] bit = {
  #FFFFFF, //white - heaven
  #FFFF00, //yellow - thunder
  #0000FF, //blue - water
  #FF00FF, //magenta - mountain
  #808080, //black - earth
  #00FFFF, //cyan - wind
  #FF0000, //red - fire
  #00FF00, //cyan - lake
};

color[] hue = {  
  #FF0000, 
  #FF3333, 
  #FF6600, 
  #FF9933, 
  #FFCC00, 
  #FFFF00, 
  #CCFF33, 
  #99FF33, 
  #66FF33, 
  #33CC33, 
  #00FF00, 
  #00FF99, 
  #00FFCC, 
  #33CCCC, 
  #00CCFF, 
  #0099FF, 
  #0066FF, 
  #6666FF, 
  #9966FF, 
  #CC33FF, 
  #FF00FF, 
  #FF33CC, 
  #FF0066, 
  #FF3399, 
  #FF5050, 
  #FF6666, 
  #FF9966, 
  #FFCC66, 
  #FFFF66, 
  #CCFF66, 
  #99FF66, 
  #66FF66, 
  #66FF99, 
  #66FFCC, 
  #00FFFF, 
  #66CCFF, 
  #99CCFF, 
  #9999FF, 
  #CC66FF, 
  #FF66FF, 
  #FF66CC, 
  #FF6699, 
  #FF9999, 
  #FFCC99, 
  #FFFF99, 
  #CCFF99, 
  #99FF99, 
  #99FFCC, 
  #66FFFF, 
  #CCCCFF, 
  #CC99FF, 
  #FF99FF, 
  #FF99CC, 
  #FFCCCC, 
  #FFFFCC, 
  #CCFFCC, 
  #CCFFFF, 
  #00CC66, 
  #99CC00, 
  #CCCC00, 
  #0099CC, 
  #00CC99, 
  #FF9900, 
  #00CC00
};

PFont font;

PImage heaven;
PImage lake;
PImage fire;
PImage thunder;
PImage wind;
PImage water;
PImage mountain;
PImage earth;

int savedTime;
int totalTime = 5000;

/*float imgX1 = width/2;
 float imgY1 = height*.4;
 float imgX2 = 0;
 float imgY2 = 0;
 float imgW = width/2;
 float imgH = height/2;*/

int[][] iching = {  
  { 
    1, 34, 5, 26, 11, 9, 14, 43
  }
  , 
  {
    25, 51, 3, 27, 24, 42, 21, 17
  }
  , 
  { 
    6, 40, 29, 4, 7, 59, 64, 47
  }
  , 
  {
    33, 62, 39, 52, 15, 53, 56, 31
  }
  , 
  {
    12, 16, 8, 23, 2, 20, 35, 45
  }
  , 
  {
    44, 32, 48, 18, 46, 57, 50, 28
  }
  , 
  {
    13, 55, 63, 22, 36, 37, 30, 49
  }
  , 
  {
    10, 54, 60, 41, 19, 61, 38, 58
  }
};

// [columns][rows] of the trigram matrix
int[][] tri = {
  {
    1, 1, 1
  }
  , 
  {
    1, 0, 0
  }
  , 
  {
    0, 1, 0
  }
  , 
  {
    0, 0, 1
  }
  , 
  {
    0, 0, 0
  }
  , 
  {
    0, 1, 1
  }
  , 
  {
    1, 0, 1
  }
  , 
  {
    1, 1, 0
  }
};

int H = 3; //heads
int T = 2; //tails

// possibilities for a coin toss are H (heads) or T (tails)
//int[] coin = {H, T};

// sums are converted into 1s and 0s to enter into hex array
int s1;
int s2;

// row and column coordinates to access iching matrix
int row1;
int row2;
int col1;
int col2;

// choices of heads or tails
int[] coin = {
  H, T
};

// each toss, yielding a "moving" or "at rest" line
int[] toss = new int[3];

// stores values that will print as overlaid hexigram lines
int[] overlay = new int[6];

// two hexigrams, dependent upon "moving" or "at rest" lines
int[] hexigram_1 = new int[6];
int[] hexigram_2 = new int[6];

// each of the four trigrams, parsed from the hexigram to access matrix
int[] tri_1a = new int[3];
int[] tri_1b = new int[3];
int[] tri_2a = new int[3];
int[] tri_2b = new int[3];

// LAYOUT:

int b = 40; // border around iching hexigram, if any

// COLORS:

// line colors: 
color m = color(255, 100); // color of moving line
color r = color(255, 75); // color of at rest line

// fill color for background:
color bg = #C6E7CE;

float num = 3.984375;