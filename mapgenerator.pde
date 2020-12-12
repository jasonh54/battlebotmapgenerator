//four map layers
//base
//sprites that looks weird without the base
//collidables
//sprites that you can walk under

Grid g = new Grid(15,15);
void setup(){
  size(800,800);
}
void draw(){
  g.displayGrid();
}
