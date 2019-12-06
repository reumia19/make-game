import processing.serial.*;

Serial myPort;

int myString = 0;
int xSize = 500;
int ySize = 300;
int mySize = 50;

void setup(){
  myPort = new Serial(this,Serial.list()[1],9600); 
  size(xSize,ySize);

}

void draw(){
	readArduino();
	background();
	drawPlayer();
}

void readArduino(){
	  if(myPort.available() > 0){
    myString = myPort.read();
    println(myString);
}

void drawPlayer(){
rect(xSize/2,ySize -100,mySize,mySize);

}