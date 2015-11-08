//La collision.
//l'interaction avec l'univers pourrait être géré en deux parties:
//1- mosaiques de cases avec différentes natures (dures, interactives, neutres)
//2- habillage, qui maquille les cases avec lesquelles on interagit

int nombreCases = 100;
int longueurLigne = 10;
int compteur = 100;

Personnage perso = new Personnage();
Carte[] pattern = new Carte[nombreCases];
int t = 40;
int x, y;

void setup(){
  size(400, 400, P2D);
  frameRate(10);
  
  for(int i = 0; i < pattern.length; i++){
    pattern[i] = new Carte();
  }
}

void draw(){
  background(100, 100, 0);
  
  //for(int i = 0; i < pattern.length; i++){
  //  for(int j = 0; j < longueurLigne; j++){
  //    for(int k = 0; k < longueurLigne; k++){
  //      pattern[i].nature('.', j , k, i);
  //    };  //  }
  //}
  
  while(compteur < 100){
    int i = 0; int j = 0;
    pattern[compteur].nature('.', i, j, compteur);
    i++;
    if(i >= longueurLigne){
      i = 0;
      j+=1;
    }
    compteur++;
  }
  
  perso.afficher();
  perso.deplacer();
  grille();
}

void grille(){
  int taille = t;
  stroke(0, int(map(mouseX, 0, width, 0, 255)));
  for(int i = 0; i < width; i++){
    line(i * taille, 0, i * taille, height);
  }
  for(int i = 0; i < height; i++){
    line(0, i * taille, width, i * taille);
  }
}