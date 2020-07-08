abstract class Boton {
  float x, y, d;
  color c1, c2;
  boolean selec;
  PImage icono;
  Boton(float tempX, float tempY, float tempD, color tempC1, color tempC2, boolean tempSelec, PImage tempIcono) {
    x = tempX;
    y = tempY;
    d = tempD;
    c1 = tempC1;
    c2 = tempC2;
    selec = tempSelec;
    icono = tempIcono;
  }
  void display() {
    pushMatrix();
    translate(x, y);
    stroke(c2);
    fill(c1);
    dibujarboton();
    popMatrix();
  }
  abstract void dibujarboton();
  abstract void dibujarbarra();
  abstract void icono();
  abstract void rango (color a,color gf);
  abstract void desplazar();
  abstract void escogerc();
  abstract void coloc(int a);
  void seleccion() {
    if (selec) {
      c2=color(50,50,50);
    } else {
      c2=color(255,128,0);
    }
    if (mousePressed) {
      if (x-d< mouseX && mouseX<x+d && y-d< mouseY && mouseY<y+d) {
        selec=!selec;
        mousePressed=false;
      } else {
      }
    }
  }
}
