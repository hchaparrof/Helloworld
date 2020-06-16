void setup() {
  BufferedReader reader;
  String line="42";
  int [] ab =new int[2];
  try{
  ab[2]=4/0;
  System.out.println(ab[2]);
  }
  catch(ArrayIndexOutOfBoundsException e){
    System.out.println(e);
  }
  catch(ArithmeticException e){
    System.out.println(e);
  }
  System.out.println("seguimos");
  try {
    reader = createReader("expo.txt");
    line = reader.readLine();
  } 
  catch(IOException e){
    System.out.println(e);
  }
  catch (NullPointerException e) {
    e.printStackTrace();
    System.out.println(e);
    line = null;
  }
  System.out.println(line);
}
void draw() {
}
