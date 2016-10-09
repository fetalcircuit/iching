void hexNum (int[][] t, int[] t1, int[] t2, int[] t3, int[] t4) {

  for (int i = 0; i < 8; i++) {
    if (t1[0] == t[i][0] && t1[1] == t[i][1] && t1[2] == t[i][2]) {
      // now i = the row of the iching matrix
      row1 = i;
      println(row1);
    }
  }
  for (int j = 0; j < 8; j++) {
    if (t2[0] == t[j][0] && t2[1] == t[j][1] && t2[2] == t[j][2]) {
      // now i = the column of the iching matrix
      col1 = j;
      println(col1);
    }
  }
  for (int k = 0; k < 8; k++) {
    if (t3[0] == t[k][0] && t3[1] == t[k][1] && t3[2] == t[k][2]) {
      // now i = the row of the iching matrix
      row2 = k;
      println(row2);
    }
  }
  for (int m = 0; m < 8; m++) {
    if (t4[0] == t[m][0] && t4[1] == t[m][1] && t4[2] == t[m][2]) {
      // now i = the column of the iching matrix
      col2 = m;
      println(col2);
    }
  }
  // this should print the first hexigram #:
  println(iching[row1][col1], iching[row2][col2]);

}