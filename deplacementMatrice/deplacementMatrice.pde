//TEST 000
//Un personnage se promène

Personnage avatar;

int taille = 20;
int curseur;

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