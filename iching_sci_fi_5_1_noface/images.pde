void triImage() {  

  float imgX1 = 0;
  float imgY1 = height*.4;
  float imgX2 = 0;
  float imgY2 = 30;
  float imgW = width;
  float imgH = height*.6;
 
 //int h1 = (iching[row1][col1])-1;
 //int h2 = (iching[row2][col2])-1;
 
 color t1 = bit[col2];
 color t2 = bit[row2];

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