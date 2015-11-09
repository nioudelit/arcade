class Personnage{
  
  PImage[] animation = new PImage[4];
  int curseurAnimation;
  int X, Y;
  
  Personnage(String imgAvatar){
    for(int i = 0; i < animation.length; i++){
      animation[i] = loadImage(imgAvatar + i + ".png");
    }
  }
  
  void afficher(int x, int y){
    curseurAnimation = curseur;
    fill(255, 0, 0);
    x *= t;
    y *= t;
    image(animation[curseurAnimation], posX + x, posY + y, t, t);
  }
  
  void deplacer(){
    if(keyPressed){
      
      //VERIF DIRECTION
      curseurDir += 1;
      if(curseurDir > 1){
        curseurDir = 0;
      }
      directions[curseurDir] = curseur;
      
      if(keyCode == UP){
        curseur = 0;
        //Y -= (t / 2 * collision);
      } 
      if(keyCode == DOWN){
        curseur = 1; 
        //Y += (t / 2 * collision);
      } 
      if(keyCode == LEFT){
        curseur = 2;
        //X-= (t / 2 * collision);
      }
      if(keyCode == RIGHT){
        curseur = 3;
        //X += (t / 2 * collision);
      }
    }
  }
}