//four map layers
//base
//sprites that looks weird without the base
//collidables
//sprites that you can walk under
//4 layers
//1)lowest bottom stuff
//2)trasparentcy
//3)collidables
//4)stuff the player is under
int[] collidableSprites = new int[]{170,171,172,189,190,191,192,193,194,195,196,197,198,199,221,222,223,224,225,226,237,238,248,249,250,251,252,253,254,255,256,257,258,259,260,261,262,263,264,265,270,271,272,273,274,275,276,278,279,280,286,287,288,289,290,291,292,297,298,299,300,301,302,303,304,305,306,307,318,319,327,328,329,330,331,332,333,334,335,336,337,338,340,341,342,344,345,346,354,355,356,357,358,359,360,361,362,363,364,365,367,368,369,370,371,372,373,381,382,383,384,385,386,387,388,389,390,391,392,414,415,416,417,418,419,420,421,422,423,424,425,426,427,443,444,445,446,453,454,470,471,472,473,474,475,476,477,478,479,480,481};
int[] portalSprites = new int[]{281,282,283,284,285,339,412,413};
int[] grassSprites = new int[]{0,1,2,3,4,5,6,7,27,28,29,30,31,32,33,34,54,55,56,57,58,59,60,61};
int[] transparentSprites = new int[]{0,1,2,3,4,7,30,31,54,56,57,59,60,61,170,172,173,174,177,200,201,224,226,227,229,230,231}; 
int[] walkUnderSprites = new int[]{162,163,164,165,166,167,168,169,216,217,218,219,220,232,233,234,235,236,243,244,245,246,247,313,314,315,316,317,393,394,395,396,397,398,399,400,408,409,410,411,447,448,449,450,451,452};

//array of tiles
PImage[] tiles;

MouseTile mt= new MouseTile();


//code for the large grid where you draw your sprites onto
Grid g = new Grid(45,45,0,0,480,480);
HScrollbar hs = new HScrollbar(0,480,480,10,1);
VScrollbar vs = new VScrollbar(480,0,10,480,1);
float prevX = hs.getPos();
float prevY = vs.getPos();

//code for the cells where you select the pictures
Grid g2 = new Grid(18,23,500,0,800,576);
//VScrollbar vs2 = new VScrollbar(736+500,0,10,576,1);
//float prevY2 = vs2.getPos();

boolean leftMouseDown = false;

void setup(){
  size(1280,720);
  
  String tilesPath = sketchPath() + "\\Tiles";
  println(tilesPath);

  File tilesFile = new File(tilesPath);
  String[] tilesList = tilesFile.list();
  tiles = new PImage[tilesList.length-(18*4)]; //tiles PImage
  
   //sort TilesPath
  String temp;
  int nums1;
  int nums2;
  for (int i = 0; i < tilesList.length; i++) {
    for (int k = 1; k < (tilesList.length - i); k++) {
      nums1 = Integer.parseInt(tilesList[k-1].substring(5, 9));
      nums2 = Integer.parseInt(tilesList[k].substring(5, 9));
      if (nums1 > nums2) {
        temp = tilesList[k-1];
        tilesList[k-1] = tilesList[k];
        tilesList[k] = temp;
      }
    }
  }
  //load in every image in the Tiles folder
  int k = 0;
  for(int i = 0; i < tilesList.length-4; i++){
    println(tilesList[i]);
    if((i+4)%27==0){
      i+=4;
    }
    tiles[k] = loadImage(tilesPath + "/" + tilesList[i]);
    k++;
  }
  
  g2.populateCells(tiles);
}
void draw(){
  background(0);
  g.displayGrid();
  hs.display();
  hs.update();
  vs.display();
  vs.update();
  
  g.moveLeftRight( (hs.getPos()-prevX)*-2 );
  prevX = hs.getPos();
  g.moveUpDown( (vs.getPos()-prevY)*-2 );
  prevY = vs.getPos();
  
  g2.displayGrid();
  //vs2.display();
  //vs2.update();
  //g2.moveUpDown( (vs2.getPos()-prevY2)*-4 );
  //prevY2 = vs2.getPos();
  g2.mouseOnCell(mt);
  mt.display();
  
  g.setCellImage(mt);
}

void mousePressed(){
  leftMouseDown = true;
}

void mouseReleased(){
  leftMouseDown = false;
}
