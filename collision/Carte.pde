class Carte{
  int xx;
  int yy;
  
  Carte(){
  }
  
  void nature(char c, int x_, int y_, int ref){
    xx = x_ * t;
    yy = y_ * t;
    
    if(c == 'x'){
      fill(0, 0, 100);
    }
    if(c == '.'){
      fill(100, 0, 0);
    }
    rect(xx, yy, t, t);
    fill(255,0,0);
    text(ref, xx + 25, yy - 25);
  }
}