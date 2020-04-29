float figuras[][]=new float [7][9];// x, y, angulo, color 1, color 2, color 3, color 4, color 5, color 6
float angulo=-0.349066;
boolean victoria=false;
int movtec=1;
boolean teclado=false;
boolean pistas=false;
boolean jill=false;
float ruedita;
boolean funciona=false;
boolean juegolibre=false;
int cuadrado=0;
int espejo_paral=1;
char keys='m';
boolean adentroj[]=new boolean[7];
int multcol[]=new int [7];
float centro[]=new float [2];
int x1, x2, x3, x4, y1, y2, y3, y4;
int control=3;
PShape s2, s4;
char guardarkey=1;
PImage imagen, niveles, gatorecostado, condor;
color c, cs2 = color(0, 255, 162), cs4 = color(0, 255, 162);

void setup() {
  key='1';
  size(800, 600);
  noStroke();
  imageMode(CENTER);
  imagen = loadImage ("win.jpg");
  gatorecostado = loadImage ("gato recostado.png");
  condor =loadImage("condor.PNG");
  niveles = loadImage("level.png");
  //organizar los boolean
  for (int i=0; i<7; i++) {
    adentroj[i]=false;
  }
  for (int i=0; i<7; i++) {
    figuras[i][3]=255;
  }
  for (int i=0; i<7; i++) {
    multcol[i]=0;
  }
  //primer triangulo
  figuras[0][0]=100+20;
  figuras[0][1]=32+120;
  figuras[0][2]=3*PI/4;//2.35619;
  //segundo triangulo 
  figuras[1][0]=30+170;
  figuras[1][1]=50+20;
  figuras[1][2]=(3*PI/4)+(3*PI/2);
  //tercer figura
  figuras[2][0]=(100*2/3)+120;
  figuras[2][1]=(100*2/3)+120;
  figuras[2][2]=3*PI/2;//2.35619;
  //cuarta figura
  figuras[3][0]=54;
  figuras[3][1]=121;
  figuras[3][2]=(3*PI/4)+(PI/2);
  //quinta figura
  figuras[4][0]=97+20;
  figuras[4][1]=37+20;
  figuras[4][2]=(3*PI/4)+(PI);
  //sexta figura
  figuras[5][0]=147+20;
  figuras[5][1]=98+20;
  figuras[5][2]=PI/4;
  //septima figura
  figuras[6][0]=95;
  figuras[6][1]=44+150;
  figuras[6][2]=(PI*3/4);
  // colores - - - - - - - - - - - - - - - - - - - - - -  
  //figura uno 
  figuras [0][3]=53;
  figuras [0][4]=192;
  figuras [0][5]=12;
  figuras [0][6]=12;
  figuras [0][7]=12;
  figuras [0][8]=192;
  ///////////
  //figura dos
  figuras [1][3]=231;
  figuras [1][4]=107;
  figuras [1][5]=222;
  figuras [1][6]=46;
  figuras [1][7]=229;
  figuras [1][8]=171;
  ///////////
  //figura tres
  figuras [2][3]=255;
  figuras [2][4]=255;
  figuras [2][5]=0;
  figuras [2][6]=115;
  figuras [2][7]=210;
  figuras [2][8]=253;
  ///////////
  //figura cuatro
  figuras [3][3]=236;
  figuras [3][4]=159;
  figuras [3][5]=29;
  figuras [3][6]=255;
  figuras [3][7]=0;
  figuras [3][8]=0;
  ///////////
  //figura cinco
  figuras [4][3]=120;
  figuras [4][4]=120;
  figuras [4][5]=120;
  figuras [4][6]=255;
  figuras [4][7]=100;
  figuras [4][8]=255;
  ///////////
  //figura seis
  figuras [5][3]=156;
  figuras [5][4]=43;
  figuras [5][5]=84;
  figuras [5][6]=152;
  figuras [5][7]=194;
  figuras [5][8]=43;
  ///////////
  //figura siete
  figuras [6][3]=255;
  figuras [6][4]=210;
  figuras [6][5]=243;
  figuras [6][6]=255;
  figuras [6][7]=132;
  figuras [6][8]=0;
  fill(255);
  rectMode(CENTER);
}
float azimut(int[] a, int [] b) {
  int DN;
  int DE;
  DN=b[1]-a[1];
  DE=b[0]-a[0];
  if (DN==0 || DE==0) {
    if (DN>0) {
      return (float)0.0;
    } else {
      if (DE>0) {
        return (float)90.0;
      } else {
        if (DN<0) {
          return (float)180.0;
        } else {
          if (DE<0) {
            return (float)270.0;
          } else {
            return 4000;
          }
        }
      }
    }
  } else {
    float depaso=((float)DE/DN);
    float angulo=abs((float)Math.toDegrees(atan(depaso)));

    if (DN*DE>0) {
      if (DN>0) {
        return (float)angulo;
      } else {
        return (float)(180+angulo);
      }
    } else {
      if (DN>0) {
        return (float)(360-angulo);
      } else {
        return (float)(180-angulo);
      }
    }
  }
}
void draw() {
  tint(255, 0);
  background(0, 255, 162);
  //Forma grande2
  System.out.println(pistas + " pistas ");
  if ((abs(pmouseX-115)<=100) && (abs(pmouseY-500)<=25) || pistas) {
    System.out.println(" prueba ");
    cuadrado=100;
  } else {
    cuadrado=0;
  }
  fill(0, cuadrado, 0);
  rect(115, 500, 200, 50);
  fill(255-cuadrado, 255-cuadrado, 255-cuadrado);
  textSize(30);
  text("pistas o  ( M )", 18, 500+(25/2));
  s2 = createShape();
  s2.beginShape();
  s2.fill(cs2);
  s2.vertex(465, 146);
  s2.vertex(535, 216);
  s2.vertex(500, 216);
  s2.vertex(500, 286);
  s2.vertex(640, 286);
  s2.vertex(640, 426);
  s2.vertex(430, 426);
  s2.vertex(430, 216);
  s2.vertex(395, 216);
  s2.endShape(CLOSE);
  shape(s2, 0, 0);
  //Forma grande4
  s4 = createShape();
  s4.beginShape();
  s4.fill(cs4);
  s4.vertex(590, 136);
  s4.vertex(660, 206);
  s4.vertex(590, 206);
  s4.vertex(590, 236);
  s4.vertex(640, 286);
  s4.vertex(640, 386);
  s4.vertex(570, 456);
  s4.vertex(430, 456);
  s4.vertex(470, 416);
  s4.vertex(370, 316);
  s4.vertex(570, 316);
  s4.vertex(540, 286);
  s4.vertex(540, 186);
  s4.endShape(CLOSE);
  shape(s4, 0, 0);
  image(niveles, width/2, height/2);
  if (!funciona) {  
    switch (key) {
    case 'r':
    case 'R':
      teclado=true;
      control=0;
      break;
    case 't':
    case 'T':
      teclado=true;
      control=1;
      break;
    case 'y':
    case 'Y':
      teclado=true;
      control=2;
      break;
    case 'u':
    case 'U':
      teclado=true;
      control=3;
      break;
    case 'i':
    case 'I':
      teclado=true;
      control=4;
      break;
    case 'o':
    case 'O':
      teclado=true;
      control=5;
      break;
    case 'p':
    case 'P':
      teclado=true;
      control=6;
      break;
    default:
      break;
    }
  }
  if ((key == '1' || key=='2' || key=='4' || key=='3' || key == '5')) {
    guardarkey=key;
  } else {
  }
  switch (guardarkey) { 
  case '1':
    guardarkey='1';
    cs2=color(0, 255, 162);
    cs4=color(0, 255, 162);
    juegolibre=!juegolibre;
    tint(255, 0);
    image(niveles, width/2, height/2);
    break;
  case '2':
    guardarkey='2';
    cs2=(255);
    cs4=color(0, 255, 162);
    shape(s2, 0, 0);
    tint(255, 0);
    image(niveles, width/2, height/2);
    break;
  case '3':
    guardarkey='3';
    cs4=color(0, 255, 162);
    cs2=color(0, 255, 162);
    tint(255, 255);
    scale((float)(Math.sqrt((39287.0/26318.0))));
    image(gatorecostado, (width/2)+50, height/2);
    tint(255, 0);
    scale(1/(float)(Math.sqrt((39287.0/26318.0))));
    break;
  case '4':
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
    break;
  default:
    break;
  }
  teclado=false;
  adentroj[6]=paralelol_l(figuras[6][0], figuras [6][1], figuras [6][2], 0.5, (int)figuras [6][3+3*multcol[6]], (int)(figuras[6][4+3*multcol[6]]), (int)figuras[6][5+3*multcol[6]]);
  if (adentroj[6]) {
    multcol[6]=1;
  } else {
    multcol[6]=0;
  }
  adentroj[5]=cuadrado_l(figuras[5][0], figuras [5][1], figuras [5][2], 0.5, (int)figuras [5][3+3*multcol[5]], (int)(figuras[5][4+3*multcol[5]]), (int)figuras[5][5+3*multcol[5]]);
  if (adentroj[5]) {
    multcol[5]=1;
  } else {
    multcol[5]=0;
  }
  adentroj[4]=triangulo_l(figuras[4][0], figuras [4][1], figuras [4][2], 2, (int)figuras [4][3+3*multcol[4]], (int)(figuras[4][4+3*multcol[4]]), (int)figuras[4][5+3*multcol[4]]);
  if (adentroj[4]) {
    multcol[4]=1;
  } else {
    multcol[4]=0;
  }
  adentroj[3]=triangulo_l(figuras[3][0], figuras [3][1], figuras [3][2], 2, (int)figuras [3][3+3*multcol[3]], (int)(figuras[3][4+3*multcol[3]]), (int)figuras[3][5+3*multcol[3]]);
  if (adentroj[3]) {
    multcol[3]=1;
  } else {
    multcol[3]=0;
  }
  adentroj[2]=triangulo_l(figuras[2][0], figuras [2][1], figuras [2][2], 1, (int)figuras [2][3+3*multcol[2]], (int)(figuras[2][4+3*multcol[2]]), (int)figuras[2][5+3*multcol[2]]);
  if (adentroj[2]) {
    multcol[2]=1;
  } else {
    multcol[2]=0;
  }
  adentroj[0]=triangulo_l(figuras [0][0], figuras[0][1], figuras[0][2], 0.5, (int)(figuras [0][3+3*multcol[0]]), (int) (figuras[0][4+3*multcol[0]]), (int)figuras [0][5+3*multcol[0]]);
  if (adentroj[0]) {
    multcol[0]=1;
  } else {
    multcol[0]=0;
  }
  adentroj[1]=triangulo_l(figuras[1][0], figuras [1][1], figuras [1][2], 0.5, (int)figuras [1][3+3*multcol[1]], (int)(figuras[1][4+3*multcol[1]]), (int)figuras[1][5+3*multcol[1]]);
  if (adentroj[1]) {
    multcol[1]=1;
  } else {
    multcol[1]=0;
  }
  int i;
  for ( i=0; i<7; i++) {
    if (adentroj[i]) {
      jill=true;
      break;
    }
  }
  if (jill) {
    if (mousePressed && mouseButton==LEFT) {
      funciona=!funciona;
      if (funciona) {
        control= i;
      }
      jill=false;
      mousePressed=false;
    }
  }
  if (control<7) {
    if (funciona)
    {
      figuras[control][0]=mouseX;
      figuras[control][1]=mouseY;
    }
  }
  if (funciona && (control==6)) {
    if (mousePressed && mouseButton==CENTER) {
      if (espejo_paral==1) {
        espejo_paral=0;
      } else if (espejo_paral==0) {
        espejo_paral=1;
      } else {
      }
      mousePressed=false;
    }
  }

  int whitecounter=0;
  int totalcounter=0;
  if (((mousePressed && mouseButton==RIGHT) || victoria) && key!='1') {
    for (int j = 0; j < width; j++) {
      for (int k = 0; k < height; k++) {
        c= get(j, k);
        totalcounter++;
        if ((red(c)==255 && green(c)==255 && blue(c)==255) || (red(c)==253 && green(c)==254 && blue(c)==254)) {
          whitecounter++;
        }
      }
    }
    if (whitecounter<=850) {
      tint(255, 255);
      image(imagen, width/2, height/2);
    }
  }
  if (cuadrado==100) {
    fill(255, 255, 255);
    rect((width/2)+50, (height/2)-10, 400+100, 300-20);
    fill(0, 0, 0);
    int tamano=18;
    textSize(tamano);
    text("1: juego libre", (width/2)-(width/4), (height/4)+tamano);
    text("2: casa", (width/2)-(width/4), (height/4)+tamano*2);
    text("3: gato", (width/2)-(width/4), (height/4)+tamano*3);
    text("4: pato", (width/2)-(width/4), (height/4)+tamano*4);
    text("5: condor", (width/2)-(width/4), (height/4)+tamano*5);
    text("click izquierdo: seleccionar ficha", (width/2)-(width/4), (height/4)+tamano*6);
    text("click derecho: verificar victoria", (width/2)-(width/4), (height/4)+tamano*7);
    text("rueda del raton: rotar figura", (width/2)-(width/4), (height/4)+tamano*8);
    text("click rueda: espejo paralelogramo", (width/2)-(width/4), (height/4)+tamano*9);
    text("w,a,s,d movimiento ", (width/2)-(width/4), (height/4)+tamano*10);
    text("r,t,y,u,i,o,p selección figuras ", (width/2)-(width/4), (height/4)+tamano*11);
    text("( Q ) rotación figuras ", (width/2)-(width/4), (height/4)+tamano*12);
    text("( Z ) cambio de velocidad ", (width/2)-(width/4), (height/4)+tamano*13);
    text("( x ) espejo paralelogramo ", (width/2)-(width/4), (height/4)+tamano*14);
    text("( v ) verificación vistoria ", (width/2)-(width/4), (height/4)+tamano*15);
  }
  jill=false;
  key='z';
}
void keyPressed() {
  if (key=='m' || key=='M') {

    pistas=true;
  }
  if (key=='v' || key=='V') {
    victoria=true;
  }
  if (control<7) {
    switch (key) {
    case 'w':
    case 'W':
      {
        figuras[control][0]+=0;
        figuras[control][1]-=movtec;
        break;
      }
    case 's':
    case 'S':
      figuras[control][0]+=0;
      figuras[control][1]+=movtec;
      break;
    case 'a':
    case 'A':
      figuras[control][0]-=movtec;
      figuras[control][1]+=0;
      break;
    case 'd':
    case 'D':
      {
        figuras[control][0]+=movtec;
        figuras[control][1]+=0;
        break;
      }
    case 'q':
    case 'Q':
      figuras[control][2]+=PI/4;
    default:
      break;
    }
    if (key=='z' || key=='Z') {
      if (movtec==1) {
        movtec=20;
      } else {
        movtec=1;
      }
    }
    if ((key=='x' || key=='X') && control==6) {
      if (espejo_paral==1) {
        espejo_paral=0;
      } else if (espejo_paral==0) {
        espejo_paral=1;
      } else {
        System.out.println("error primario numero 4 ");
      }
    }
  }
}
void keyReleased() {
  if (key=='m' || key=='M') {

    pistas=false;
  }
  if (key=='v' || key=='V') {
    victoria=false;
  }
}
void mouseWheel(MouseEvent event) {
  if (funciona) {
    figuras[control][2] += Math.toRadians(45*(event.getCount()));
  }
}
boolean triangulo_l(float a, float b, float angulos, float escala, int color_ri, int color_gi, int color_bi) {
  escala=sqrt(escala);
  int vc[]=new int [2];
  int vb[]=new int [2];
  int va[]=new int [2];
  int vp[]=new int [2];
  va[0]=(int)((Math.round((a+(escala*74.535599249993*Math.cos(angulos+(Math.toRadians(270.0-26.5051-0))))))));
  va[1]=(int)((Math.round((b+(escala*74.535599249993*Math.sin(angulos+(Math.toRadians(270.0-26.5051-0))))))));
  vb[0]=(int)((Math.round((a+(escala*47.1404520791032*Math.cos(angulos+(Math.toRadians(135))))))));
  vb[1]=(int)((Math.round((b+(escala*47.1404520791032*Math.sin(angulos+(Math.toRadians(135))))))));
  vc[0]=(int)((Math.round((a+(escala*74.535599249993*Math.cos(angulos+(Math.toRadians(25))))))));
  vc[1]=(int)((Math.round((b+(escala*74.535599249993*Math.sin(angulos+(Math.toRadians(25))))))));
  vp[0]=mouseX;
  vp[1]=mouseY;
  fill(color_ri, color_gi, color_bi);
  triangle(va[0], va[1], vb[0], vb[1], vc[0], vc[1]);
  float ac;
  float ab;
  float ca;
  float cb;
  float cp, ap;
  ac=azimut(va, vc);
  ab=azimut(va, vb);
  ca=azimut(vc, va);
  cb=azimut(vc, vb);
  cp=azimut(vc, vp);
  ap=azimut(va, vp);
  if ((abs(ac-ab)>180)) {
    if (ac<ab) {
      if (ap<ac) {
        ap+=360;
        ac+=360;
      } else {
        ac+=360;
      }
    } else if (ab<ac) {
      if (ap<ab) {
        ap+=360;
        ab+=360;
      } else {
        ab+=360;
      }
    }
  }
  if ((abs(ca-cb)>180)) {
    if (ca<cb) {
      if (cp<ca) {
        cp+=360;
        ca+=360;
      } else {
        ca+=360;
      }
    } else if (cb<ca) {
      if (cp<cb) {
        cp+=360;
        cb+=360;
      } else {
        cb+=360;
      }
    }
  }
  if ((ac>ap && ap>ab) || (ac<ap &&ap<ab)) {
    if ((ca>cp && cp>cb) || (ca<cp && cp<cb)) {
      return true;
    } else {
      return false;
    }
  } else {
    return false;
  }
}
boolean cuadrado_l(float a, float b, float angulos, float escala, int color_ri, int color_gi, int color_bi) {
  escala=sqrt(escala);
  int vd[]=new int [2];
  int vc[]=new int [2];
  int vb[]=new int [2];
  int va[]=new int [2];
  int vp[]=new int [2];
  va[0]=(int)((Math.round((a+(escala*70.7106781186548*Math.cos(angulos+(Math.toRadians(45))))))));////////      A
  va[1]=(int)((Math.round((b+(escala*70.7106781186548*Math.sin(angulos+(Math.toRadians(45))))))));////////      A
  vb[0]=(int)((Math.round((a+(escala*70.7106781186548*Math.cos(angulos+(Math.toRadians(180-45))))))));////      B
  vb[1]=(int)((Math.round((b+(escala*70.7106781186548*Math.sin(angulos+(Math.toRadians(180-45))))))));////      B
  vc[0]=(int)((Math.round((a+(escala*70.7106781186548*Math.cos(angulos+(Math.toRadians(180+45))))))));////      C
  vc[1]=(int)((Math.round((b+(escala*70.7106781186548*Math.sin(angulos+(Math.toRadians(180+45))))))));////      C
  vd[0]=(int)((Math.round((a+(escala*70.7106781186548*Math.cos(angulos+(Math.toRadians(360-45))))))));////      D
  vd[1]=(int)((Math.round((b+(escala*70.7106781186548*Math.sin(angulos+(Math.toRadians(360-45))))))));////      D
  vp[0]=mouseX;
  vp[1]=mouseY;
  fill(color_ri, color_gi, color_bi);
  quad(va[0], va[1], vb[0], vb[1], vc[0], vc[1], vd[0], vd[1]);
  float ad;//
  float ab;//
  float cb;//
  float cd;//
  float ba;//
  float bc;//
  float cp, ap, bp;////
  ad=azimut(va, vd);//
  ab=azimut(va, vb);//
  cd=azimut(vc, vd);//
  cb=azimut(vc, vb);//
  cp=azimut(vc, vp);//
  ap=azimut(va, vp);//
  ba=azimut(vb, va);//
  bc=azimut(vb, vc);//
  bp=azimut(vb, vp);//
  if ((abs(ad-ab)>180)) {
    if (ad<ab) {
      if (ap<ad) {
        ap+=360;
        ad+=360;
      } else {
        ad+=360;
      }
    } else if (ab<ad) {
      if (ap<ab) {
        ap+=360;
        ab+=360;
      } else {
        ab+=360;
      }
    }
  }
  if ((abs(cd-cb)>180)) {
    if (cd<cb) {
      if (cp<cd) {
        cp+=360;
        cd+=360;
      } else {
        cd+=360;
      }
    } else if (cb<cd) {
      if (cp<cb) {
        cp+=360;
        cb+=360;
      } else {
        cb+=360;
      }
    }
  }
  if ((abs(ba-bc)>180)) {
    if (ba<bc) {
      if (bp<ba) {
        bp+=360;
        ba+=360;
      } else {
        ba+=360;
      }
    } else if (bc<ba) {
      if (bp<bc) {
        bp+=360;
        bc+=360;
      } else {
        bc+=360;
      }
    }
  }
  if ((ad>ap && ap>ab) || (ad<ap &&ap<ab)) {
    if ((cd>cp && cp>cb) || (cd<cp && cp<cb)) {
      if ((ba>bp && bp>bc) || (bc>bp && bp>ba)) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  } else {
    return false;
  }
}
boolean paralelol_l(float a, float b, float angulos, float escala, int color_ri, int color_gi, int color_bi) {
  escala=sqrt(escala);
  int vd[]=new int [2];
  int vc[]=new int [2];
  int vb[]=new int [2];
  int va[]=new int [2];
  int vp[]=new int [2];
  va[0]=(int)((Math.round((a+((escala*111.803398874989*Math.cos(angulos+(Math.toRadians(espejo_paral*53.13010235))+ (Math.toRadians(360.0-26.5650512)))))))));////////      A
  va[1]=(int)((Math.round((b+((escala*111.803398874989*Math.sin(angulos+(Math.toRadians(espejo_paral*53.13010235))+(Math.toRadians(360.0-26.5650512)))))))));////////      A
  vb[0]=(int)((Math.round((a+((escala*50.0*Math.cos(angulos+(Math.toRadians(90.0)))))))));////      B
  vb[1]=(int)((Math.round((b+((escala*50.0*Math.sin(angulos+(Math.toRadians(90.0)))))))));////      B
  vc[0]=(int)((Math.round((a+((escala*111.803398874989*Math.cos(angulos+(Math.toRadians(espejo_paral*53.13010235))+(Math.toRadians(180.0-26.5650512)))))))));////      C
  vc[1]=(int)((Math.round((b+((escala*111.803398874989*Math.sin(angulos+(Math.toRadians(espejo_paral*53.13010235))+(Math.toRadians(180.0-26.5650512)))))))));////      C
  vd[0]=(int)((Math.round((a+((escala*50.0*Math.cos(angulos+(Math.toRadians(270.0)))))))));////      D
  vd[1]=(int)((Math.round((b+((escala*50.0*Math.sin(angulos+(Math.toRadians(270.0)))))))));////      D
  vp[0]=mouseX;
  vp[1]=mouseY;
  fill(color_ri, color_gi, color_bi);
  quad(va[0], va[1], vb[0], vb[1], vc[0], vc[1], vd[0], vd[1]);
  float ad;//
  float ab;//
  float cb;//
  float cd;//
  float ba;//
  float bc;//
  float cp, ap, bp;////
  ad=azimut(va, vd);//
  ab=azimut(va, vb);//
  cd=azimut(vc, vd);//
  cb=azimut(vc, vb);//
  cp=azimut(vc, vp);//
  ap=azimut(va, vp);//
  ba=azimut(vb, va);//
  bc=azimut(vb, vc);//
  bp=azimut(vb, vp);//
  if ((abs(ad-ab)>180)) {
    if (ad<ab) {
      if (ap<ad) {
        ap+=360;
        ad+=360;
      } else {
        ad+=360;
      }
    } else if (ab<ad) {
      if (ap<ab) {
        ap+=360;
        ab+=360;
      } else {
        ab+=360;
      }
    }
  }
  if ((abs(cd-cb)>180)) {
    if (cd<cb) {
      if (cp<cd) {
        cp+=360;
        cd+=360;
      } else {
        cd+=360;
      }
    } else if (cb<cd) {
      if (cp<cb) {
        cp+=360;
        cb+=360;
      } else {
        cb+=360;
      }
    }
  }
  if ((abs(ba-bc)>180)) {
    if (ba<bc) {
      if (bp<ba) {
        bp+=360;
        ba+=360;
      } else {
        ba+=360;
      }
    } else if (bc<ba) {
      if (bp<bc) {
        bp+=360;
        bc+=360;
      } else {
        bc+=360;
      }
    }
  }
  if ((ad>ap && ap>ab) || (ad<ap &&ap<ab)) {
    if ((cd>cp && cp>cb) || (cd<cp && cp<cb)) {
      if ((ba>bp && bp>bc) || (bc>bp && bp>ba)) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  } else {
    return false;
  }
}
//////////////////
/* 
 codigo escrito por Laura Valentina Triana y Hector Fabio Chaparro Fontalvo
 */
///////////////////
