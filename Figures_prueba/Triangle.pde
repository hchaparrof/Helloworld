class FigureTriangle extends Figure {
  FigureTriangle(float xpos, float ypos, float tempAngle, float tempD, float tempSpeed, color tempC1,  boolean tempSelected){
    super(xpos, ypos, tempAngle, tempD, tempSpeed, tempC1, tempSelected);
  }
  @Override void display() {
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
    fill(c1);
    triangle(x1, y1, x2, y2, x3, y3);
    popMatrix();
  }
}
