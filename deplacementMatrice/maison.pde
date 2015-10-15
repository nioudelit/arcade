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
  }
  
  void penetre(){
    //remplacer [0] par [i] (boucle)
    if(avatar[0].X() >= xx * taille && avatar[0].X() <= xx * taille + ll * taille
    && avatar[0].Y() >= yy * taille && avatar[0].Y() <= yy * taille + ll * taille){
      println("TOUCHE MAISON");
      in = true;
    } else {
      println("PAS DEDANS");
      in = false;
    }
  }
  void evenement(){
    if(in){
      image(test, 0, 0);
    }
  }
}