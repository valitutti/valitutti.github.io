float fiboX=1;

float fps = 50;
float time;
float stepTime = 0;

//int myWidth = 700;
int myWidth = 600;
int myHeight = 480;

float x;

Ball ball1;
Ball ball2;

int step = 1;

int mouseClick = 0;

KString s1, s2, s3, s4, s5, sBig, sBlack;

alertFlag = 0;


void setup(){
 
//  size(window.innerWidth, window.innerHeight);
  size(myWidth, myHeight);
  
//  background(255);
 
  time = 0;
  
  ball1 = new Ball(myWidth/3, myHeight/3, 20, 2.5, 3);
  ball1.red = 255;
  ball1.green = 0;
  ball1.blue = 0;
  ball2 = new Ball(myWidth/2, myHeight/2, 100, -3, -4);
  ball2.red = 0;
  ball2.green = 0;
  ball2.blue = 255;

//  s = new KString("Click on the screeen", 250, 450);
  s1 = new KString("", 0, 0);
  s1.fontSize = 25;
  s2 = new KString("", 0, 0);
  s2.fontSize = 25;

  s3 = new KString("", 0, 0);
  s3.fontSize = 20;
  s4 = new KString("", 0, 0);
  s4.fontSize = 20;
  s5 = new KString("", 0, 0);
  s5.fontSize = 20;

  sBig = new KString("", 0, 0);
  sBig.fontSize = 35;

  sBlack = new KString("", 0, 0);
  sBlack.fontSize = 25;

  sBlack1 = new KString("", 0, 0);
  sBlack1.fontSize = 25;

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
  fill(204, 102, 0, 100);
  rect(0, 0, myWidth, myHeight-100);

}

void script(){
   step1(); 
   step2();
   step3();
   step4();
   step5();
   step6();
//   step7();
   step8();
   step9();
   step10();
   step11();
   step12();
   step13();
   step14();
   step15();
   step16();
}

void step1(){
  if (step == 1){
    if (time - stepTime < 1) {
      ball1.update();
      ball2.update();
  
      ball1.checkEdges();
      ball2.checkEdges();
 
      ball1.checkCollision(ball2);
	  
      ball2.applyAttractiveForce(ball1);

      ball1.display();
      ball2.display();
	  
	  
    }else{
      step = 2;
      stepTime = time; 
    }
  }
}

void step2(){
  if (step == 2){
    if (time - stepTime < 4) {
      ball1.update();
      ball2.update();
  
      ball1.checkEdges();
      ball2.checkEdges();
 
      ball1.checkCollision(ball2);
    
      ball2.applyAttractiveForce(ball1);

      ball1.display();
      ball2.display();
    
        s1.wordColor = "blue";
        s1.content = "“I love you, you small red ball!";
        s1.location.x = 100;
        s1.location.y = 430;
        s1.display();
    
        s2.wordColor = "blue";
        s2.content = "I really love you!”";
        s2.location.x = 170;
        s2.location.y = 470;
        s2.fontSize = 25;
        s2.display();
    
    }else{
      step = 3;
      stepTime = time; 
    }
  }
}

void step3(){
  if (step == 3){
    if (time - stepTime < 2) {
      ball1.update();
      ball2.update();
  
      ball1.checkEdges();
      ball2.checkEdges();
 
      ball1.checkCollision(ball2);
    
      ball2.applyAttractiveForce(ball1);

      ball1.display();
      ball2.display();
    
        s1.wordColor = "blue";
        s1.content = "“Let's get married!”";
        s1.location.x = 150;
        s1.location.y = 450;
        s1.display();
    
    }else{
      step = 4;
      stepTime = time; 
    }
  }
}

void step4(){
  if (step == 4){
    if (time - stepTime < 2) {
      ball1.update();
      ball2.update();
  
      ball1.checkEdges();
      ball2.checkEdges();
 
      ball1.checkCollision(ball2);
    
      ball2.applyAttractiveForce(ball1);

      ball1.display();
      ball2.display();
    
      s1.wordColor = "red";
      s1.content = "“Leave me alone, you big blue ball!”";
      s1.location.x = 80;
      s1.location.y = 450;
      s1.display();
    
    
    }else{
      step = 5;
      stepTime = time; 
    }
  }
}

