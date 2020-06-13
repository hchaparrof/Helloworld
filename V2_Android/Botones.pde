abstract class Boton {
  float x, y, d;
  color c1;
  boolean selec;
  Boton(float tempX, float tempY, float tempD, color tempC1, boolean tempSelec) {
    x = tempX;
    y = tempY;
    d = tempD;
    c1 = tempC1;
    selec = tempSelec;
  }
  void display() {
    pushMatrix();
    translate(x, y);
    stroke(c1);
    fill(c1);
    dibujarboton();
    popMatrix();
  }
  abstract void dibujarboton();
  abstract void rango (color a);
  abstract void desplazar();
  void seleccion() {
    if (selec) {
      c1=0;
    } else {
      c1=color(255, 128, 0);
    }
    if (mousePressed) {
      if (x-d< mouseX && mouseX<x+d && y-d< mouseY && mouseY<y+d) {
        selec=true;
        mousePressed=false;
      } else {
      }
    }
  }
}
