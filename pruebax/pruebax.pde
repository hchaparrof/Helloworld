Boton [] boton;
boolean Isover=false;
Imagen myImage;
boolean derecha=false;
int guardarboton;
int mouser []=new int[4];
float cmcuadrado;
BotonCuadrado movil;

void setup() {
  fullScreen();
  background(255);
  boton = new Boton[3];
  myImage= new Imagen (loadImage ("hoja.jpg"));
  boton[0] = new BotonCuadrado (80, displayHeight-80, 40, color(255, 128, 0), false );
  boton[1] = new BotonCuadrado (80, 168, 40, color(255, 128, 0), false );
  boton[2] = new BotonCuadrado (80, displayHeight-160-10, 40, color(255, 128, 0), false );
  movil = new BotonCuadrado (displayWidth-80, displayHeight*0.1, 20, color(255, 128, 0), false );
}
void draw() {
  background(255);
  myImage.displai();
  for (Boton bot : boton) {
    bot.display();
    bot.seleccion();
  }
  /*if(boton[1].selec){
   myImage.distancia();
   }*/

  for (int i=0; i<3; i++) {
    if (boton[i].selec) {
      guardarboton= i;
      switch(guardarboton) {
      case 0:
        for (Boton bot : boton) {
          bot.selec=false;
        }
        break;
      case 1:
        if (mousePressed) {
          System.out.println(boton[1].selec);
          myImage.distancia();
        }
        break;
      case 2:
        movil.display();
        movil.seleccion();
        movil.rango2(color(255, 255, 255));
        if (movil.selec) {
          movil.y=mouseY;
          if (movil.y<=displayHeight*0.1) {
            movil.y=displayHeight*0.1;
          } else if (movil.y>=displayHeight*0.4) {
            movil.y=displayHeight*0.4;
          }
        }
      }
    }
  }
}/*
void touchStarted() {
 println("touch started");
 }
 
 void touchMoved() {
 println("touch moved"); 
 }
 */
void mouseReleased() {
  movil.selec=false;
}
void touchEnded() {
  //println("touch ended");
  movil.selec=false;
}
//}*/
