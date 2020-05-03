Figure myTriangle1;
Figure myTriangle2;
Figure myTriangle3;
Figure myTriangle4;
Figure myTriangle5;
Figure mySquare;
Figure myParallelogram;


void setup() {
  size(800,600);
  myTriangle1 = new Figure(135,170,PI,color(51,255,0),color(51,255,0),50,1,1);
  myTriangle2 = new Figure(218,85,PI/2,color(255,0,17),color(255,0,17),50,1,1);
  myTriangle3 = new Figure(202,203,-PI/4,color(0,128,255),color(0,128,255),70,1,1);
  myTriangle4 = new Figure(68,135,-PI/2,color(255,255,0),color(255,255,0),100,1,1);
  myTriangle5 = new Figure(135,69,0,color(191,63,192),color(191,63,192),100,1,1);
  mySquare = new Figure(185,135,PI/4,color(255,51,153),color(255,51,153),35,1,1);
  myParallelogram = new Figure(110,210,0,color(255,128,0),color(255,128,0),25,1,1);
}

void draw() {
  background(0,255,162);
  myTriangle1.Triangle();
  myTriangle2.Triangle();
  myTriangle3.Triangle();
  myTriangle4.Triangle();
  myTriangle5.Triangle();
  mySquare.Square();
  myParallelogram.Parallelogram();
  
  myTriangle1.SelectMove();  
  myTriangle2.SelectMove();
  myTriangle3.SelectMove();
  myTriangle4.SelectMove();
  myTriangle5.SelectMove();
  mySquare.SelectMove();
  myParallelogram.SelectMove();  
}
class Figure {
  float x, y;
  float angle;
  color c1;
  color c2;
  float d;
  float xspeed, yspeed;

  Figure(float tempX, float tempY, float tempAngle, color tempC1, color tempC2, float tempD, float tempXspeed, float tempYspeed){
    x = tempX;
    y = tempY;
    angle= tempAngle;
    c1 = tempC1;
    c2 = tempC2;
    d = tempD;
    xspeed = tempXspeed;
    yspeed = tempYspeed;  
  }

  void Triangle() {
    float x1 = -d;
    float y1 = -d/3;
    float x2 = d;
    float y2 = -d/3;
    float x3 = 0;
    float y3 = 2*d/3;
    pushMatrix();
    translate(x, y);
    rotate(angle);
    stroke(c1);
    fill(c2);
    triangle(x1, y1, x2, y2, x3, y3);
    popMatrix();
  }
  
  void Square() {
    float x1 = -d;
    float y1 = -d;
    float x2 = 2*d;
    float y2 = 2*d;
    pushMatrix();
    translate(x, y);
    rotate(angle);
    stroke(c1);
    fill(c2);
    rect(x1, y1, x2, y2);
    popMatrix();
  }
  
  void Parallelogram() {
    float x1 = -d;
    float y1 = -d;
    float x2 = 3*d;
    float y2 = -d;
    float x3 = d;
    float y3 = d;
    float x4 = -3*d;
    float y4 = d;    
    pushMatrix();
    translate(x, y);
    rotate(angle);
    stroke(c1);
    fill(c2);
    quad(x1, y1, x2, y2, x3, y3, x4, y4);
    popMatrix();
  }
  
  void SelectMove() {
    color c;
    boolean overfigure = false;
    c= get(mouseX, mouseY);
    if ((red(c)==red(c2) && green(c)==green(c2) && blue(c)==blue(c2))){
      overfigure=true;
    } else {
      overfigure = false;
    }
    if(mousePressed){
      if( mouseButton==LEFT && overfigure) {
      x = mouseX;
      y = mouseY;
    }
    if( mouseButton==RIGHT && overfigure) {
      angle +=PI/4;
      mousePressed=false;
    }
  }      
}
}
//void mouseWheel(MouseEvent event) {
  //if (overfigure) {
    //angle += Math.toRadians(45*(event.getCount()));
  //}
//}
