FigureSquare square;
FigureParall parall;
FigureTriangle triangle1;
FigureTriangle triangle2;
FigureTriangle triangle3;
FigureTriangle triangle4;
FigureTriangle triangle5;
Nivel nivel1;
Nivel nivel2;
int rotparall=1;
boolean overfigure2 = false;
int contador=0;
int contador3;
int delta1=0;
void setup() {
  int contador3=0;
  int delta1=0;
  size(800, 600);
  background(0, 255, 162);
  square = new FigureSquare (615, 123, PI/4, 35, 1, color(255, 51, 153), color(255, 51, 153), false);
  parall = new FigureParall (405, 347, 0, 25, 1, color(255, 128, 0), color(255, 128, 0), false);
  triangle1 = new FigureTriangle(256, 238, PI, 50, 1, color(51, 255, 0), color(51, 255, 0), false);
  triangle2 = new FigureTriangle(445, 116, PI/2, 50, 1, color(255, 0, 17), color(255, 0, 17), false);
  triangle3 = new FigureTriangle(685, 218, -PI/4, 70, 1, color(0, 128, 255), color(0, 128, 255), false);
  triangle4 = new FigureTriangle(166, 395, -PI/2, 100, 1, color(255, 255, 0), color(255, 255, 0), false);
  triangle5 = new FigureTriangle(135, 69, 0, 100, 1, color(191, 63, 192), color(191, 63, 192), false);
  nivel1 = new Nivel ();
  nivel2 = new Nivel ();
  nivel1.escala=1;
  nivel2.escala=1;
  nivel1.nibel=loadImage ("gato recostado.png");
  nivel2.nibel=loadImage("condor.PNG");
  square.display();
  parall.display();
  triangle1.display();
  triangle2.display();
  triangle3.display();
  triangle4.display();
  triangle5.display();
  color w;
  for (int i=0; i<width; i++) {
    for (int j=0; j<height; j++) {
      contador3++;
    }
  }
  System.out.println(contador3);
  //b
  for (int i=0; i<width; i++) {
    for (int j=0; j<height; j++) {
      w=get(i, j);
      if ((red(w)==0 && green(w)==255 && blue(w)==162)) {
        contador++;
      }
    }
  }
  System.out.println(contador + " contador ");
  delta1=contador3-contador;
  nivel1.verificaresc(contador3, delta1);
  nivel2.verificaresc(contador3, delta1);
  square.x=185;
  square.y=135;
  parall.x=110;
  parall.y=210;
  triangle1.x=135;
  triangle1.y=170;
  triangle2.x=218;
  triangle2.y=85;
  triangle3.x=202;
  triangle3.y=203;
  triangle4.x=68;
  triangle4.y=135;
  triangle5.x=135;
  triangle5.y=69;
}
void draw() {
  background(0, 255, 162);
  char guardarkey='a';
  ///////////seleccion niveles
  if ((key == '1' || key=='2' || key=='4' || key=='3' || key == '5')) {
    guardarkey=key;
  } else {
  }
  switch (guardarkey) { 
  case '1':
    background(0, 255, 162);
    break;
  case '2':
    background(0, 255, 162);
    nivel1.display();
    break;
  case '3':
    background(0, 255, 162);
    nivel2.display();
    break;
  /*case '4':
    guardarkey='4';
    cs4=(255);
    cs2=color(0, 255, 162);
    shape(s4, 0, 0);
    tint(255, 0);
    image(niveles, width/2, height/2);
    break;
  case '5':
    guardarkey='5';
    cs4=color(0, 255, 162);
    cs2=color(0, 255, 162);
    tint(255, 255);
    scale((float)(Math.sqrt((39287.0/26688.0))));
    image(condor, (width/2)+50, height/2);
    tint(255, 0);
    scale(1/(float)(Math.sqrt((39287.0/26688.0))));
    break;*/
  default:
    break;
  }
  ///////////////////////////seleccion niveles
  square.display();
  parall.display();
  triangle1.display();
  triangle2.display();
  triangle3.display();
  triangle4.display();
  triangle5.display();
  square.select_move();
  parall.select_move();
  triangle1.select_move();
  triangle2.select_move();
  triangle3.select_move();
  triangle4.select_move();
  triangle5.select_move();
  int contadorv=0;
  loadPixels();
  for (int i=0;i<(width*height);i++){
    if((255-(red(pixels[i]))<5 && (255-green(pixels[i]))<5 && (255-blue(pixels[i]))<5)){
      contadorv++;
    }
  }
  System.out.println(contador + " fgdhdv ");
  float rason=((float)contadorv)/((float)contador);
  if(rason<0.1 && rason<1){
    System.out.println("ganaste " + rason);
  }else{
    System.out.println("perdiste" + rason);
  }
  if(rason>1){
    System.out.println(" error rason verificación victoria ");
  }
}