void step5(){
  if (step == 5){
    if (time - stepTime < 2) {
      ball1.update();
      ball2.update();
  
      ball1.checkEdges();
      ball2.checkEdges();
 
      ball1.checkCollision(ball2);
    
      ball2.applyAttractiveForce(ball1);

      ball1.display();
      ball2.display();
    
      s1.wordColor = "red";
      s1.content = "“I don't love you!”";
      s1.location.x = 150;
      s1.location.y = 450;
      s1.display();
    
    
    }else{
      step = 6;
      stepTime = time; 
    }
  }
}

void step6(){
  if (step == 6){
    if (time - stepTime < 2) {
      ball1.update();
      ball2.update();
  
      ball1.checkEdges();
      ball2.checkEdges();
 
      ball1.checkCollision(ball2);
    
      ball2.applyAttractiveForce(ball1);

      ball1.display();
      ball2.display();
    
      sBig.wordColor = "red";
      sBig.content = "“Go away!!!”";
      sBig.location.x = 160;
      sBig.location.y = 450;
      sBig.display();
    
    
    }else{
      step = 8;
      stepTime = time; 
    }
  }
}

/*
void step7(){
  if (step == 7){
    if (mouseClick == 0) {
      ball1.update();
      ball2.update();
  
      ball1.checkEdges();
      ball2.checkEdges();
 
      ball1.checkCollision(ball2);
  
      ball1.display();
      ball2.display();
      
      sBlack.content = "Click on the screen for a happy ending";
      sBlack.location.x = 60;
      sBlack.location.y = 450;
      sBlack.display();

    }
    if (mouseClick == 1){
      step = 8;
      stepTime = time; 
      mouseClick = 0;
    }
  }
}

void mouseClicked(){
  if(mouseClick == 0){
      mouseClick = 1; 
  }
}
*/

void step8(){
  if (step == 8){
    if(ball2.r > 15){
      ball1.r = ball1.r + 0.7;
      ball1.m = ball1.r * 0.1;
    ball1.velocity.x = ball1.velocity.x/1.02;
    ball1.velocity.y = ball1.velocity.y/1.02;
    ball2.velocity.x = ball2.velocity.x/1.02;
    ball2.velocity.y = ball2.velocity.y/1.02;
      ball2.r = ball2.r - 0.5;
      ball2.m = ball2.r * 0.1;
      ball1.update();
      ball2.update();
  
      ball1.checkEdges();
      ball2.checkEdges();
 
      ball1.checkCollision(ball2);
  
      ball1.display();
      ball2.display();
      
     
        sBlack1.content = "Some time passed and...they then got married!";
        sBlack1.location.x = 10;
        sBlack1.location.y = 450;
        sBlack1.display();
        
    }
    else{
      step = 9;
      stepTime = time; 
    }
  }
}

void step9(){
  if (step == 9){
    if(time - stepTime < 2){
      ball1.update();
      ball2.update();
  
      ball1.checkEdges();
      ball2.checkEdges();
 
      ball1.checkCollision(ball2);
    
      ball1.applyAttractiveForce(ball2);
  
      ball1.display();
      ball2.display();
      
      s1.wordColor = "red";
      s1.content = "“Oh, sweetheart. Come here.”";
      s1.location.x = 100;
      s1.location.y = 450;
      s1.display();
      
    }
    else{
      step = 10;
      stepTime = time; 
    }
  }
}

void step10(){
  if (step == 10){
    if(time - stepTime < 3){
      ball1.update();
      ball2.update();
  
      ball1.checkEdges();
      ball2.checkEdges();
 
      ball1.checkCollision(ball2);
    
      ball1.applyAttractiveForce(ball2);
  
      ball1.display();
      ball2.display();
      
      s1.wordColor = "blue";
      s1.content = "“I want to get some sleep.”";
      s1.location.x = 100;
      s1.location.y = 450;
      s1.display();
      
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
      ball1.update();
      ball2.update();
  
      ball1.checkEdges();
      ball2.checkEdges();
 
      ball1.checkCollision(ball2);
    
      ball1.applyAttractiveForce(ball2);
  
      ball1.display();
      ball2.display();
      
      s1.wordColor = "red";
      s1.content = "“You can sleep anytime.”";
      s1.location.x = 100;
      s1.location.y = 450;
      s1.display();
      
    }
    else{
      step = 12;
      stepTime = time; 
    }
  }
}

