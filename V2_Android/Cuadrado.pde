class Cuadrado extends Boton {
  Cuadrado(float tempX, float tempY, float tempD, color tempC1, boolean tempSelec) {
    super(tempX, tempY, tempD, tempC1, tempSelec);
  }
  @Override void dibujarboton() {
    float x1 = -d;
    float y1 = -d;
    float x2 = 2*d;
    float y2 = 2*d;
    rect(x1, y1, x2, y2, 7);
  }
  @Override void rango (color a) {
  }
  @Override void desplazar() {
  }
  void camco() {
    float x1=x+height*0.1;
    float x2=x1+255;
    float y1= y;
    float y2=y1+255;
    pushMatrix();
    stroke(255,255,255);
    fill(255,255,255);
    dibujarboton();
    popMatrix();
    for (int i=0;i<255;i++){
      for(int j=0;j<255;j++){
        set(i+255,j+255,color(i,j,p));
      }
    }
  }
}
