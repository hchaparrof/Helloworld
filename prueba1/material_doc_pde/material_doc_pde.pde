PImage nibel;
int mouser[]=new int[4];
boolean derecha=false;
PImage nibel2;
boolean sabe=false;
int rango=40;
int mouse []=new int[6];
int first=0;
void setup() {
  for (int i=0; i<4; i++) {
    mouse[i]=0;
  }
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
  if (mousePressed && mouseButton==RIGHT) {
    if (!derecha) {
      mouser[0]=mouseX;
      mouser[1]=mouseY;
      derecha=true;
      mousePressed=false;
    } else {
      mouser[2]=mouseX;
      mouser[3]=mouseY;
      mousePressed=false;
      float dist2=0;
      float dx=1.0;
      float dy=1.0;
      dx=mouser[2]-mouser[0];
      dy=mouser[3]-mouser[1];
      dist2=(float)(Math.sqrt(((dx*dx)+(dy*dy))));
      System.out.println(dist2);
      derecha=false;
    }
  }
  if (mousePressed && mouseButton==LEFT) {
    switch(first) {
      case(0):
      {
        mouse[0]=mouseX;
        mouse[1]=mouseY;
        first++;
        mousePressed=false;
        break;
      }
      case(1):
      {
        mouse[2]=mouseX;
        mouse[3]=mouseY;
        first++;
        mousePressed=false;
        break;
      }
      case(2):
      {
        mouse[4]=mouseX;
        mouse[5]=mouseY;
        first=0;
        linea();
        mousePressed=false;
        break;
      }
    }
  }
  encont(color(43, 146, 34), rango);
  //pruebamouse();
  updatePixels();
}
void linea() {
  float m=1;
  float dx=1;
  float dy=1;
  float b=1;
  dx=mouse[2]-mouse[0];
  if (dx==0) {
    mouse[2]++;
    dx=mouse[2]-mouse[0];
  }
  boolean mayor=false;
  dy=mouse[3]-mouse[1];
  m=dy/dx;
  b=mouse[1]-(mouse[0]*m);
  if (mouse[4]*m+b<mouse[5]) {
    mayor=true;
  }
  for (int i=0; i<width; i++) {
    for (int j=0; j<width; j++) {
      if (mayor) {
        if (i*m+b<j) {
          set(i, j, color(0, 0, 0));
        }
      } else {
        if (i*m+b>j) {
          set(i, j, color(0, 0, 0));
        }
      }
    }
  }
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