void step12(){
  if (step == 12){
    if(time - stepTime < 1.7){
      ball1.update();
      ball2.update();
  
      ball1.checkEdges();
      ball2.checkEdges();
 
      ball1.checkCollision(ball2);
    
      ball1.applyAttractiveForce(ball2);
  
      ball1.display();
      ball2.display();
      
      s1.wordColor = "blue";
      s1.content = "“Not now. I'm washing my hair.”";
      s1.location.x = 100;
      s1.location.y = 450;
      s1.display();
      
    }
    else{
      step = 13;
      stepTime = time; 
    }
  }
}

void step13(){
  if (step == 13){
    if(time - stepTime < 1.5){
      ball1.update();
      ball2.update();
  
      ball1.checkEdges();
      ball2.checkEdges();
 
      ball1.checkCollision(ball2);
    
      ball1.applyAttractiveForce(ball2);
  
      ball1.display();
      ball2.display();
      
      s1.wordColor = "red";
      s1.content = "“Oh come on darling. I want you now!!!”";
      s1.location.x = 60;
      s1.location.y = 450;
      s1.display();
      
    }
    else{
      step = 14;
      stepTime = time; 
    }
  }
}

void step14(){
  if (step == 14){
    if(time - stepTime < 3){
      ball1.update();
      ball2.update();
  
      ball1.checkEdges();
      ball2.checkEdges();
 
      ball1.checkCollision(ball2);
    
      ball1.applyAttractiveForce(ball2);
  
      ball1.display();
      ball2.display();
      
      s1.wordColor = "blue";
      s1.content = "“No darling. I'm afraid the dog needs walking...”";
      s1.location.x = 10;
      s1.location.y = 450;
      s1.display();
      
    }
    else{
      step = 15;
      stepTime = time; 
    }
  }
}

void step15(){
  if (step == 15){
    if(time - stepTime < 3){
      ball1.update();
      ball2.update();
  
      ball1.checkEdges();
      ball2.checkEdges();
 
      ball1.checkCollision(ball2);
    
      ball1.applyAttractiveForce(ball2);
  
      ball1.display();
      ball2.display();
      
      sBlack.content = "(Home, sweet home...)";
      sBlack.location.x = 130;
      sBlack.location.y = 450;
      sBlack.display();
      
    }
    else{
      step = 16;
      stepTime = time; 
    }
  }
}

void step16(){
  if (step == 16){
    if(alertFlag == 0){
       alert('The keycode is 831');
       alertFlag = 1;
    }
    else{
      step = 17;
      stepTime = time; 
    }
  }
}


//********************************************************

class Ball {

  PVector position;
  PVector velocity;
  float r;
  float m;
  int red;
  int green;
  int blue;

  Ball() {
    position = new PVector(myWidth/2, myHeight/2);
    velocity = new PVector(2.5, 10);
    r = 50;
    m = r * 0.1;
    red = 0;
    green = 0;
    blue = 0;
  }
  
  Ball(float x, float y) {
    position = new PVector(x, y);
    velocity = new PVector(2.5, 10);
    r = 50;
    m = r * 0.1;
    red = 0;
    green = 0;
    blue = 0;
  }
  
  Ball(float x, float y, float vx, float vy) {
    position = new PVector(x, y);
    velocity = new PVector(vx, vy);
    r = 50;
    m = r * 0.1;
    red = 0;
    green = 0;
    blue = 0;
  }
  
  Ball(float x, float y, float r0, float vx, float vy) {
    position = new PVector(x, y);
    velocity = new PVector(vx, vy);
    r = r0;
    m = r * 0.1;
    red = 0;
    green = 0;
    blue = 0;
  }
  
    

  void update() {
    position.add(velocity);
  }


  void checkEdges() {

    if (position.x > myWidth-r) {
      position.x = myWidth-r;
      velocity.x *= -1;
    } 
    else if (position.x < r) {
      position.x = r;
      velocity.x *= -1;
    } 
    else if (position.y > myHeight-100-r) {
      position.y = myHeight-100-r;
      velocity.y *= -1;
    } 
    else if (position.y < r) {
      position.y = r;
      velocity.y *= -1;
    }
    
    

  }


