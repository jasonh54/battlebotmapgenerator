class VScrollbar{
  float swidth, sheight, xpos, ypos, spos, newspos, sposMin, sposMax;
  int loose;
  boolean over;
  boolean locked;
  float ratio;
  
  public VScrollbar(float xp, float yp, int sw, int sh, int l){
    swidth = sw;
    sheight = sh;
    int widthtoheight = sh-sw;
    ratio = (float)sh/ (float)widthtoheight;
    xpos = xp;
    ypos = yp;
    spos = ypos + sheight/2 - swidth/2;
    newspos = spos;
    sposMin = ypos;
    sposMax = ypos + sheight - swidth;
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
    rect(xpos,spos,swidth,swidth);
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
      newspos = constrain(mouseY - swidth/2, sposMin, sposMax);
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
