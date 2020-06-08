class FigureSquare extends Figure {
  FigureSquare(float xpos, float ypos, float tempAngle, float tempD, float tempSpeed, color tempC1,  boolean tempSelected, boolean tempSelected2){
    super(xpos, ypos, tempAngle, tempD, tempSpeed, tempC1, tempSelected, tempSelected2);
  }
  @Override void drawfigure(){
    float x1 = -d;
    float y1 = -d;
    float x2 = 2*d;
    float y2 = 2*d;
    rect(x1, y1, x2, y2);
  }
}
