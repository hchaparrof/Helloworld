class Movil extends Boton {
  Movil(float tempX, float tempY, float tempD, color tempC1, color tempC2,  boolean tempSelec, PImage tempIcono){
    super(tempX, tempY, tempD, tempC1, tempC2, tempSelec, tempIcono);
  }
  @Override void escogerc(){}
  @Override void coloc(int a){}
  @Override void dibujarbarra() {}
  @Override void icono() {}
  @Override void dibujarboton(){
    float x1 = -d;
    float y1 = -d;
    float x2 = 2*d;
    float y2 = 2*d;
    rect(x1, y1, x2, y2, 7);
  }
  @Override void desplazar(){
   if (selec) {
     float guardy=y;
      y=mouseY;
      if (y<=displayHeight*0.1) {
        y=displayHeight*0.1;
      } else if (y>=displayHeight*0.4) {
        y=displayHeight*0.4;
      }
      if(guardy!=y){
        sabe=true;
      }else{
        sabe=false;
      }
    }
  }

  @Override void rango (color a,color gf) {
    float porc;
    float deltadist;
    float distlocal;
    deltadist=displayHeight*0.3;
    distlocal=y-displayHeight*0.1;
    porc=distlocal/deltadist;
    float b=0;
    b=255*porc;
    loadPixels();
    float redx=red(a);
    float greenx=green(a);
    float bluex=blue(a);
    for (int i=0; i<height*width; i++) {
      if ((red(pixels[i])>redx-b && red(pixels[i])<redx+b) && (green(pixels[i])>greenx-b && green(pixels[i])<greenx+b) && (blue(pixels[i])>bluex-b && blue(pixels[i])<bluex+b)) {
        pixels[i]=gf;
      } else {
      }
    }
    updatePixels();
  }
}
