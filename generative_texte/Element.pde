class Element{
  
  int xx;
  int yy;
  int ll;
  int hh;
  
  PImage dessin;
  
  Element(String nomFichier){
    dessin = loadImage(nomFichier + ".png");
  }
  
  void afficher(int x, int y, int l, int h, char c){
    xx = x * t;
    yy = y * t;
    ll = l * t;
    hh = h * t;
    
    if(c == '1'){
      image(dessin, xx, yy, ll, hh);
      if(x == posX && y == posY){
        if(foule[x][y] == 0){
          fill(0, 255, 0);
          ellipse(100, 100, 100, 100);
          texteGeneratif += "Soudain, Cheval et Chevalier marchèrent sur une fleur vers " + hour() + "h" + minute() + " et " + second() + "secondes. ";
          foule[x][y] = 1;
        }
      }
    } else {
      fill(0);
      rect(xx, yy, l, h);
    }
  }
}