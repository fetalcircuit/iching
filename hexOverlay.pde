void hexOverlay(int[] hOver, int b) {
  
  for (int i=0; i<hOver.length; i++) {
    // these totals indicate whether lines are "moving" or "at rest"
    
    float h = (height-(7*b))/(hOver.length); // height of the lines
    
    float y = (height-b-((i+1)*h))-(b*i); // y-coordinate of the lines
    
    float sl = width-2*b; // width of solid hex line
    float bl = (width-2*b)/2.5; //width of broken line
    
    float xbl = b+sl-(bl); // x-coordinate of second dash of broken line
    
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