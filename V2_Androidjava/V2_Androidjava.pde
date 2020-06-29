Boton [] boton;
int menor=0;
int corte=0;
ArrayList<float[][]> cortes = new ArrayList<float[][]>();
int p;
color fuksia=color(255, 65, 238);
boolean sabe=true;
Imagen myImage;
boolean derecha=false;
int guardarboton;
int mouser []=new int[4];
ArrayList<ArrayList<Boton>> botones = new ArrayList<ArrayList<Boton>>();
int mouse []=new int[6];
int first=0;
float cmcuadrado;

void setup() {
  fullScreen();
  if(displayWidth>displayHeight){
    menor=displayHeight;
  }else{
    menor=displayWidth;
  }
  System.out.println(displayWidth + " h " + displayHeight + " f ");
  background(255);
  boton = new Boton[5];
  myImage= new Imagen (loadImage ("hoja.jpg"));
  for (int i=0; i<4; i++) {
    botones.add(new ArrayList<Boton>());
  }
  botones.get(0).add(new Cuadrado (displayHeight*0.1f, displayHeight*0.78f, displayHeight*0.05f, color(255, 128, 0), false ));//bloquear                             // (0,0)
  botones.get(1).add(new Cuadrado (displayHeight*0.1f, displayHeight*0.12f, displayHeight*0.05f, color(255, 128, 0), false ));//distancia                            // (1,0)
  botones.get(2).add(new Cuadrado (displayHeight*0.1f, displayHeight*0.34f, displayHeight*0.05f, color(255, 128, 0), false ));//cambio pixel                         // (2,0)
  botones.get(3).add(new Cuadrado (displayHeight*0.1f, displayHeight*0.56f, displayHeight*0.05f, color(255, 128, 0), false ));//eliminar regla                       // (3,0)
  botones.get(2).add(new Movil (displayWidth*0.9f, displayHeight*0.1, menor*0.025, color(255, 128, 0), false ));//rango                                        // (2,1)
  botones.get(3).add(new Cuadrado (displayHeight*0.1f + 2*(displayHeight*0.05f), displayHeight*0.56f, menor*0.025, color(255, 128, 0), false ));//cuadro color // (3,1)
  ////////////
}
Boton encont(int x, int y) {
  return botones.get(x).get(y);
}
void draw() { 
  background(255);
  myImage.displai();
  for (int i=0; true; i++) {
    try {
      recortes(cortes.get(i));
    }
    catch(IndexOutOfBoundsException e) {
      break;
    }
  }  
  for (int i=0; i<4; i++) {
    encont(i, 0).display();
    encont(i, 0).seleccion();
  }

  for (int i=0; i<4; i++) {
    if (encont(i, 0).selec ) {
      guardarboton= i;
      switch(guardarboton) {
      case 0:
        background(255, 255, 255);
        for (int j=0; j<4; j++) {
          encont(j, 0).selec=false;
        }
        encont(2, 1).selec=false;
        encont(3, 1).selec=false;
        cortes.clear();
        first=0;
        sabe=true;
        break;
      case 1:
        if (mousePressed) {
          myImage.distancia();
        }
        break;
      case 2:
        encont(2, 1).display();
        encont(2, 1).seleccion();
        encont(2, 1).rango(color(15, 145, 41));
        encont(2, 1).desplazar();
        break;
      case 3:
        encont(3, 1).display();
        encont(3, 1).seleccion();
        if (encont(3, 1).selec) {
          encont(3, 1).camco();
        }
        myImage.eliminar();
        break;
      }
    }
  }
}
void recortes(float[][] f) {
  loadPixels();
  float m;
  float dx;
  float dy;
  float b;
  dx=f[1][0]-f[0][0];
  if (dx==0) {
    f[1][0]+=1;
    dx=f[1][0]-f[0][0];
  }
  boolean mayor=false;
  dy=f[1][1]-f[0][1];
  m=dy/dx;
  b=f[0][1]-(f[0][0]*m);
  if (f[2][0]*m+b<f[2][1]) {
    mayor=true;
  }
  for (int i=0; i<displayWidth; i++) {
    for (int j=0; j<displayHeight; j++) {
      if (mayor) {
        if (i*m+b<j) {
          pixels[j*width+i] = fuksia;
        }
      } else {
        if (i*m+b>j) {
          pixels[j*width+i] =fuksia;
        }
      }
    }
  }
  updatePixels();
}
void mouseReleased() {
  encont(2, 1).selec=false;
}
