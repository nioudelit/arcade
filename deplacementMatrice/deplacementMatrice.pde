//TEST 000
//Un personnage se promène

Personnage avatar;

int taille = 20;

void settings(){
  fullScreen(P2D);
}

void setup(){
  avatar = new Personnage("chevalier");
}

void draw(){
  avatar.afficher();
  avatar.deplacer();
  grille();
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
  int x, y;
  
  Personnage(String imgAvatar){
    for(int i = 0; i < animation.length; i++){
      animation[i] = loadImage(imgAvatar + ".png");
    }
  }
  
  void afficher(){
    image(animation[curseurAnimation], x, y);
  }
  
  void deplacer(){
  }
  
  void keyPressed(){
    if(keyCode == UP){
      curseurAnimation = 0;
    }
    if(keyCode == DOWN){
      curseurAnimation = 1;     
    }
    if(keyCode == LEFT){
      curseurAnimation = 2;
    }
    if(keyCode == RIGHT){
      curseurAnimation = 3;
    }
  }
}