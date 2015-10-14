class Maison{
  
  int xx;
  int yy;
  int ll;
  int hh;
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
    if(avatar.X() > xx * taille && avatar.X() < xx * taille + ll * taille
    && avatar.Y() > yy * taille && avatar.Y() < yy * taille + ll * taille){
      println("TOUCHE MAISON");
    } else {
      println("PAS DEDANS");
    }
  }
}