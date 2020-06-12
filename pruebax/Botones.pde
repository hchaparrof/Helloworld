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
        //c1=color(255, 128, 0);

        //selec= false;
      }
      //mousePressed=false;
    }
  }
  void rango2(color a) {
    float porc=0.07f;
    float deltadist=20;
    float distlocal=7;
    deltadist=displayHeight*0.5;
    distlocal=y-displayHeight*0.1;
    porc=distlocal*1.0f/deltadist*1.0f;
    float b=0;
    b=255*porc;
    loadPixels();
    float redx=red(a);
    float greenx=red(a);
    float bluex=red(a);
    for (int i=0; i<height*width; i++) {
      if ((red(pixels[i])>redx-b && red(pixels[i])<redx+b) && (green(pixels[i])>greenx-b && green(pixels[i])<greenx+b) && (blue(pixels[i])>bluex-b && blue(pixels[i])<bluex+b)) {
        pixels[i]=color(0,0,0);
      } else {
      }
    }
    updatePixels();
  }
}
