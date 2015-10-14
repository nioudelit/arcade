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
    image(animation[curseurAnimation], posX, posY, taille * 4, taille * 4);
  }
  
  void deplacer(){
    if(keyPressed){
      if(keyCode == UP){
        curseur = 0;
        posY -= taille;
      } 
      if(keyCode == DOWN){
        curseur = 1; 
        posY += taille;
      } 
      if(keyCode == LEFT){
        curseur = 2;
        posX-= taille;
      }
      if(keyCode == RIGHT){
        curseur = 3;
        posX += taille;
      }
    }
  }
}