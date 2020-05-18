BufferedReader reader;
PrintWriter output;
ArrayList<Nivel> niveles = new ArrayList<Nivel>();
int nivelesm=0;
int guardarkey=-1;
boolean nose=false;
FigureSquare square;
FigureParall parall;
FigureTriangle triangle1;
FigureTriangle triangle2;
FigureTriangle triangle3;
FigureTriangle triangle4;
FigureTriangle triangle5;
int numero=0;
int prueba=1;
int rotparall=1;
boolean overfigure2 = false;
int contador=0;
int contador3;
int delta1=0;
boolean sabe=false;
void setup() {
  reader = createReader("niveles.txt");
  String line;
  try {
    line = reader.readLine();
  } catch (IOException e) {
    e.printStackTrace();
    line = null;
  }
  if(line==null){
    System.out.println( " error lectura niveles.txt");
  }else{
    nivelesm= Integer.parseInt(line);
  }
  System.out.print((int)'2');
  //fondo=loadImage ("prueba.jpg");
  contador3=0;
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
  for (int i=0; i<nivelesm; i++) {
    Nivel x =new Nivel();
    x.escala=1;
    x.nibel=loadImage ("nivel"+ i + ".PNG");
    niveles.add(x);
  }
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
  for (int i=0; i<3; i++) {
    niveles.get(i).verificaresc(contador3, delta1);
  }
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
  key=1;
}
void draw() {
  System.out.println(sabe);
  if (sabe) {
    System.out.println(" sabe ");
    save("nivel" + nivelesm + ".PNG");
    Nivel x =new Nivel();
    x.escala=1;
    x.nibel=loadImage ("nivel"+ nivelesm + ".PNG");
    niveles.add(x);
    nivelesm++;
    output = createWriter("niveles.txt"); 
    output.println(nivelesm);
    output.flush();
    output.close();
    sabe=false;
  }
  background(0, 255, 162);
  ///////////seleccion niveles
    if( keyPressed && ((key=='u' || key=='b'))) {
      if (key=='u') {
        guardarkey+=1;
      } else {
        guardarkey-=1;
      }
      key='m';
    } 
    if ((guardarkey>nivelesm-1 || guardarkey<-1)) {
      if (guardarkey>2) {
        guardarkey=-1;
      } else {
        guardarkey=2;
      }
    }
    nose=false;
  if (guardarkey!=-1) {
    background(0, 255, 162);
    niveles.get(guardarkey).display();
  } else {
    background(0, 255, 162);
  }
  System.out.println(guardarkey + "  guardar  key  ");
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
  for (int i=0; i<(width*height); i++) {
    if ((255-(red(pixels[i]))<5 && (255-green(pixels[i]))<5 && (255-blue(pixels[i]))<5)) {
      contadorv++;
    }
  }
  System.out.println(contador3 + " fgdhdv ");
  System.out.println(contador + " fgdhdv ");
  float rason=((float)contadorv)/(((float)contador3)-((float)contador));
  if (rason<0.1 && rason<1) {
    System.out.println("ganaste " + rason);
  } else {
    System.out.println("perdiste" + rason);
  }
  if (rason>1) {
    System.out.println(" error rason verificación victoria ");
  }
  if (keyPressed && key=='l') {
    System.out.println(" l ");
    loadPixels();
    for (int i=0; i<height*width; i++) {
      if (pixels[i]!=color(0, 255, 162)) {
        pixels[i]=color(255, 255, 255);
      }
      sabe=true;
    }
    System.out.println(" prueba ");
    updatePixels();
    key='m';
  }
  key='n';
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
      }
      if (mouseButton==LEFT && overfigure && !Seleccionado && !overfigure2) {
        Seleccionado=true;
        overfigure2=true;
        mousePressed=false;
      }
      if (mouseButton==CENTER && parall.Seleccionado) {
        if (rotparall==1) {
          rotparall=-1;
        } else if (rotparall==-1) {
          rotparall=1;
        } else {
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
