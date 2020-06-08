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
