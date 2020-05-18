Figure [] figs;
BufferedReader reader;
PrintWriter output;
ArrayList<Nivel> niveles = new ArrayList<Nivel>();
int nivelesm=0;
int guardarkey=-1;
boolean nose=false;
int numero=0;
int delai=0;
Nivel nivel1;
Nivel nivel2;
PImage fondo;
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
  } 
  catch (IOException e) {
    e.printStackTrace();
    line = null;
  }
  if (line==null) {
    System.out.println( " error lectura niveles.txt");
  } else {
    nivelesm= Integer.parseInt(line);
  }
  contador3=0;
  int delta1=0;
  size(800, 600);
  background(0, 255, 162);
  figs = new Figure[7];
  figs[0] = new FigureParall (110, 210, 0, 25, 1, color(255, 128, 0), false);
  figs[1] = new FigureSquare (185, 135, PI/4, 35, 1, color(255, 51, 153), false);
  figs[2] = new FigureTriangle(135, 170, PI, 50, 1, color(51, 255, 0), false);
  figs[3] = new FigureTriangle(218, 85, PI/2, 50, 1, color(255, 0, 17), false);
  figs[4] = new FigureTriangle(202, 203, -PI/4, 70, 1, color(0, 128, 255), false);
  figs[5] = new FigureTriangle(68, 135, -PI/2, 100, 1, color(255, 255, 0), false);
  figs[6] = new FigureTriangle(135, 69, 0, 100, 1, color(191, 63, 192), false);
  for (int i=0; i<nivelesm; i++) {
    Nivel x =new Nivel();
    x.escala=1;
    x.nibel=loadImage ("nivel"+ i + ".PNG");
    niveles.add(x);
  }
  for (Figure fig : figs) {
    fig.display();
  }
  color w;
  for (int i=0; i<width; i++) {
    for (int j=0; j<height; j++) {
      contador3++;
    }
  }
  for (int i=0; i<width; i++) {
    for (int j=0; j<height; j++) {
      w=get(i, j);
      if ((red(w)==0 && green(w)==255 && blue(w)==162)) {
        contador++;
      }
    }
  }
  delta1=contador3-contador;
  for (int i=0; i<3; i++) {
    niveles.get(i).verificaresc(contador3, delta1);
  }
}
void draw() {
  if (sabe) {
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
  if ( keyPressed && ((key=='u' || key=='b'))) {
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
      guardarkey=nivelesm-1;
    }
  }
  nose=false;
  if (guardarkey!=-1) {
    background(0, 255, 162);
    niveles.get(guardarkey).display();
  } else {
    background(0, 255, 162);
  }
  ///////////////////////////seleccion niveles
  for (Figure fig : figs) {
    fig.display();
    fig.select_move();
  }
  if (guardarkey!=-1) {
    int contadorv=0;
    loadPixels();
    for (int i=0; i<(width*height); i++) {
      if ((255-(red(pixels[i]))<5 && (255-green(pixels[i]))<5 && (255-blue(pixels[i]))<5)) {
        contadorv++;
      }
    }
    float rason=((float)contadorv)/(((float)contador3)-((float)contador));
    if (rason<0.0125 && rason<1) {
      System.out.println("ganaste ");
    } else {
      System.out.println();
      System.out.println();
      System.out.println();
      System.out.println();
      System.out.println();
    }
    if (rason>1) {
      System.out.println(" error rason verificación victoria ");
    }
  } else {
    if (keyPressed && key=='l') {
      loadPixels();
      for (int i=0; i<height*width; i++) {
        if (pixels[i]!=color(0, 255, 162)) {
          pixels[i]=color(255, 255, 255);
        }
        sabe=true;
      }
      updatePixels();
      key='m';
    }
  }
  key='n';
}

abstract class Figure {
  float x, y, angle, d, speed;
  color c1;
  boolean selected;
  Figure(float xpos, float ypos, float tempAngle, float tempD, float tempSpeed, color tempC1, boolean tempSelected) {
    x = xpos;
    y= ypos;
    angle = tempAngle;
    d = tempD;
    speed = tempSpeed;
    c1 = tempC1;
    selected = tempSelected;
  }
  abstract void display();
  void cambiarang(int ang) {
    angle+=ang;
  }
  void select_move() {
    boolean overfigure = false;
    color c;
    c= get(mouseX, mouseY);
    if (!selected && !overfigure2) {
      if ((red(c)==red(c1) && green(c)==green(c1) && blue(c)==blue(c1))) {
        overfigure=true;
      } else {
        overfigure=false;
      }
    }
    if (selected) {
      x = mouseX;
      y = mouseY;
    }
    if (mousePressed) {
      if (mouseButton==LEFT && selected) {
        selected=!selected;
        overfigure2=!overfigure2;
        mousePressed=false;
        /*x = mouseX;
         y = mouseY;*/
      }
      if (mouseButton==LEFT && overfigure && !selected && !overfigure2) {
        selected=true;
        overfigure2=true;
        mousePressed=false;
        /*x = mouseX;
         y = mouseY;*/
      }
      if (mouseButton==CENTER && figs[0].selected) {
        if (rotparall==1) {
          rotparall=-1;
        } else if (rotparall==-1) {
          rotparall=1;
        } else {
          System.out.println("error espejo paral, figures");
        }
        mousePressed=false;
      }
    }
  }
}
void mouseWheel(MouseEvent event) {
  if (overfigure2) {
    for (Figure fig : figs) {
      if (fig.selected) {
        fig.angle += ((PI/12)*(event.getCount()));
      }
    }
  }
}
