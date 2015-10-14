//TEST 000
//Un personnage se promène

Personnage avatar;

int taille = 20;
int x, y;
int curseur;
boolean dep = false;

void settings(){
  //fullScreen(P2D);
  size(500, 500, P2D);
  
}

void setup(){
  avatar = new Personnage("chevalier");
  frameRate(10);
}

void draw(){
  background(255);
  avatar.afficher();
  avatar.deplacer();
  //grille();
}

void grille(){
  for(int i = 0; i < width; i++){
    line(i * taille, 0, i * taille, height);
  }
  for(int i = 0; i < height; i++){
    line(0, i * taille, width, i * taille);
  }
}

class Personnage{
  
  PImage[] animation = new PImage[4];
  int curseurAnimation;
  int posX, posY;
  
  Personnage(String imgAvatar){
    for(int i = 0; i < animation.length; i++){
      animation[i] = loadImage(imgAvatar + i + ".png");
    }
  }
  
  void afficher(){
    curseurAnimation = curseur;
    posX = x;
    posY = y;
    //println(x);
    //println(y);
    image(animation[curseurAnimation], x, y, taille * 4, taille * 4);
  }
  
  void deplacer(){
    if(keyPressed){
      if(keyCode == UP){
        curseur = 0;
        y -= taille;
      } 
      if(keyCode == DOWN){
        curseur = 1; 
        y += taille;
      } 
      if(keyCode == LEFT){
        curseur = 2;
        x -= taille;
      }
      if(keyCode == RIGHT){
        curseur = 3;
        x += taille;
      }
    }
  }
}

 void keyPressed(){
    
}