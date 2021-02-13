class HScrollbar{
  float swidth, sheight, xpos, ypos, spos, newspos, sposMin, sposMax;
  int loose;
  boolean over;
  boolean locked;
  float ratio;
  
  public HScrollbar(float xp, float yp, int sw, int sh, int l){
    swidth = sw;
    sheight = sh;
    int widthtoheight = sw - sh;
    ratio = (float)sw/ (float)widthtoheight;
    xpos = xp;
    ypos = yp;
    spos = xpos + swidth/2 - sheight/2;
    newspos = spos;
    sposMin = xpos;
    sposMax = xpos + swidth-sheight;
    loose = l;
  }
  void display(){
    //noStroke();
    fill(204);
    rect(xpos, ypos, swidth, sheight);
    if(over || locked){
      fill(0,0,0);
    }else{
      fill(102,102,102);
    }
    rect(spos,ypos,sheight,sheight);
  }
  void update(){
    if(mouseOver()){
      over = true;
    }else{
      over = false;
    }
    if(mousePressed && over){
      locked = true;
    }
    if(!mousePressed){
      locked = false;
    }
    if(locked){
      newspos = constrain(mouseX - sheight/2, sposMin, sposMax);
    }
    if(abs(newspos - spos) > 1){
      spos = spos + (newspos-spos)/loose;
    }
  }
  boolean mouseOver(){
    if(mouseX > xpos && mouseX < xpos+swidth && mouseY > ypos && mouseY < ypos+sheight){
      return true;
    } else {
      return false;
    }
  }
  float getPos(){
    return spos * ratio;
  }
}