class Figure {
  float x, y, angle, d, speed;
  color c1, c2;
  boolean Seleccionado;
  Figure(float xpos, float ypos, float tempAngle, float tempD, float tempSpeed, color tempC1, color tempC2, boolean seleccionado) {
    x = xpos;
    y= ypos;
    angle = tempAngle;
    d = tempD;
    speed = tempSpeed;
    c1= tempC1;
    c2= tempC2;
    Seleccionado=seleccionado;
  }
  /*void mouseReleased() {
   System.out.println("prueba");
   if (mouseButton==LEFT) {
   if (Seleccionado) {
   Seleccionado=false;
   overfigure2=false;
   } else {
   }
   }
   }*/
  void cambiarang(int ang) {
    angle+=ang;
  }
  void select_move() {
    boolean overfigure = false;
    color c;
    c= get(mouseX, mouseY);
    if (!Seleccionado && !overfigure2) {
      if ((red(c)==red(c2) && green(c)==green(c2) && blue(c)==blue(c2))) {
        overfigure=true;
      } else {
        overfigure=false;
      }
    }
    if (Seleccionado) {
      System.out.println(Seleccionado);
      x=mouseX;
      y=mouseY;
    }
    if (mousePressed) {
      if (mouseButton==LEFT && Seleccionado) {
        Seleccionado=!Seleccionado;
        overfigure2=!overfigure2;
        mousePressed=false;
        /*x = mouseX;
         y = mouseY;*/
      }
      if (mouseButton==LEFT && overfigure && !Seleccionado && !overfigure2) {
        Seleccionado=true;
        overfigure2=true;
        mousePressed=false;
        /*x = mouseX;
         y = mouseY;*/
      }
      if (mouseButton==CENTER && parall.Seleccionado) {
        if(rotparall==1){
          rotparall=-1;
        }else if(rotparall==-1){
          rotparall=1;
        }else{
          System.out.println("error espejo paral, figures");
        }
        mousePressed=false;
      }
      if (mouseButton==RIGHT && overfigure) {
        angle += PI/12;
        mousePressed=false;
      }
    }
  }
}
void mouseWheel(MouseEvent event) {
  if (overfigure2) {
    if (square.Seleccionado) {
      square.angle += ((PI/4)*(event.getCount()));
    }
    if (parall.Seleccionado) {
      parall.angle += ((PI/4)*(event.getCount()));
    }
    if (triangle1.Seleccionado) {
      triangle1.angle += ((PI/4)*(event.getCount()));
    }
    if (triangle2.Seleccionado) {
      triangle2.angle += ((PI/4)*(event.getCount()));
    }
    if (triangle3.Seleccionado) {
      triangle3.angle += ((PI/4)*(event.getCount()));
    }
    if (triangle4.Seleccionado) {
      triangle4.angle += ((PI/4)*(event.getCount()));
    }
    if (triangle5.Seleccionado) {
      triangle5.angle += ((PI/4)*(event.getCount()));
    }
  }
}
