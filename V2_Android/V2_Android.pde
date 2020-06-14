Boton [] boton;
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
  System.out.println(displayWidth + " h " + displayHeight + " f ");
  background(255);
  boton = new Boton[5];
  myImage= new Imagen (loadImage ("hoja.jpg"));
  /*boton[0] = new Cuadrado (30*displayDensity, displayHeight-40*displayDensity, 20*displayDensity, color(255, 128, 0), false );//bloquear
   boton[1] = new Cuadrado (30*displayDensity, 80*displayDensity, 20*displayDensity, color(255, 128, 0), false );//distancia
   boton[2] = new Cuadrado (30*displayDensity, displayHeight-500*displayDensity, 20*displayDensity, color(255, 128, 0), false );//cambio pixel
   boton[3] = new Cuadrado (30*displayDensity, displayHeight-440*displayDensity, 20*displayDensity, color(255, 128, 0), false );//eliminar regla
   boton[4] = new Movil (displayWidth-40*displayDensity, displayHeight*0.1, 10*displayDensity, color(255, 128, 0), false );//rango
   */
  for (int i=0; i<4; i++) {
    botones.add(new ArrayList<Boton>());
  }
  botones.get(0).add(new Cuadrado (displayHeight*0.1f, displayHeight*0.78f, displayHeight*0.05f, color(255, 128, 0), false ));//bloquear
  botones.get(1).add(new Cuadrado (displayHeight*0.1f, displayHeight*0.12f, displayHeight*0.05f, color(255, 128, 0), false ));//distancia
  botones.get(2).add(new Cuadrado (displayHeight*0.1f, displayHeight*0.34f, displayHeight*0.05f, color(255, 128, 0), false ));//cambio pixel
  botones.get(3).add(new Cuadrado (displayHeight*0.1f, displayHeight*0.56f, displayHeight*0.05f, color(255, 128, 0), false ));//eliminar regla
  botones.get(2).add(new Movil (displayWidth*0.9f, displayHeight*0.1, 10*displayDensity, color(255, 128, 0), false ));//rango
  botones.get(3).add(new Cuadrado (displayHeight*0.1f + 2*(displayHeight*0.05f), displayHeight*0.56f, 10*displayDensity, color(255, 128, 0), false ));//rango
  ////////////
  /*
  boton[0] = new Cuadrado (displayHeight*0.1f, displayHeight*0.78f, displayHeight*0.05f, color(255, 128, 0), false );//bloquear
   boton[1] = new Cuadrado (displayHeight*0.1f, displayHeight*0.12f, displayHeight*0.05f, color(255, 128, 0), false );//distancia
   boton[2] = new Cuadrado (displayHeight*0.1f, displayHeight*0.34f, displayHeight*0.05f, color(255, 128, 0), false );//cambio pixel
   boton[3] = new Cuadrado (displayHeight*0.1f, displayHeight*0.56f, displayHeight*0.05f, color(255, 128, 0), false );//eliminar regla
   boton[4] = new Movil (displayWidth*0.9f, displayHeight*0.1, 10*displayDensity, color(255, 128, 0), false );//rango*/
}
Boton encont(int x, int y) {
  return botones.get(x).get(y);
}
void draw() {
  if (sabe) {
    myImage.displai();
    sabe=false;
  }
  for (int i=0; i<4; i++) {
    encont(i, 0).display();
    encont(i, 0).seleccion();
    /*boton[i].display();
     boton[i].seleccion();*/
  }

  for (int i=0; i<4; i++) {
    if (encont(i, 0).selec ) {//boton[i].selec) {
      guardarboton= i;
      switch(guardarboton) {
      case 0:
        background(255, 255, 255);
        for (int j=0; j<4; j++) {
          encont(j, 0).selec=false;
        }
        encont(2, 1).selec=false;
        encont(3, 1).selec=false;
        /*for (Boton bot : boton) {
         bot.selec=false;
         background(255,255,255);
         }*/
        sabe=true;
        break;
      case 1:
        if (mousePressed) {
          //System.out.println();//boton[1].selec);
          myImage.distancia();
        }
        break;
      case 2:
        encont(2, 1).display();
        encont(2, 1).seleccion();
        encont(2, 1).rango(color(255, 255, 255));
        encont(2, 1).desplazar();
        /*
        boton[4].display();
         boton[4].seleccion();
         boton[4].rango(color(255, 255, 255));
         boton[4].desplazar();*/
        break;
      case 3:
        //if (mousePressed) {
        encont(3, 1).display();
        encont(3, 1).seleccion();
        myImage.eliminar();
        //}
        break;
      }
    }
  }
}
void mouseReleased() {
  encont(2, 1).selec=false;
}
