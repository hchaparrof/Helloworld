class Imagen{
  PImage hoja;
  Imagen(PImage tempHoja){
    hoja = tempHoja;
  }
  void displai(){
    float s=0;
    float w=displayWidth-320;
    float h=displayHeight-160;
    if((w/hoja.width)<(h/hoja.height)){
      s=(w/hoja.width);   
    }else{
      s=(h/hoja.height);
    }
    //System.out.println(s);
    pushMatrix();
    scale(s);
    imageMode(CENTER);
    image(hoja, hoja.width/(s*10) , hoja.height/(s*10));
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
}
