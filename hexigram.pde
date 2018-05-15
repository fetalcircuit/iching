void hexigram() {
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
      //fill(f1);
      //rect(x, height-(j*y)-y, w, h);
      // populate array with time through for cycle, and sum:
      overlay[j] = sum;
    } else if (sum == 7) {
      s1 = 0;
      s2 = 0;
      println("_ _ 7 | O");
      //fill(f1);
      //rect(x, height-(j*y)-y, w/2.5, h);
      //rect(x+w-(w/2.5), height-(j*y)-y, w/2.5, h);
      overlay[j] = sum;
    } else if (sum == 9) {
      s1 = 1;
      s2 = 0;
      println("_+_ 9 | I/O");
      //fill(f2);
      //rect(x, height-(j*y)-y, w, h);
      overlay[j] = sum;
    } else {
      s1 = 0;
      s2 = 1;
      println("_._ 6 | O/I");
      //fill(f2);
      //rect(x, height-(j*y)-y, w/2.5, h);
      //rect(x+w-(w/2.5), height-(j*y)-y, w/2.5, h);
      overlay[j] = sum;
    }
    // grow array for each hex reading

    hexigram_1[j] = s1;
    hexigram_2[j] = s2;
  }
  //println(hexigram_1);
  //println(hexigram_2);
}