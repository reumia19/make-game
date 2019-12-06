import processing.serial.*;

Serial myPort;

int myString = 0;
int mySize = 50;

void setup(){
  myPort = new Serial(this,Serial.list()[1],9600); 
  size(500,300);

}

void draw(){
	readArduino();
	background(0);
	drawPlayer();
}

void readArduino(){
	  if(myPort.available() > 0){
    myString = myPort.read();
    println(myString);
}
}

void drawPlayer(){
rect(width,height-100,mySize,mySize);

}