class Maison{
  
  
  PImage dessin;
  
  Maison(String nomMaison){
    dessin = loadImage(nomMaison + ".png");
  }
  
  void afficher(int x, int y, int l, int h){
    int xx = x;
    int yy = y;
    int ll = l;
    int hh = h;
    image(dessin, xx * taille, yy * taille, taille * ll, taille * hh);
  }
}