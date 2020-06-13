class Cuadrado extends Boton {
  Cuadrado(float tempX, float tempY, float tempD, color tempC1,  boolean tempSelec){
    super(tempX, tempY, tempD, tempC1, tempSelec);
  }
  @Override void dibujarboton(){
    float x1 = -d;
    float y1 = -d;
    float x2 = 2*d;
    float y2 = 2*d;
    rect(x1, y1, x2, y2,7);
  }
  @Override void rango (color a) {
  }
  @Override void desplazar() {
  }
}
