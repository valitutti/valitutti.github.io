float fps = 50;
float time;
float stepTime = 0;

int myWidth = 600;
int myHeight = 480;


int step = 1;

int mouseClick = 0;

KString s;
MyRect r;

alertFlag = 0;


int myWidth = 600;
int myHeight = 480;

float xDefault = 0;
float yDefault = 0;


void setup(){
//  size(myWidth, myHeight);

//  size(window.innerWidth, window.innerHeight);
  size(myWidth, myHeight);
  
//  background(255);
 
 
  time = 0;
  
  r = new MyRect(-50, myHeight-100-50, 50, 50);
//  r.red = 10;
//  r.green = 10;
//  r.blue = 100;
  r.red = 220;
  r.green = 0;
  r.blue = 220;
  
  s = new KString("Click on the screeen", 250, 450);


}

void draw(){
  initializeDraw();
  script();
}

void initializeDraw(){
  //  background(255);
  background(240);
//  background(0);

  smooth();
  frameRate(fps);
  time = frameCount/fps;

  noStroke();
  fill(204, 102, 0, 80);
  rect(0, 0, myWidth, myHeight-100);
}

void script(){
   step1(); 
   step2();
   step3();
   step4();
   step5();
   step6();
   step7();
   step8();
   step9();
   step10();
   step11();
   step12();
   step13();
   step14();
   step15();
   step16();
   step17();
   step18();
   step19();
   step20();
   step21();
   step22();
   step23();
   step24();
   
}

void step1(){
  if (step == 1){
    if (time < 1) {
      r.display();
    }else{
      step = 2;
      stepTime = time; 
    }
  }
}

void step2(){
  if (step == 2){
    if(time - stepTime < 0.7){
      r.location.x = r.location.x + 2;
      r.display();
    }
    else{
      step = 3;
      stepTime = time; 
    }
  }
}

void step3(){
  if (step == 3){
    if(time - stepTime < 2){
      r.display();
    }
    else{
      step = 4;
      stepTime = time; 
      xDefault = r.location.x;
      yDefault = r.location.y;
    }
  }
}

void step4(){
  if (step == 4){
    if(time - stepTime < 2){
      r.location.x = xDefault + random(2);
      r.location.y = yDefault + random(2);
      r.display();
    }
    else{
      step = 5;
      stepTime = time; 
    }
  }
}

void step5(){
  if (step == 5){
    if(time - stepTime < 1){
      r.location.x = r.location.x - 4;
      r.display();
    }
    else{
      step = 6;
      stepTime = time; 
      r.location.x = -50;
    }
  }
}

void step6(){
  if (step == 6){
    if(time - stepTime < 1){
      r.display();
    }
    else{
      step = 7;
      stepTime = time; 
    }
  }
}

void step7(){
  if (step == 7){
    if(time - stepTime < 2){
      r.location.x = r.location.x + 0.3;
      r.display();
    }
    else{
      step = 8;
      stepTime = time; 
    }
  }
}

void step8(){
  if (step == 8){
    if(time - stepTime < 2){
      r.display();
    }
    else{
      step = 9;
      stepTime = time; 
    }
  }
}

void step9(){
  if (step == 9){
    if(time - stepTime < 0.5){
      r.location.x = r.location.x + 2;
      r.display();
    }
    else{
      step = 10;
      stepTime = time; 
    }
  }
}

void step10(){
  if (step == 10){
    if(time - stepTime < 2){
      r.display();
    }
    else{
      step = 11;
      stepTime = time; 
    }
  }
}

void step11(){
  if (step == 11){
    if(time - stepTime < 2){
      r.rWidth = r.rWidth + 0.5;
      r.rHeight = r.rHeight + 0.5;
      r.location.y = r.location.y - 0.5;
      r.display();
    }
    else{
      step = 12;
      stepTime = time; 
    }
  }
}

void step12(){
  if (step == 12){
    if(time - stepTime < 1){
      r.display();
    }
    else{
      step = 13;
      stepTime = time; 
    }
  }
}

void step13(){
  if (step == 13){
    if(time - stepTime < 1){
      r.rWidth = r.rWidth - 1.5;
      r.display();
    }
    else{
      step = 14;
      stepTime = time; 
    }
  }
}

void step14(){
  if (step == 14){
    if(time - stepTime < 0.4){
      r.display();
    }
    else{
      step = 15;
      stepTime = time; 
    }
  }
}

void step15(){
  if (step == 15){
    if(time - stepTime < 0.3){
      r.location.x = r.location.x + 17;
      r.display();
    }
    else{
      step = 16;
      stepTime = time; 
    }
  }
}

void step16(){
  if (step == 16){
    if(time - stepTime < 0.1){
      r.rWidth = r.rWidth + 17;
      r.display();
    }
    else{
      step = 17;
      stepTime = time; 
    }
  }
}

