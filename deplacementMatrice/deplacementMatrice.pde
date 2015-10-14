//TEST 000
//Un personnage se promène

Personnage avatar;

int taille = 10;

void settings(){
  fullScreen(P2D);
}

void setup(){
  avatar = new Personnage();
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
  Personnage(){
  }
  
  void afficher(){
  }
  
  void deplacer(){
  }
}