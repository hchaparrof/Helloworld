class FigureSquare extends Figure {
  FigureSquare(float xpos, float ypos, float tempAngle, float tempD, float tempSpeed, color tempC1, color tempC2, boolean seleccionado){
    super(xpos, ypos, tempAngle, tempD, tempSpeed, tempC1, tempC2, seleccionado);
  }
  void display (){
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
}
