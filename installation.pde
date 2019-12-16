import processing.serial.*;
import ddf.minim.*;

Serial myPort;
Minim minim;

AudioPlayer choose;
AudioPlayer long1;
AudioPlayer long2;
AudioPlayer long3;
AudioPlayer play1;
AudioPlayer playSlow;
AudioPlayer playSlower;
AudioPlayer short1;
AudioPlayer short2;
AudioPlayer short3;
AudioPlayer startAu;
//AudioPlayer ticktock;

PImage start;
PImage stage1_0;
PImage stage1_1;
PImage stage1_2;
PImage stage2_0;
PImage stage2_1;
PImage stage2_2;
PImage stage3_0;
PImage stage3_1;
PImage stage3_2;
PImage stage4_0;
PImage stage4_1;
PImage stage4_2;
PImage gb;
PImage s1;
PImage s2;
PImage s3;
PImage s4;
PImage back;

PImage end1;
PImage end3;
PImage end4_1;
PImage end4_2;
PImage end5_1;
PImage end5_2;
PImage end6_1;
PImage end6_2;
PImage end7_1;
PImage end7_2;

int stage = 0;
int subStage = 0;
int button;

int choice1 = 0;
int choice2 = 0;
int choice3 = 0;
int choice4 = 0;

void setup() {
  myPort = new Serial(this, Serial.list()[1], 9600); 
   minim = new Minim(this);
  size(960, 540);
  rectMode(CENTER);
  frameRate(5);
  loadEverything();
  
  
}

void draw() {
  
  int myString = readArduino();
    button = myString;
  //print(myString,"\tstage=", stage,"\tsubStage=",subStage,"\t");
  background(200, 100, 100);
  image(back, 0, 0);

  if (stage == 0) { ////////       stage 0
  startAu.play();
    println("start");
    image(start, 0, 0);
    if (myString == 2) {
      startAu.pause();
      startAu.rewind();
 buttonAudio();
   stageAudio();
      println("choice start-next");
      stage ++;
      subStage = 0;
    } else {
      println("preess button 2");
    }
  } else if (stage == 1) {/////////////////stage 1
   image(s1, 100, 0);
    if (myString == 1) {
       buttonAudio();
      println("choice 1-1");
      subStage = 1;
      choice1 = 1;
    } else if (myString == 3) {
       buttonAudio();
      println("choice 1-2");
      subStage = 2;
      choice1 = 2;
    }
    //else if (myString == 2) {
    //  println("choice 1-next");
    //  stage++;
    //  subStage = 0;
    //}
    if (subStage == 0) {     //sub1-0
      println("displaying stage 1, subStage 0");
      image(stage1_0, 0, 0);
    } else if (subStage == 1) { //  btn 1
      if (myString == 2) {
         buttonAudio();;
        stage++;
        subStage = 0;
      } else {
        println("displaying stage 1, subStage 1");
        image(stage1_1, 0, 0);
        image(gb, 0, 0);
      }
    } else if (subStage == 2) { // btn 3
      if (myString == 2) {
         buttonAudio();
        stage++;
        subStage = 0;
      } else {
        println("displaying stage 1, subStage 2");
        image(stage1_2, 0, 0);
        image(gb, 0, 0);
        delay(1000);
      }
    } 
  } 
  
  else if (stage == 2) {//stage 2
    image(s2, 0, 0);
    if (myString == 1) {
       buttonAudio();
      println("choice 2-1");
      subStage = 1;
      choice2 = 1;
    } else if (myString == 3) {
       buttonAudio();
      println("choice 2-2");
      subStage = 2;
      choice2 = 2;
    }

    if (subStage == 0) { 
      println("displaying stage 1, subStage 0");
      image(stage2_0, 0, 0);
    } else if (subStage == 1) { //  btn 1
      if (myString == 2) {
         buttonAudio();
        stage++;
        subStage = 0;
      } else {
        println("displaying stage 1, subStage 1");
        image(stage2_1, 0, 0);
        image(gb, 0, 0);
      }
    } else if (subStage == 2) { // btn 3
      if (myString == 2) {
         buttonAudio();
        stage++;
        subStage = 0;
      } else {
        println("displaying stage 1, subStage 2");
        image(stage2_2, 0, 0);
        image(gb, 0, 0);
        delay(1000);
      }
    } 
  } 
  else if (stage == 3) {//stage 3
    image(s3, 100, 0);
    if (myString == 1) {
       buttonAudio();
      println("choice 3-1");
      subStage = 1;
      choice3 = 1;
    } else if (myString == 3) {
       buttonAudio();
      println("choice 3-2");
      subStage = 2;
      choice3 = 2;
    }

    if (subStage == 0) {    
      println("displaying stage 3, subStage 0");
      image(stage3_0, 0, 0);
    } else if (subStage == 1) { //  btn 1
      if (myString == 2) {
        
         buttonAudio();
        stage++;
        subStage = 0;
      } else {
        println("displaying stage 3, subStage 1");
        image(stage3_2, 0, 0);
        image(gb, 0, 0);
      }
    } else if (subStage == 2) { // btn 3
      if (myString == 2) {
         buttonAudio();
        stage++;
        subStage = 0;
      } else {
        println("displaying stage 3, subStage 2");
        image(stage3_1, 0, 0);
        image(gb, 0, 0);
      }
    } 
  
  } 
  else if (stage == 4) {//stage 4;
    image(s4, 100, 0);
    if (myString == 1) {
       buttonAudio();
      println("choice 4-1");
      subStage = 1;
      choice4 = 1;
    } else if (myString == 3) {
       buttonAudio();
      println("choice 4-2");
      subStage = 2;
      choice4 = 2;
    }

    if (subStage == 0) {    
      println("displaying stage 4, subStage 0");
      image(stage4_2, 0, 0);
      image(stage4_0, 0, 0);
      
    } else if (subStage == 1) { //  btn 1
      if (myString == 2) {
         buttonAudio();
          play1.pause();
         slowAudio();
        stage++;
        subStage = 0;
      } else {
        println("displaying stage 4, subStage 1");
        image(stage4_1, 0, 0);
        image(gb, 0, 0);
      }
    } else if (subStage == 2) { // btn 3
      if (myString == 2) {
         buttonAudio();
         slowAudio();
        stage++;
        subStage = 0;
      } else {
        println("displaying stage 4, subStage 2");
        image(back, 0, 0);
        image(stage4_0, 0, 0);
        image(gb, 0, 0);
        delay(1000);
      }
    } 
  } 
  
  
  
  else if (stage == 5) { //////////////////////////////last stage
    println("choice end of the game\npress button 2");
      image(end1,0,0,width,height);
    if (myString == 2) {
       buttonAudio();
       short1();
      subStage++;
      //subStage = 0;
    }
  
  else if(subStage == 1){
    if (myString == 2) {
       buttonAudio();
       short1();
      subStage++;
     }else{
      image(end3,0,0);  
      image(gb,0,0);
     }
 }//substage1
   else if(subStage == 2){
    if (myString == 2) {
       buttonAudio();
       short1();
      subStage++;
     }else if(choice1 == 1){
      image(end4_1,0,0); 
      image(gb,0,0);
     }
     else if(choice1 == 2){
      image(end4_2,0,0);
      image(gb,0,0);
     }
 }//substage2
    else if(subStage == 3){
    if (myString == 2) {
       buttonAudio();
       short2();
      subStage++;
     }else if(choice2 == 1){
      image(end5_1,0,0); 
      image(gb,0,0);
     }
     else if(choice2 == 2){
      image(end5_2,0,0); 
      image(gb,0,0);
     }
 }//substage3
     else if(subStage == 4){
    if (myString == 2) {
       buttonAudio();
       short3();
      subStage++;
     }else if(choice2 == 1){
      image(end6_1,0,0);
      image(gb,0,0);
     }
     else if(choice2 == 2){
      image(end6_2,0,0); 
      image(gb,0,0);
     }
 }//substage4
      else if(subStage == 5){
      if (myString == 2) {
       buttonAudio();
       short2();
       subStage ++;
    }
        else if(choice2 == 1){
      image(end7_1,0,0);
      image(gb,0,0);

     }
     else if(choice2 == 2){
      image(end7_2,0,0); 
      image(gb,0,0);
     }
 }//substage5
 else if(subStage ==6){
         stage = 0;
      subStage = 0;
      playSlow.pause();
 }
  } //stage ==5
  
}//draw
int readArduino() {
  int result = 0;
  if (myPort.available() > 0) {
    String serialIn = myPort.readStringUntil(10);
    //println(serialIn);
    if (serialIn != null) {
      serialIn = trim(serialIn);
      result = int(serialIn);
      //println("int value:", myString);
    }
  }
  return result;
}

