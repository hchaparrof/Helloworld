float s;
class Imagen{
  PImage hoja;
  Imagen(PImage tempHoja){
    hoja = tempHoja;
  }
  void displai(){
    float w=displayWidth-menor*0.2;
    float h=displayHeight-menor*0.2;
    if((w/hoja.width)<(h/hoja.height)){
      s=(w/hoja.width);   
    }else{
      s=(h/hoja.height);
    }
    //System.out.println(hoja.height);
    pushMatrix();
    scale(s);
    imageMode(CENTER);
    image(hoja, displayWidth/(2*s) , displayHeight/(2*s));
    popMatrix();
  } 
  void distancia(){
    if (mousePressed) {
      if (!derecha) {
        mouser[0]=mouseX;
        mouser[1]=mouseY;
        derecha=true;
        mousePressed=false;
      } 
      else {
        mouser[2]=mouseX;
        mouser[3]=mouseY;
        mousePressed=false;
        float dist2;
        float dx;
        float dy;
        dx=mouser[2]-mouser[0];
        dy=mouser[3]-mouser[1];
        dist2=(float)(Math.sqrt(((dx*dx)+(dy*dy))));
        cmcuadrado = dist2*dist2;
        System.out.println(dist2);
        derecha=false;
      }
    }
  }
  void eliminar(){
    if (mousePressed) {
      switch(first) {
        case(0):
          mouse[0]=mouseX;
          mouse[1]=mouseY;
          first++;
          mousePressed=false;
          break;
        case(1):
          mouse[2]=mouseX;
          mouse[3]=mouseY;
          first++;
          mousePressed=false;
          break;
        case(2):
          mouse[4]=mouseX;
          mouse[5]=mouseY;
          corte++;
          float veinte[][]={{mouse[0],mouse[1]},{mouse[2],mouse[3]},{mouse[4],mouse[5]}};
          cortes.add(veinte);
          first=0;
          mousePressed=false;
          break;
      default:
          break;
      }
    }
  }
  void recortar(float[][] f) {
    loadPixels();
    float m;
    float dx;
    float dy;
    float b;
    dx=f[1][0]-f[0][0];
    if (dx==0) {
      f[1][0]+=1;
      dx=f[1][0]-f[0][0];
    }
    boolean mayor=false;
    dy=f[1][1]-f[0][1];
    m=dy/dx;
    b=f[0][1]-(f[0][0]*m);
    if (f[2][0]*m+b<f[2][1]) {
      mayor=true;
    }
    for (int i=0; i<displayWidth; i++) {
      for (int j=0; j<displayHeight; j++) {
        if (mayor) {
          if (i*m+b<j) {
            pixels[j*width+i] = recorte;
          }
        } else {
          if (i*m+b>j) {
            pixels[j*width+i] =recorte;
          }
        }
      }
    }
    updatePixels();
  }
  float aret(){
    float ref=referencia();
    int negro=totaln();
    return area(negro,ref);
  }
  int referencia(){
    loadPixels();
    int ref=0;
    for(int i=0;i<displayWidth*displayHeight;i++){
      if(pixels[i]==color(0,0,1) ){
        ref++;
      }
    }
    System.out.println("ref"+ref);
    return ref;
  }
  int totaln(){
    loadPixels();
    int negro=0;
    for(int i=0;i<displayWidth*displayHeight;i++){
      if(pixels[i]==color(0,0,0) ){
        negro++;
      }
    }
    System.out.println("negro"+negro);
    return negro;
  }
  float area(int negro, float ref){
    float areah=(4.0f*(negro*1.0f)/ref*1.0f);
    return areah;
  }
}
