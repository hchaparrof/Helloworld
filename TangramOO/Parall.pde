class FigureParall extends Figure {
  FigureParall(float xpos, float ypos, float tempAngle, float tempD, float tempSpeed, color tempC1, boolean tempSelected, boolean tempSelected2){
    super(xpos, ypos, tempAngle, tempD, tempSpeed, tempC1, tempSelected,tempSelected2);
  }
  @Override void drawfigure() {
    float x1 = -d;
    float y1 = -d;
    float x2 = 3*d;
    float y2 = -d;
    float x3 = d;
    float y3 = d;
    float x4 = -3*d;
    float y4 = d;    
    scale(1,rotparall);
    quad(x1, y1, x2, y2, x3, y3, x4, y4);
  }
}
