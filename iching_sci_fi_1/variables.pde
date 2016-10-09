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
PImage heaven;
PImage lake;
PImage fire;
PImage thunder;
PImage wind;
PImage water;
PImage mountain;
PImage earth;

float imgX1 = width/2;
float imgY1 = height*.4;
float imgX2 = 0;
float imgY2 = 0;
float imgW = width/2;
float imgH = height/2;

String[][] iching = {  
  { 
    "1", "34", "5", "26", "11", "9", "14", "43"
  }
  , 
  {
    "25", "51", "3", "27", "24", "42", "21", "17"
  }
  , 
  { 
    "6", "40", "29", "4", "7", "59", "64", "47"
  }
  , 
  {
    "33", "62", "39", "52", "15", "53", "56", "31"
  }
  , 
  {
    "12", "16", "8", "23", "2", "20", "35", "45"
  }
  , 
  {
    "44", "32", "48", "18", "46", "57", "50", "28"
  }
  , 
  {
    "13", "55", "63", "22", "36", "37", "30", "49"
  }
  , 
  {
    "10", "54", "60", "41", "19", "61", "38", "58"
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

// two hexigrams, dependent upon "moving" or "at rest" lines
int[] hexigram_1 = new int[6];
int[] hexigram_2 = new int[6];

// each of the four trigrams, parsed from the hexigram to access matrix
int[] tri_1a = new int[3];
int[] tri_1b = new int[3];
int[] tri_2a = new int[3];
int[] tri_2b = new int[3];

// x-coordinate placement of hex lines
int x = 20;
// y-coordinate spacing of lines
int y = 57;
// width of hex lines
int w = 260;
// height of hex lines
int h = 40;

// fill color for "at rest" lines
color f1 = (0);
color f2 = #84CF96;

// fill color for background

color b = #C6E7CE;

