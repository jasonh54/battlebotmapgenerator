class MouseTile{
  float w = 32;
  float h = 32;
  PImage mouseImage;
  boolean isOccupied;
  public MouseTile(){
    isOccupied = false;
  }
  
  public void display(){
    if(mouseImage!=null){
      image(mouseImage,mouseX,mouseY,w,h);
    }
  }
  public void setMouseImage(PImage i){

      mouseImage = i;
      isOccupied = true;
    
  }
  
  public PImage getMouseImage(){
    return mouseImage;
  }
  
  public void clearMouseImage(){
    mouseImage = null;
    isOccupied = false;
  }
  
  
}
