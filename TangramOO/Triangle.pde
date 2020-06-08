class FigureTriangle extends Figure {
  FigureTriangle(float xpos, float ypos, float tempAngle, float tempD, float tempSpeed, color tempC1,  boolean tempSelected, boolean tempSelected2){
    super(xpos, ypos, tempAngle, tempD, tempSpeed, tempC1, tempSelected, tempSelected2);
  }
  @Override void drawfigure(){
    float x1 = -d;
    float y1 = -d/3;
    float x2 = d;
    float y2 = -d/3;
    float x3 = 0;
    float y3 = 2*d/3;
    triangle(x1, y1, x2, y2, x3, y3);
  }
}
