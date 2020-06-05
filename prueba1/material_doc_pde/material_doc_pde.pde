PImage nibel;
PImage nibel2;
boolean sabe=false;
int rango=40;
void setup() {
  nibel=loadImage ("8.jpg");
  nibel2=nibel;
  System.out.println(nibel.width);
  System.out.println(nibel.height);
  size(800, 600);
  //background(0, 255, 162);
  background(255, 255, 255);
}
void draw() {
  if (!sabe) {
    pushMatrix();
    scale(0.1);
    image(nibel, 800, 600);
    popMatrix();
  }
  encont(color(43, 146, 34), rango);
  //pruebamouse();
  updatePixels();
}
void pruebamouse() {
  loadPixels();
  int a=mouseX;
  int b=mouseY;
  int c=mouseY*width;
  //for (int i=0; i<height; i++) {
    pixels[a+b*height]=color(0, 0, 0);
  //}
}
void encont(color a, int b) {
  loadPixels();
  float redx=red(a);
  float greenx=red(a);
  float bluex=red(a);
  for (int i=0; i<height*width; i++) {
    if ((red(pixels[i])>redx-b && red(pixels[i])<redx+b) && (green(pixels[i])>greenx-b && green(pixels[i])<greenx+b) && (blue(pixels[i])>bluex-b && blue(pixels[i])<bluex+b)) {
      pixels[i]=color(0, 0, 0);
    } else {
    }
  }
  updatePixels();
  sabe=true;
}
void mouseWheel(MouseEvent event) {
  int g=rango;
  rango += -5*(event.getCount());
  if (rango<0) {
    rango=g;
  }
  sabe=false;
}
