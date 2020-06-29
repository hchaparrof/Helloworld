ArrayList<float[][]> cortes = new ArrayList<float[][]>();
ArrayList<ArrayList<Boton>> botones = new ArrayList<ArrayList<Boton>>();
Imagen myImage;
int menor=0;
int corte=0;
int guardarboton;
int mouser []=new int[4];
int mouse []=new int[6];
int first=0;
color recorte=color(255, 65, 238);
boolean sabe=true;
boolean derecha=false;
float cmcuadrado;
//int p;

void setup() {
  int botonnum=6;
  fullScreen();
  background(255);
  myImage= new Imagen (loadImage ("hoja1.jpeg"));
  if (displayWidth>displayHeight) {
    menor=displayHeight;
  } else {
    menor=displayWidth;
  }
  System.out.println(displayWidth + " h " + displayHeight + " f ");
  for (int i=0; i<6; i++) {
    botones.add(new ArrayList<Boton>());
  }
  ///
  botones.get(0).add(new Cuadrado (displayHeight*0.1f, displayHeight*0.885f, displayHeight*0.04f, color(255, 128, 0), color(255, 128, 0), false ));//bloquear        // (0,0)
  ///
  ////
  botones.get(1).add(new Cuadrado (displayHeight*0.1f, displayHeight*0.115f, displayHeight*0.04f, color(255, 128, 0), color(255, 128, 0), false ));//distancia       // (1,0)
  ////
  //botones area
  botones.get(2).add(new Cuadrado (displayHeight*0.1f, displayHeight*0.269f, displayHeight*0.04f, color(255, 128, 0), color(255, 128, 0), false ));//cambio pixel    // (2,0)
  /**/botones.get(2).add(new Movil (displayWidth*0.9f, displayHeight*0.1, menor*0.025, color(228, 235, 246), color(228, 235, 246), false ));//rango blanco            // (2,1)
  /**/botones.get(2).add(new Movil (displayWidth*0.85f, displayHeight*0.1, menor*0.025, color(17, 112, 185), color(17, 112, 185), false ));//rango rojo               // (2,2)   
  /**/botones.get(2).add(new Cuadrado (displayHeight*0.1f + 2*(displayHeight*0.05f), displayHeight*0.57f, menor*0.025, color(255, 0, 0), color(255, 0, 0), false ));  // (2,3)
  //////
  //eliminar regla
  botones.get(3).add(new Cuadrado (displayHeight*0.1f, displayHeight*0.423f, displayHeight*0.04f, color(255, 128, 0), color(255, 128, 0), false ));                  // (3,0)


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
      myImage.recortar(cortes.get(i));
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
        for (int j=0; j<5; j++) {
          encont(j, 0).selec=false;
        }
        encont(2, 1).selec=false;
        encont(2, 2).selec=false;
        //encont(3, 1).selec=false;
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
        encont(2, 1).rango(color(138, 143, 59), color(0, 0, 0));
        encont(2, 1).desplazar();


        encont(2, 2).display();
        encont(2, 2).seleccion();        
        encont(2, 2).rango(color(255, 0, 0), color(0, 0, 1));
        encont(2, 2).desplazar();
        encont(2, 3).display();
        encont(2, 3).seleccion();            
        if (encont(2, 3).selec) {
          myImage.aret();
        }
        break;
      case 3:
        /*encont(3, 1).display();
         encont(3, 1).seleccion();
         if (encont(3, 1).selec) {
         encont(3, 1).camco();
         }*/
        myImage.eliminar();
        break;
      }
    }
  }
}
void mouseClicked() {
  encont(2, 3).selec=false;
}
void mouseReleased() {
  encont(2, 1).selec=false;
  encont(2, 2).selec=false;
}
