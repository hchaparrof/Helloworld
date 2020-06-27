class Imagen{
  PImage hoja;
  Imagen(PImage tempHoja){
    hoja = tempHoja;
  }
  void displai(){
    float s;
    float w=displayWidth-menor*0.3;
    float h=displayHeight-0.2*menor;
    if((w/hoja.width)<(h/hoja.height)){
      s=(w/hoja.width);   
    }else{
      s=(h/hoja.height);
    }
    //System.out.println(s);
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
}
