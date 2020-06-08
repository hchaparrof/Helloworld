abstract class Figure {
  float x, y, angle, d, speed;
  color c1;
  boolean selected;
  boolean selected2;
  Figure(float xpos, float ypos, float tempAngle, float tempD, float tempSpeed, color tempC1, boolean tempSelected, boolean tempSelected2) {
    x = xpos;
    y= ypos;
    angle = tempAngle;
    d = tempD;
    speed = tempSpeed;
    c1 = tempC1;
    selected = tempSelected;
    selected2 = tempSelected2;
  }
  void display(){
    pushMatrix();
    translate(x, y);
    rotate(angle);
    stroke(c1);
    fill(c1);
    drawfigure();
    popMatrix();
  }
  abstract void drawfigure(); 
  void cambiarang(int ang) {
    angle+=ang;
  }
  void select_move() {
    boolean overfigure = false;
    color c;
    char guardarfig=0;
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
      }
      if (mouseButton==LEFT && overfigure && !selected && !overfigure2) {
        selected=true;
        overfigure2=true;
        mousePressed=false;
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
    
    if (keyPressed) {
       if (key=='0'){
         figs[0].selected2=true;
       }if (key == '1' || key=='2' || key=='3' || key=='4' || key == '5' || key=='6'){
         figs[0].selected2=false;
       }
       if (key=='1'){
         figs[1].selected2=true;
       }if ( key == '0' || key=='2' || key=='3' || key=='4' || key == '5' || key=='6'){
         figs[1].selected2=false;
       }
       if (key=='2'){
         figs[2].selected2=true;
       }if ( key == '0' || key=='1' || key=='3' || key=='4' || key == '5' || key=='6'){
         figs[2].selected2=false;
       }
       if (key=='3'){
         figs[3].selected2=true;
       }if ( key == '0' || key=='1' || key=='2' || key=='4' || key == '5' || key=='6'){
         figs[3].selected2=false;
       }
       if (key=='4'){
         figs[4].selected2=true;
       }if ( key == '0' || key=='1' || key=='2' || key=='3' || key == '5' || key=='6'){
         figs[4].selected2=false;
       }
       if (key=='5'){
         figs[5].selected2=true;
       }if ( key == '0' || key=='1' || key=='2' || key=='3' || key == '4' || key=='6'){
         figs[5].selected2=false;
       }
       if (key=='6'){
         figs[6].selected2=true;
       }if ( key == '0' || key=='1' || key=='2' || key=='3' || key == '4' || key=='5'){
         figs[6].selected2=false;
       }
    }
    if(selected2){
      if (keyPressed) {
        if (key == 'w' || key == 'W'){ 
          y -= 1 ;
        }
        if (key == 's' || key == 'S'){ 
          y += 1 ;
        }
        if (key == 'd' || key == 'D'){ 
          x += 1 ;
        }
        if (key == 'a' || key == 'A'){ 
          x -= 1 ;
        }
        if (key == 'r' || key == 'R'){ 
          angle += PI/12;
        }
        if (key == 'e' || key == 'E' && figs[0].selected2) {
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
}
