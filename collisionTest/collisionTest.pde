Personnage personnage;
Obstacles[] obstacles = new Obstacles[30];

int t = 40;

void setup(){
  size(400, 400);
  background(255);
  personnage = new Personnage();
  //frameRate(10);
  for(int i = 0; i < obstacles.length; i++){
    obstacles[i] = new Obstacles();
  }
  noStroke();
}

void draw(){
  background(255);
  obstacles[0].afficher(100, 100);
  obstacles[1].afficher(200, 200);
  obstacles[2].afficher(340, 50);
  personnage.deplacer();
  personnage.afficher();
  personnage.collision();
}

class Personnage{
  int posX = width/2;
  int posY = height /2;
  
  int posG = t;
  int posH = t;
  int posD = t;
  int posB = t;
  
  Personnage(){
  }
  
  void afficher(){
    fill(255, 0, 0);
    rect(posX, posY, t, t);
  }
  
  void deplacer(){
    if(keyPressed){
      if(keyCode == UP){
        posY -= posH;
      }
      if(keyCode == DOWN){
        posY += posB;
      }
      if(keyCode == LEFT){
        posX -= posG;
      }
      if(keyCode == RIGHT){
        posX += posD;
      }
    }
  }
  
  void collision(){
    color g, d, h, b;
    g = get(posX - 1, posY);
    h = get(posX, posY - 1);
    d = get(posX + t + 1, posY);
    b = get(posX, posY + t + 1);
    ellipse(posX + t, posY, 10, 10);
    
    if(g == color(0,0,255)){
      posG = 0;
    } else {
      posG = 2;
    }
    if(d == color(0,0,255) || d + t == color(0,0,255)){
      posD = 0;
    } else {
      posD = 2;
    }
    if(h == color(0,0,255) || h + t == color(0,0,255)){
      posH = 0;
    } else {
      posH = 2;
    }
    if(b == color(0,0,255)){
      posB = 0;
    } else {
      posB = 2;
    }
  }
}

class Obstacles{
  Obstacles(){
  }
  
  void afficher(float i, float j){
    fill(0, 0, 255);
    rect(i, j, 30, 30);
  }
}