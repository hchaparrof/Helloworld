class FigureSquare extends Figure {
  FigureSquare(float xpos, float ypos, float tempAngle, float tempD, float tempSpeed, color tempC1,  boolean tempSelected){
    super(xpos, ypos, tempAngle, tempD, tempSpeed, tempC1, tempSelected);
  }
  @Override void display (){
    float x1 = -d;
    float y1 = -d;
    float x2 = 2*d;
    float y2 = 2*d;
    pushMatrix();
    translate(x, y);
    rotate(angle);
    stroke(c1);
    fill(c1);
    rect(x1, y1, x2, y2);
    popMatrix();
  }
}
