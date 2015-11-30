class Animation{
  
  PImage dessin;
  float fonduIn;
  float fonduOut;
  
  int xx, yy, ll, hh;
  
  Animation(String nomFichier){
    dessin = loadImage(nomFichier + ".png");
  }
  
  void IN(int x, int y, int l, int h, float vitesseFade){
    fonduIn = constrain(fonduIn += vitesseFade, 0, 255);
//    tint(255, fondu);
    xx = x * t;
    yy = y * t;
    ll = l * t;
    hh = h * t;
    image(dessin, xx, yy, ll, hh);
  }
  
  void OUT(int x, int y, int l, int h, float vitesseFade){
    fonduOut = constrain(fonduOut -= vitesseFade, 0, 255);
//    tint(255, fondu);
    xx = x * t;
    yy = y * t;
    ll = l * t;
    hh = h * t;
    image(dessin, xx, yy, ll, hh);
  }
}