import java.io.IOException;
import java.io.FileReader;
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
  try{
            //si el nombre del fichero no existe, lanza el catch
            FileReader fr=new FileReader("casa");
 
            //Esta linea no se ejecuta
            System.out.println("No veras este mensaje");
        }catch(IOException e){
            System.out.println(e);
        }
  System.out.println("seguimos 2");
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
  }
  System.out.println(" seguimos 3 ");
}
void draw() {
}
