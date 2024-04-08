
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

KString s;

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
  fill(204, 102, 0, 100);
  rect(0, 0, myWidth, myHeight-100);

}

void script(){

//   s.display();

   step1(); 
   step2();
   step3();
   step4();
   step5();
}

void step1(){
  if (step == 1){
    if (time < 3) {
      ball1.update();
      ball2.update();
  
      ball1.checkEdges();
      ball2.checkEdges();
 
      ball1.checkCollision(ball2);

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
    if (mouseClick == 0) {
      ball1.update();
      ball2.update();
  
      ball1.checkEdges();
      ball2.checkEdges();
 
      ball1.checkCollision(ball2);
  
      ball1.display();
      ball2.display();
      
      s.display();

    }
    if (mouseClick == 1){
      step = 3;
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

void step3(){
  if (step == 3){
    if(ball1.r < 100){
      ball1.r = ball1.r + 0.5;
      ball2.r = ball2.r - 0.5;
      ball1.update();
      ball2.update();
  
      ball1.checkEdges();
      ball2.checkEdges();
 
      ball1.checkCollision(ball2);
  
      ball1.display();
      ball2.display();
    }
    else{
      step = 4;
      stepTime = time; 
    }
  }
}

void step4(){
  if (step == 4){
    if(time < stepTime + 7){
      ball1.update();
      ball2.update();
  
      ball1.checkEdges();
      ball2.checkEdges();
 
      ball1.checkCollision(ball2);
  
      ball1.display();
      ball2.display();
    }
    else{
      step = 5;
      stepTime = time; 
    }
  }
}

void step5(){
  if (step == 5){
    if(alertFlag == 0){
       alert('The keycode is 234');
       alertFlag = 1;
    }
    else{
      step = 5;
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