  void checkCollision(Ball other) {

    // get distances between the balls components
    PVector bVect = PVector.sub(other.position, position);

    // calculate magnitude of the vector separating the balls
    float bVectMag = bVect.mag();

	
    if (bVectMag < 20) {
//		println(time);
//		bVect.x = bVect.x * 1.01;
//		bVect.y = bVect.y * 1.01;
//		other.position = PVector.add(position, bVect);

//		other.position.x = position.x + 30;
//		other.position.y = position.y + 30;

		other.position.x = 10;
		other.position.y = 10;
		other.velocity.x = 1;
		other.velocity.y = 1;


		} else

    if (bVectMag < r + other.r) {
      // get angle of bVect
      float theta  = bVect.heading();
      // precalculate trig values
      float sine = sin(theta);
      float cosine = cos(theta);

      /* bTemp will hold rotated ball positions. You 
       just need to worry about bTemp[1] position*/
      PVector[] bTemp = {
        new PVector(), new PVector()
        };

        /* this ball's position is relative to the other
         so you can use the vector between them (bVect) as the 
         reference point in the rotation expressions.
         bTemp[0].position.x and bTemp[0].position.y will initialize
         automatically to 0.0, which is what you want
         since b[1] will rotate around b[0] */
        bTemp[1].x  = cosine * bVect.x + sine * bVect.y;
      bTemp[1].y  = cosine * bVect.y - sine * bVect.x;

      // rotate Temporary velocities
      PVector[] vTemp = {
        new PVector(), new PVector()
        };

        vTemp[0].x  = cosine * velocity.x + sine * velocity.y;
      vTemp[0].y  = cosine * velocity.y - sine * velocity.x;
      vTemp[1].x  = cosine * other.velocity.x + sine * other.velocity.y;
      vTemp[1].y  = cosine * other.velocity.y - sine * other.velocity.x;

      /* Now that velocities are rotated, you can use 1D
       conservation of momentum equations to calculate 
       the final velocity along the x-axis. */
      PVector[] vFinal = {  
        new PVector(), new PVector()
        };

      // final rotated velocity for b[0]
      vFinal[0].x = ((m - other.m) * vTemp[0].x + 2 * other.m * vTemp[1].x) / (m + other.m);
      vFinal[0].y = vTemp[0].y;

      // final rotated velocity for b[0]
      vFinal[1].x = ((other.m - m) * vTemp[1].x + 2 * m * vTemp[0].x) / (m + other.m);
      vFinal[1].y = vTemp[1].y;

      // hack to avoid clumping
      bTemp[0].x += vFinal[0].x;
      bTemp[1].x += vFinal[1].x;

      /* Rotate ball positions and velocities back
       Reverse signs in trig expressions to rotate 
       in the opposite direction */
      // rotate balls
      PVector[] bFinal = { 
        new PVector(), new PVector()
        };

      bFinal[0].x = cosine * bTemp[0].x - sine * bTemp[0].y;
      bFinal[0].y = cosine * bTemp[0].y + sine * bTemp[0].x;
      bFinal[1].x = cosine * bTemp[1].x - sine * bTemp[1].y;
      bFinal[1].y = cosine * bTemp[1].y + sine * bTemp[1].x;

      // update balls to screen position
      other.position.x = position.x + bFinal[1].x;
      other.position.y = position.y + bFinal[1].y;

      position.add(bFinal[0]);

      // update velocities
      velocity.x = cosine * vFinal[0].x - sine * vFinal[0].y;
      velocity.y = cosine * vFinal[0].y + sine * vFinal[0].x;
      other.velocity.x = cosine * vFinal[1].x - sine * vFinal[1].y;
      other.velocity.y = cosine * vFinal[1].y + sine * vFinal[1].x;
    }
  }





void applyAttractiveForce(Ball other) {
  PVector dir = PVector.sub(other.position, position);
  float d = dir.mag();
  if (d > r + other.r) {
	  dir.normalize();
	  float force = 0.5;
	  dir.mult(force);
  	  velocity.add(dir);
  }
  
}




  
    void display() {
    stroke(100);
    strokeWeight(4);
//    fill(0, 127);
    fill(red, green, blue, 127);
    ellipse(position.x, position.y, r*2, r*2);
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


