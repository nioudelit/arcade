
void renduGraphiqueGrille() {
  int test;
  test = int(map(mouseX, 0, width, 0, 255));

  for (int i = 0; i < col; i++) {
    for (int j = 0; j < ligne; j++) {
      if (grille[i][j] == '1') {
        fill(0, test);
      } else {
        fill(255, test);
      }
      rect(i * t, j * t, t, t);
    }
  }
  fill(255, 0, 0);
  rect(posX * t, posY * t, t, t);
}

void grille() {
  pushStyle();
  stroke(255, 255, 0);
  for (int i = 0; i < col; i++) {
    text(i, i * t + 10, 30);
    line(i * t, 0, i*t, height);
  }
  for (int i = 0; i < ligne; i++) {
    line(0, i * t, width, i * t);
    text(i, 10, i * t + 30);
  }
  popStyle();
}