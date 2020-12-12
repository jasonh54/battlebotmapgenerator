class Grid{
  int row, col;
  ArrayList<Cell> cells = new ArrayList<Cell>();
  public Grid(){
    row = 0;
    col = 0;
  }
  public Grid(int row, int col){
    this.row = row;
    this.col = col;
    generateGrid();
  }
  public void generateGrid(){
    for(int row=0;row< this.row; row++){
      for(int col=0; col<this.col; col++){
        Cell c = new Cell(row*32, col*32);
        cells.add(c);
      }
    }
  }
  public void displayGrid(){
    for(int i=0; i<cells.size(); i++){
      cells.get(i).display();
    }
  }
  
}
