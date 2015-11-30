class Element{
  
  int xx;
  int yy;
  int ll;
  int hh;
  
  PImage dessin;
  
  Element(String nomFichier){
    dessin = loadImage(nomFichier + ".png");
  }
  
  void afficher(int x, int y, int l, int h){
    xx = x * t;
    yy = y * t;
    ll = l * t;
    hh = h * t;
    image(dessin, xx, yy, ll, hh);
  }
}