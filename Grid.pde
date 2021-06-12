class Grid{
  int row, col;
  ArrayList<Cell> cells = new ArrayList<Cell>();
  int x,y;
  int width, height;
  
  public Grid(){
    row = 0;
    col = 0;
    x=0;
    y=0;
    width = 0;
    height = 0;
  }
  public Grid(int row, int col, int x, int y, int width, int height){
    this.row = row;
    this.col = col;
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    generateGrid();
  }
  public void generateGrid(){
    for(int row=0;row< this.row; row++){
      for(int col=0; col<this.col; col++){
        Cell c = new Cell(x+col*32, y+row*32);
        cells.add(c);
      }
    }
  }
  public void displayGrid(){
    for(int i=0; i<cells.size(); i++){
      cells.get(i).display();
    }
    fill(0);
    square(width+x,0+y,800);
    square(0+x,height+y,800);
  }
  public void moveLeftRight(float m){
    
    for(int i = 0; i< cells.size(); i++ ){
      cells.get(i).moveLeftRight(m);
    }
  }
  public void moveUpDown(float m){
    for(int i = 0; i< cells.size(); i++ ){
      cells.get(i).moveUpDown(m);
    }
  }
  
  public void populateCells(PImage[] images){
    for(int i=0; i<images.length; i++){
      cells.get(i).setImage(images[i]);
    }
  }
  public void mouseOnCell(MouseTile mt){
    for(int i =0; i<cells.size(); i++){
      if(cells.get(i).mouseOver() && leftMouseDown){
        mt.setMouseImage(cells.get(i).getImage());
      }
    }
  }
  public void setCellImage(MouseTile mt){
    for(int i =0; i<cells.size(); i++){
      if(cells.get(i).mouseOver() && leftMouseDown){
        cells.get(i).setImage(mt.getMouseImage());
      }
    }
  }
}
