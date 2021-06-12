class Cell{
  float x,y;
  float w,h;
  PImage image;
  public Cell(){
    x=0;
    y=0;
    w=32;
    h=32;
    image = null;
  }
  public Cell(int x, int y){
    this.x=x;
    this.y=y;
    w=32;
    h=32;
    image = null;
  }
  public void display(){
    fill(255);
    if(image == null){
      rect(x,y,w,h);
    } else {
      image(image,x,y,w,h);
    }
  }
  public void setImage(PImage i){
    image = i;
  }
  
  public PImage getImage(){
    return image;
  }
  public void moveLeftRight(float m){
    x+=m;
  }
  public void moveUpDown(float m){
    y+=m;
  }
  public boolean mouseOver(){
    if(mouseX > x && mouseX < x+32 && mouseY > y && mouseY < y+32){
      return true;
    } else {
      return false;
    }
  }

  
}
