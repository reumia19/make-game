import processing.serial.*;

Serial myPort;
int myString = 0;

void setup(){
  myPort = new Serial(this,Serial.list()[1],9600); 
  
}

void draw(){
	readArduino();
}

void readArduino(){
	  if(myPort.available() > 0){
    myString = myPort.read();
    println(myString);
}