ArrayList<float[][]> cortes = new ArrayList<float[][]>();
ArrayList<ArrayList<Boton>> botones = new ArrayList<ArrayList<Boton>>();
Imagen myImage;
float z=0;
int menor=0;
int corte=0;
int guardarboton;
int mouser []=new int[4];
int mouse []=new int[6];
int first=0;
color recorte=color(255, 65, 238);
boolean sabe=true;
boolean derecha=false;
boolean provec1=false, provec2=false;
boolean hdist=false;
float cmcuadrado;
color provic;
color choja=color(138, 143, 59);
color cref=color(255, 0, 0);
int botonum=5;
void setup() {
  fullScreen();
  background(255);
  myImage= new Imagen (loadImage ("hoja1.jpeg"));
  if (displayWidth>displayHeight) {
    menor=displayHeight;
  } else {
    menor=displayWidth;
  }
  System.out.println(displayWidth + " h " + displayHeight + " f ");
  for (int i=0; i<botonum; i++) {
    botones.add(new ArrayList<Boton>());
  }
  for (int i=0; i<botonum; i++) {
    System.out.println(((100.0f/((4.0f*botonum)+2.0f))*4f*((i*1.0f)+1.0f))-(100.0f/((4.0f*botonum)+2.0f)));
    botones.get(i).add(new Cuadrado (displayHeight*0.1f, displayHeight*(((100/((4*botonum)+2))*4*(i+1))-(100/((4*botonum)+2)))/100f, displayHeight*((100/((4*botonum)+2)))/100, color(255, 128, 0), color(255, 128, 0), false ));//cambio pixel    // (2,0)
  }
  ///
  //botones.get(4).add(new Cuadrado (displayHeight*0.1f, displayHeight*0.885f, displayHeight*0.04f, color(255, 128, 0), color(255, 128, 0), false ));//bloquear        // (0,0)
  ///
  ////
  //botones.get(0).add(new Cuadrado (displayHeight*0.1f, displayHeight*0.115f, displayHeight*0.04f, color(255, 128, 0), color(255, 128, 0), false ));//distancia       // (1,0)
  /**/  botones.get(0).add(new Cuadrado (displayHeight*0.1f + 2*(displayHeight*0.05f), displayHeight*0.115f+(menor*0.025+menor*0.015), menor*0.025, color(255, 0, 0), color(255, 0, 0), false ));  // (2,3)
  /**/  botones.get(0).add(new Cuadrado (displayHeight*0.1f + 2*(displayHeight*0.05f), displayHeight*0.115f-(menor*0.025+menor*0.015), menor*0.025, color(255, 0, 0), color(255, 0, 0), false ));  // (2,3)
  /**/  botones.get(0).add(new Cuadrado (displayHeight*0.1f + 3*(displayHeight*0.05f), displayHeight*0.115f, menor*0.025, color(255, 0, 0), color(255, 0, 0), false ));  // (2,3)
  //botones area
  //botones.get(1).add(new Cuadrado (displayHeight*0.1f, displayHeight*0.269f, displayHeight*0.04f, color(255, 128, 0), color(255, 128, 0), false ));//cambio pixel    // (2,0)
  /**/  botones.get(1).add(new Movil (displayWidth*0.9f, displayHeight*0.1, menor*0.025, color(228, 235, 246), color(228, 235, 246), false ));//rango blanco            // (2,1)
  /**/  botones.get(1).add(new Movil (displayWidth*0.85f, displayHeight*0.1, menor*0.025, color(17, 112, 185), color(17, 112, 185), false ));//rango rojo               // (2,2)   
  /**/  botones.get(1).add(new Cuadrado (displayHeight*0.1f + 2*(displayHeight*0.05f), displayHeight*0.269f, menor*0.025, color(255, 0, 0), color(255, 0, 0), false ));  // (2,3)
  //////
  //eliminar regla
  //botones.get(2).add(new Cuadrado (displayHeight*0.1f, displayHeight*0.423f, displayHeight*0.04f, color(255, 128, 0), color(255, 128, 0), false ));                  // (3,0)
  //botones.get(3).add(new Cuadrado (displayHeight*0.1f, displayHeight*0.577f, displayHeight*0.04f, color(255, 128, 0), color(255, 128, 0), false ));                  // (3,0)
  /**/  botones.get(3).add(new Cuadrado (displayHeight*0.1f + 2*(displayHeight*0.05f), displayHeight*0.577f+2*(menor*0.025+menor*0.01), menor*0.025, color(255, 0, 0), color(255, 0, 0), false ));  // (2,3)
  /**/  botones.get(3).add(new Cuadrado (displayHeight*0.1f + 2*(displayHeight*0.05f), displayHeight*0.577f, menor*0.025, color(255, 0, 0), color(255, 0, 0), false ));  // (2,3)
  /**/  botones.get(3).add(new Cuadrado (displayHeight*0.1f + 2*(displayHeight*0.05f), displayHeight*0.577f-2*(menor*0.025+menor*0.01), menor*0.025, color(255, 0, 0), color(255, 0, 0), false ));  // (2,3)


  ////////////
}
Boton encont(int x, int y) {
  return botones.get(x).get(y);
}  
void cuadraera(float areah) {
  pushMatrix();
  stroke(provic);
  fill(0, 0, 0);
  if (areah!=0) {
    textSize(menor*0.02);  
    text("área: "+areah, displayWidth-(menor*0.2), displayHeight-(menor*0.1));
  } else {
    textSize(menor*0.04);
    text("-----", displayWidth-(menor*0.2), displayHeight-(menor*0.1));
  }
  popMatrix();
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
  for (int i=0; i<botonum; i++) {
    encont(i, 0).display();
    encont(i, 0).seleccion();
  }
  for (int i=0; i<botonum; i++) {
    if (encont(i, 0).selec ) {
      guardarboton= i;
      switch(guardarboton) {
      case 4:
        choja=color(138, 143, 59);
        cref=color(255, 0, 0);
        background(255, 255, 255);
        for (int j=0; j<botonum; j++) {
          encont(j, 0).selec=false;
        }
        encont(1, 1).selec=false;
        encont(1, 2).selec=false;
        //encont(3, 1).selec=false;
        cortes.clear();
        first=0;
        sabe=true;
        hdist=false;
        break;
      case 0:
        {
          boolean a, b;
          a=encont(0, 1).selec;
          b=encont(0, 2).selec;
          encont(0, 1).display();
          encont(0, 1).seleccion();
          encont(0, 2).display();
          encont(0, 2).seleccion();
          encont(0, 3).display();
          encont(0, 3).seleccion();
          cuadraera(z);
          if (!a && encont(0, 1).selec) {
            encont(0, 2).selec=false;
          }
          if (!b && encont(0, 2).selec) {
            encont(0, 1).selec=false;
          }
          if (encont(0, 1).selec) {
            if (mousePressed) {
              myImage.distancia();
              hdist=true;
              mousePressed=false;
            }
          }        
          if (encont(0, 2).selec) {
            encont(1, 1).display();
            encont(1, 1).seleccion();
            encont(1, 1).rango(choja, color(0, 0, 0));
            encont(1, 1).desplazar();
          }
          if (encont(0, 3).selec) {
            if (hdist==true) {
              z=myImage.area(myImage.totaln(), cmcuadrado);
              System.out.println("area "+ z);
            } else {
              System.out.println("marque distancia primero");
            }
            encont(0, 3).selec=false;
          }
          break;
        }
      case 1:
        encont(1, 1).display();
        encont(1, 1).seleccion();
        encont(1, 1).rango(choja, color(0, 0, 0));
        encont(1, 1).desplazar();


        encont(1, 2).display();
        encont(1, 2).seleccion();        
        encont(1, 2).rango(cref, color(0, 0, 1));
        encont(1, 2).desplazar();
        encont(1, 3).display();
        encont(1, 3).seleccion();
        cuadraera(z);
        if (encont(1, 3).selec) {
          z=myImage.aret();
          System.out.println("area "+z);
          encont(1,3).selec=false;
        }
        break;
      case 2:
        /*encont(3, 1).display();
         encont(3, 1).seleccion();
         if (encont(3, 1).selec) {
         encont(3, 1).camco();
         }*/
        myImage.eliminar();
        break;
      case 3:
        encont(3, 0).escogerc();
        encont(3, 1).display();
        encont(3, 1).seleccion();
        encont(3, 2).display();
        encont(3, 2).seleccion();
        /*encont(3, 3).display();
         encont(3, 3).seleccion();*/
        if (mousePressed) {
          provec2=!provec2;
          mousePressed=false;
        }
        if (encont(3, 1).selec || encont(3, 2).selec ) {
          if (encont(3, 1).selec || encont(3, 2).selec) {
            if (encont(3, 1).selec) {
              encont(3, 1).coloc(1);
              encont(3, 1).selec=false;
            } else {
              encont(3, 2).coloc(0);
              encont(3, 2).selec=false;
            }
          } else {
          }
        }

        break;
      }
    }
  }
}
void mouseReleased() {
  encont(1, 1).selec=false;
  encont(1, 2).selec=false;
}
void touchEnded() {
  if (encont(3, 0).selec) {
    provec2=true;
  }
}
