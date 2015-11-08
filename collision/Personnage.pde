class Personnage{
  Personnage(){
  }
  
  void afficher(){
    rect(x, y, t, t);
  }
  
  void deplacer(){
    if(keyPressed){
    if(keyCode == UP){
      y-=t;
    }
    if(keyCode == DOWN){
      y+=t;
    }
    if(keyCode == LEFT){
      x-=t;
    }
    if(keyCode == RIGHT){
      x+=t;
    }
  }
  }
}