void loadEverything() {

  start = loadImage("start-ground.png");
  stage1_0 = loadImage("scene1-choise.png");
  stage1_1 = loadImage("scene1-result1.png");
  stage1_2 = loadImage("scene1-result2.png");
  stage2_0 = loadImage("scene2-choise.png");
  stage2_1 = loadImage("scene2-result1.png");
  stage2_2 = loadImage("scene2-result2.png");
  stage3_0 = loadImage("scene3-choise.png");
  stage3_1 = loadImage("scene3-result1.png");
  stage3_2 = loadImage("scene3-result2.png");
  stage4_0 = loadImage("scene4-choise.png");
  stage4_1 = loadImage("scene4-result1.png");
  stage4_2 = loadImage("scene4-result2.png");
  
gb = loadImage("greenbutton.png");
s1 = loadImage("scene1-sunban.png");
s2 = loadImage("scene2-sunban.png");
s3 = loadImage("scene3-sunban.png");
s4 = loadImage("scene4-sunban.png");
back = loadImage("background.png");

end1 = loadImage("end1.png");
end3 = loadImage("end3.png");
end4_1 = loadImage("end4-result1.png");
end4_2 = loadImage("end4-result2.png");
end5_1 = loadImage("end5-result1.png");
end5_2 = loadImage("end5-result2.png");
end6_1 = loadImage("end6-result1.png");
end6_2 = loadImage("end6-result2.png");
end7_1 = loadImage("end7-result1.png");
end7_2 = loadImage("end7-result2.png");

choose = minim.loadFile("choose.mp3");
long1 = minim.loadFile("long1.wav");
long2 = minim.loadFile("long2.wav");
long3 = minim.loadFile("long3.wav");
playSlow = minim.loadFile("play_slow.mp3");
playSlower = minim.loadFile("play_slower.mp3");
play1 = minim.loadFile("play1.mp3");
short1 = minim.loadFile("short1.wav");
short2 = minim.loadFile("short2.wav");
short3 = minim.loadFile("short3.wav");
startAu =  minim.loadFile("start.mp3");
//ticktock =  minim.loadFile("ticktock.wav");

}

void buttonAudio(){

    choose.rewind();
    choose.play();

}

void stageAudio(){
  play1.rewind();
  play1.play();
}

void slowAudio(){
  playSlow.rewind();
  playSlow.play();
}

void short1(){
  short1.rewind();
  short1.play();
}

void short2(){
  short2.rewind();
  short2.play();
}

void short3(){
  short3.rewind();
  short3.play();
}
