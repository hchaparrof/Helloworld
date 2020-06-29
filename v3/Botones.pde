abstract class Boton {
  float x, y, d;
  color c1, c2;
  boolean selec;
  Boton(float tempX, float tempY, float tempD, color tempC1, color tempC2, boolean tempSelec) {
    x = tempX;
    y = tempY;
    d = tempD;
    c1 = tempC1;
    c2 = tempC2;
    selec = tempSelec;
  }
  /*void camco() {
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
  }*/
  void display() {
    pushMatrix();
    translate(x, y);
    stroke(c2);
    fill(c1);
    dibujarboton();
    popMatrix();
  }
  abstract void dibujarboton();
  abstract void rango (color a,color gf);
  abstract void desplazar();
  abstract void escogerc();
  abstract void coloc(int a);
  void seleccion() {
    if (selec) {
      //stroke(106,114,128);
      c2=color(50,50,50);
    } else {
      //stroke(c1);
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
