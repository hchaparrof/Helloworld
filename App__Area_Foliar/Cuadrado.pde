class Cuadrado extends Boton {
  Cuadrado(float tempX, float tempY, float tempD, color tempC1, color tempC2, boolean tempSelec,PImage tempIcono) {
    super(tempX, tempY, tempD, tempC1, tempC2, tempSelec, tempIcono);
  }
    float x1 = -d;
    float y1 = -d;
    float x2 = 2*d;
    float y2 = 2*d;
  @Override void dibujarboton() {
    imageMode(CORNER);
    image(icono, x1, y1, x2, y2);
    //rect(x1, y1, x2, y2, 7);
  }
  @Override void dibujarbarra() {

    pushMatrix();
    translate(x,y);
    fill(149,164,164);
    rect(x1, y1, x2, 5*y2, 7);
    popMatrix();
  }
  /*@Override void icono() {
    pushMatrix();
    translate(x,y);
    imageMode(CORNER);
    image(icono, x1, y1, x2, y2);
    popMatrix();
  }*/
  @Override void escogerc(){
    if(!provec2){
      provic=(get(mouseX,mouseY));
    }
    pushMatrix();
    stroke(provic);
    fill(provic);
    rect(displayWidth-(menor*0.1),displayHeight-(menor*0.1),displayWidth-(menor*0.1)+displayWidth+(menor*0.05),displayHeight-(menor*0.1)+(menor*0.05));
    popMatrix();
  }
  @Override void coloc(int a){
    switch(a) {
      case 0:
      cref=provic;
      break;
      case 1:
      choja=provic;
      break;
      case 2:
      choja=provic;
      break;
    }
  }
  @Override void rango (color a,color gf) {
  }
  @Override void desplazar() {}
  @Override void icono() {}
}
