//four map layers
//base
//sprites that looks weird without the base
//collidables
//sprites that you can walk under

Grid g = new Grid(15,15);
HScrollbar hs = new HScrollbar(0,480,480,10,1);
VScrollbar vs = new VScrollbar(480,0,10,480,1);
void setup(){
  size(800,800);
}
void draw(){
  g.displayGrid();
  hs.display();
  hs.update();
  vs.display();
  vs.update();
}
