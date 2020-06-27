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
  void camco() {
    float x1=x+width*0.1;
    float x2=x1+255;
    float y1= y;
    float y2=y1+255;
    System.out.println(x1 + " " + x2);
    for (int i=(int)x1;i<x1+255;i++){
      for(int j=(int)y1;j<y1-255;j--){
        set(i,j,color(i-255,j-255,p));
      }
      System.out.println(i);
    }
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
        selec=!selec;
        mousePressed=false;
      } else {
      }
    }
  }
}
