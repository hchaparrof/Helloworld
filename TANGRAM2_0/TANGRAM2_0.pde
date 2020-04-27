float figuras[][]=new float [7][9];// x, y, angulo, color 1, color 2, color 3, color 4, color 5, color 6
float angulo=-0.349066;
boolean jill=false;
float ruedita;
boolean funciona=false;
int espejo_paral=1;
boolean adentroj[]=new boolean[7];
int multcol[]=new int [7];
float centro[]=new float [2];
int x1, x2, x3, x4, y1, y2, y3, y4;
int control=0;
PShape s;

void setup() {
  size(800, 600);
  noStroke();
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
  figuras [4][7]=255;
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
  background(0, 255, 162);
     //Forma grande
  fill(255);
  s = createShape();
  s.beginShape();
  s.vertex(590, 136);
  s.vertex(660, 206);
  s.vertex(590, 206);
  s.vertex(590, 236);
  s.vertex(640, 286);
  s.vertex(640, 386);
  s.vertex(570, 456);
  s.vertex(430, 456);
  s.vertex(470, 416);
  s.vertex(370, 316);
  s.vertex(570, 316);
  s.vertex(540, 286);
  s.vertex(540, 186);
  s.endShape(CLOSE);
  //Forma grande
  shape(s, 0, 0);
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
    if (funciona) {
      figuras[control][0]=mouseX;
      figuras[control][1]=mouseY;
    }
  }
if(funciona && (control==6)){
    if(mousePressed && mouseButton==CENTER){
      if(espejo_paral==1){
        espejo_paral=0;
      }else if (espejo_paral==0){
        espejo_paral=1;
      }else{
        System.out.println("error primario numero 4 ");
      }
      mousePressed=false;
    }
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
        System.out.println("1");
        bp+=360;
        bc+=360;
      } else {
        //System.out.println(cp +" cp " + );
        System.out.println("2");
        bc+=360;
      }
    }
  }
  System.out.println(bc +" bc ");
  System.out.println( bp + " bp ");
  System.out.println( ba + " ba ");
  if ((ad>ap && ap>ab) || (ad<ap &&ap<ab)) {
    //System.out.println(" 1");
    if ((cd>cp && cp>cb) || (cd<cp && cp<cb)) {
      //System.out.println(" 2");
      if ((ba>bp && bp>bc) || (bc>bp && bp>ba)) {
        //System.out.println(" 3");
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
