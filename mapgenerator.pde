//four map layers
//base
//sprites that looks weird without the base
//collidables
//sprites that you can walk under

Grid g = new Grid(15,15);
HScrollbar hs = new HScrollbar(0,480,480,10,1);
VScrollbar vs = new VScrollbar(480,0,10,480,1);
float prevX = hs.getPos();
float prevY = vs.getPos();
void setup(){
  size(800,800);
}
void draw(){
  background(0);
  g.displayGrid();
  hs.display();
  hs.update();
  vs.display();
  vs.update();
  g.moveLeftRight( (hs.getPos()-prevX)*2 );
  prevX = hs.getPos();
  g.moveUpDown( (vs.getPos()-prevY)*2 );
  prevY = vs.getPos();
}
