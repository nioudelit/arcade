class Maison{
  
  int xx;
  int yy;
  int ll;
  int hh;
  
  boolean in;
  boolean inv = false;
  
  PImage dessin;
  
  Maison(String nomMaison){
    dessin = loadImage(nomMaison + ".png");
  }
  
  void afficher(int x, int y, int l, int h){
    xx = x;
    yy = y;
    ll = l;
    hh = h;
    image(dessin, xx * taille, yy * taille, taille * ll, taille * hh);
  }
  
  void collision(){
    if(avatar[0].X() > xx * taille - taille && avatar[0].X() <= xx * taille + ll * taille
    && avatar[0].Y() >= yy * taille && avatar[0].Y() <= yy * taille + ll * taille){
      println("touche");
      if(directions[0] == directions[1]){
        collision = -1;
      } else if (directions[0] != directions[1]){
        collision = 0;
      }
    } else {
      collision = 1;
      println("pas touche");
    }
  }
  
  void verifcollision(){
    int t = taille;
    fill(255, 0, 0, 120);
    rect(xx * t, yy * t, ll * t, hh * t);
  }
  
  void penetre(){
    //remplacer [0] par [i] (boucle)
    if(avatar[0].X() >= xx * taille && avatar[0].X() <= xx * taille + ll * taille
    && avatar[0].Y() >= yy * taille && avatar[0].Y() <= yy * taille + ll * taille){
      //println("TOUCHE MAISON");
      in = true;
      //collision = 0;
    } else {
      //println("PAS DEDANS");
      in = false;
      //collision = 1;
    }
  }
  void evenement(){
    if(in){
      image(test, 0, 0);
    }
  }
}