void step17(){
  if (step == 17){
    if(time - stepTime < 0.1){
      if(r.rWidth > 100){
        r.rWidth = r.rWidth - 10;
        r.display();
      }
    }
    else{
      step = 18;
      stepTime = time; 
    }
  }
}

void step18(){
  if (step == 18){
    if(time - stepTime < 1){
      r.display();
    }
    else{
      step = 19;
      stepTime = time; 
    }
  }
}

void step19(){
  if (step == 19){
    if(mouseClick == 0){
      r.display();
      s.display();
    }
    if(mouseClick == 1){
      step = 20;
      stepTime = time; 
    }
  }
}

void step20(){
  if (step == 20){
    if(time - stepTime < 0.1){
      r.location.y = r.location.y - 50;
      r.display();
    }
    else{
      step = 21;
      stepTime = time; 
    }
  }
}

void step21(){
  if (step == 21){
    if(r.rHeight > 30){
      r.rHeight = r.rHeight - 20;
      r.display();
    }
    else{
      step = 22;
      stepTime = time; 
    }
  }
}

void step22(){
  if (step == 22){
    if(time - stepTime < 1){
      r.display();
    }
    else{
      step = 23;
      stepTime = time; 
    }
  }
}

void step23(){
  if (step == 23){
    if(r.location.y < myHeight - 125){
      r.location.y = r.location.y + 1;
      r.display();
    }
    else{
      step = 24;
      stepTime = time; 
    }
  }
}

void step24(){
  if (step == 24){
    if(alertFlag == 0){
       alert('The keycode is 235');
       alertFlag = 1;
    }
    else{
      step = 25;
      stepTime = time; 
    }
  }
}



void mouseClicked(){
  if(mouseClick == 0){
      mouseClick = 1; 
  }
}

//######################################################

class KString {

    String content;
    PVector location;
    PFont font;
    String fontName;
    int fontSize;
    float wordWidth, wordHeight;
    String wordColor;
    boolean wordColorFlag;
    int wordRed, wordGreen, wordBlue;
    float wordSize;
    float rotation;
    float wordAlpha;
    float wordScaleX, wordScaleY;
    float wordShearX, wordShearY;



    KString(String newText, float newX, float newY){
       content = newText;
       location = new PVector(newX, newY);
       fontName = "Lucida Grande";
//       fontSize = 50;
       fontSize = 35;
       font = createFont("Lucida Grande", fontSize); // OK
       textFont(font);
//       wordColor = "white";
       wordColor = "black";
       wordColorFlag = true;
       wordRed = 0;
       wordGreen = 0;
       wordBlue = 0;
       wordWidth = textWidth(content);
       wordHeight = fontSize;
       rotation = 0;
       wordAlpha = 255;
       wordScaleX = 1;
       wordScaleY = 1;
       wordShearX = 0;
       wordShearY = 0;
    }
    
  
  void display(){
    
    if(wordColorFlag) {
       if(wordColor.equals("black")) {
           wordRed = 0;
           wordGreen = 0;
           wordBlue = 0;
       } else if(wordColor.equals("white")) {
           wordRed = 255;
           wordGreen = 255;
           wordBlue = 255;
       } else if(wordColor.equals("red")) {
           wordRed = 255;
           wordGreen = 0;
           wordBlue = 0;
       } else if(wordColor.equals("green")) {
           wordRed = 0;
           wordGreen = 255;
           wordBlue = 0;
       } else if(wordColor.equals("blue")) {
           wordRed = 0;
           wordGreen = 0;
           wordBlue = 255;
       } else if(wordColor.equals("yellow")) {
           wordRed = 255;
           wordGreen = 255;
           wordBlue = 0;
       } else if(wordColor.equals("purple")) {
           wordRed = 255;
           wordGreen = 0;
           wordBlue = 255;
       } else if(wordColor.equals("orange")) {
           wordRed = 255;
           wordGreen = 165;
           wordBlue = 0;
       }
       
    }
    
    fill(wordRed, wordGreen, wordBlue, wordAlpha);

    textSize(fontSize);
    pushMatrix();
    scale(wordScaleX, wordScaleY);
    text(content, location.x/wordScaleX - wordWidth/2, 
                  location.y/wordScaleY - wordHeight/2);
    smooth();
    popMatrix();
    scale(1, 1);
//    scale(-wordScaleX, -wordScaleY);
  }
  
}

//######################################################

class MyRect {
    PVector location;
    float rWidth, rHeight; 
    int red, green, blue;

    MyRect(float newX, float newY, float newRWidth, float newRHeight){
      location = new PVector(newX, newY);
      rWidth = newRWidth;
      rHeight = newRHeight;
      red =0;
      green = 0;
      blue = 0;
    }

    
    void display(){
      fill(red, green, blue, 255);
      rect(location.x, location.y, rWidth, rHeight);
    }
        
}

