import processing.serial.*;

Serial myPort;
String myString =null;

void setup(){
  myPort = new Serial(this,"COM3",9600); 
  
}

void draw(){
  if(myPort.available() > 0){
    myString = myPort.readStringUntil('.');
    println(myString);
  }
  
  
}