class Animation{
  
  PImage[] animation;
  PGraphics pg;
  int curseurAnimation; int maxImage;
  float fonduIn;
  float fonduOut;
  
  int xx, yy, ll, hh;
  
  Animation(String nomFichier, int nombreImageAnimation){
    animation = new PImage[nombreImageAnimation];
    maxImage = nombreImageAnimation;
    for(int i = 0; i < 3; i++){
      animation[i] = loadImage(nomFichier + i + ".jpg");
    }
    pg = createGraphics(1440, 900);
  }
  
  //FONDU
  void IN(int x, int y, int l, int h, float vitesseFade){
    vitesseAnimation(1);
    fonduIn = constrain(fonduIn += vitesseFade, 0, 255);
    tint(255, fonduIn);
    xx = x * t;
    yy = y * t;
    ll = l * t;
    hh = h * t;
    
    image(animation[curseurAnimation], xx, yy, ll, hh);
  }
  
  void OUT(int x, int y, int l, int h, float vitesseFade){
    vitesseAnimation(1);
    fonduOut = constrain(fonduOut -= vitesseFade, 0, 255);
    tint(255, fonduOut);
    xx = x * t;
    yy = y * t;
    ll = l * t;
    hh = h * t;
    image(animation[curseurAnimation], xx, yy, ll, hh);
  }
  
  //deplacement panoramique
  void panoramique(boolean gaucheDroite, int x, int y, int l, int h, float vit){
    if(gaucheDroite){
      x += vit;
      y += vit;
    } else {
      x -= vit;
      y -= vit;
    }
    image(animation[curseurAnimation], x, y, l, h);
  }
  
    void vitesseAnimation(int i){
    curseurAnimation+=i;
    if(curseurAnimation == maxImage){
      curseurAnimation = 0;
    }
  }
}