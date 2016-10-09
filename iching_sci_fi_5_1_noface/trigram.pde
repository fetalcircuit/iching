void trigram(int[] h1, int[] h2) {
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

  println(tri_1a);
  println(tri_1b);
  println(tri_2a);
  println(tri_2b);
}