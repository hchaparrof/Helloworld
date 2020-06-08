Figure [] figs;
BufferedReader reader;
PrintWriter output;
ArrayList<Nivel> niveles = new ArrayList<Nivel>();
int nivelesm=0;
int guardarkey=-1;
int rotparall=1;
boolean overfigure2 = false;
int contador=0;
int contador3=0;
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
  size(800, 600);
  background(0, 255, 162);
  figs = new Figure[7];
  figs[0] = new FigureParall (110, 210, 0, 25, 1, color(255, 128, 0), false, false);
  figs[1] = new FigureSquare (185, 135, PI/4, 35, 1, color(255, 51, 153), false, false);
  figs[2] = new FigureTriangle(135, 170, PI, 50, 1, color(51, 255, 0), false, false);
  figs[3] = new FigureTriangle(218, 85, PI/2, 50, 1, color(255, 0, 17), false, false);
  figs[4] = new FigureTriangle(202, 203, -PI/4, 70, 1, color(0, 128, 255), false, false);
  figs[5] = new FigureTriangle(68, 135, -PI/2, 100, 1, color(255, 255, 0), false, false);
  figs[6] = new FigureTriangle(135, 69, 0, 100, 1, color(191, 63, 192), false, false);
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
  } 
  if ((guardarkey>nivelesm-1 || guardarkey<-1)) {
    if (guardarkey>2) {
      guardarkey=-1;
    } else {
      guardarkey=nivelesm-1;
    }
  }
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
void mouseWheel(MouseEvent event) {
  if (overfigure2) {
    for (Figure fig : figs) {
      if (fig.selected) {
        fig.angle += ((PI/12)*(event.getCount()));
      }
    }
  }
}
