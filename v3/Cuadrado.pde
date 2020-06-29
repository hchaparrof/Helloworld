class Cuadrado extends Boton {
  Cuadrado(float tempX, float tempY, float tempD, color tempC1, color tempC2, boolean tempSelec) {
    super(tempX, tempY, tempD, tempC1, tempC2, tempSelec);
  }
  @Override void dibujarboton() {
    float x1 = -d;
    float y1 = -d;
    float x2 = 2*d;
    float y2 = 2*d;
    rect(x1, y1, x2, y2, 7);
  }
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
  @Override void coloc(boolean a){
    if(a){
      choja=provic;
    }else{
      cref=provic;
    }
  }
  @Override void rango (color a,color gf) {
  }
  @Override void desplazar() {
  }
  /*void camco() {
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
  }*/
}
