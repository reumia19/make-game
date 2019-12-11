import processing.serial.*;

Serial myPort;

int myString = 0;
int mySize = 50;
int speed = 1;

void setup(){
  myPort = new Serial(this,Serial.list()[1],9600); 
  size(500,300);
  rectMode(CENTER);

}

void draw(){
  readArduino();
  background(200,100,100);
  drawPlayer();
  drawGround(); 
}

void readArduino(){
    if(myPort.available() > 0){
    myString = myPort.read();
    println(myString);
}
}

void drawPlayer(){
    rectMode(CENTER);
    noStroke();
    fill(255);
rect(width/2,225,mySize/2,mySize);

}

void drawGround(){
    rectMode(CENTER);
    noStroke();
    fill(220,150,150);
rect(width/2,275,width,mySize);

}
