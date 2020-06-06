class Nivel {
  Nivel() {
  }
  float escala;
  PImage nibel;
  void verificaresc(int contador3, int delta1) {
    int delta=0;
    color w;
    int contador2=0;
    background(0, 255, 162);
    display();
    for (int i=0; i<width; i++) {
      for (int j=0; j<height; j++) {
        w=get(i, j);
        if ((red(w)==0 && green(w)==255 && blue(w)==162)) {
          contador2++;
        }
      }
    }
    delta=contador3-contador2;
    escala=(float)Math.sqrt(((float)delta1)/((float)delta));
  }
  void display() {
    imageMode(CENTER);
    pushMatrix();
    scale(escala);
    image(nibel, (width/2), height/2);
    popMatrix();
  }
}
