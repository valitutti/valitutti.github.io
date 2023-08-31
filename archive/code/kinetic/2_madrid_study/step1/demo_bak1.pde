//#########################################################################
//                      PARAMETERS

float fiboX=1;

float fps = 50;
float time;

Object animation;
Object kObject;
Object object;
Object attributes;
String attribute;
float t0, duration;
Object parameters;
String className;

ArrayList kObjects;
ArrayList triple;

KString s;
KLine l;

KString clock;

//#########################################################################
//                      FUNCTIONS
//------------------------------------------------------------------------
//                      setup

void setup(){
  size(window.innerWidth, window.innerHeight);
  
  background(255);
  time = 0;
  
  kObjects = new ArrayList();
  
  for (el : newData){
      triple = new ArrayList();
      kObject = el; 
      object = kObject.object;
      animation = kObject.animation;
      className = object.class;
      triple.add(className);
      triple.add(animation);
 
      if(className == "k-string"){
        attributes = object.attributes;
        String textContent = (String) attributes.text;
        float x, y;

        s = new KString(textContent, 10, 100);  

//        x = (float) window.innerWidth/2 + attributes.x;  
//        s.location.x = x - s.wordWidth/2;   
        s.location.x = attributes.x;   

//        y = (float) window.innerHeight/2 + attributes.y;  
//        s.location.y = y - s.wordHeight/2;   
        s.location.y = attributes.y;   
      
        if(attributes.wordColor != null) {
          s.wordColor = attributes.wordColor;
        }
        if(attributes.wordColorFlag != null) {
          if(attributes.wordColorFlag == "true"){
            s.wordColorFlag = true;            
          } else {
            s.wordColorFlag = false;
          }
        }
        if(attributes.wordRed != null) {
          s.wordRed = attributes.wordRed;
        }
        if(attributes.wordGreen != null) {
          s.wordGreen = attributes.wordGreen;
        }
        if(attributes.wordBlue != null) {
          s.wordBlue = attributes.wordBlue;
        }
        if(attributes.wordAlpha != null) {
          s.wordAlpha = attributes.wordAlpha;
        }
        
//        s.content = animation[2];
        
        triple.add(s);
        kObjects.add(triple);              
      }
      
      else if(className == "k-line"){
        attributes = object.attributes;

        l = new KLine(attributes.x1, attributes.y1, attributes.x2, attributes.y2);  

        l.location1.x = attributes.x1;   
        l.location1.y = attributes.y1;   
        l.location2.x = attributes.x2;   
        l.location2.y = attributes.y2;   

        if(attributes.lineColor != null) {
          l.lineColor = attributes.lineColor;
        }
        if(attributes.lineColorFlag != null) {
          if(attributes.lineColorFlag == "true"){
            l.lineColorFlag = true;            
          } else {
            l.lineColorFlag = false;
          }
        }
        if(attributes.lineRed != null) {
          l.lineRed = attributes.lineRed;
        }
        if(attributes.lineGreen != null) {
          l.lineGreen = attributes.lineGreen;
        }
        if(attributes.lineBlue != null) {
          l.lineBlue = attributes.lineBlue;
        }
        if(attributes.lineAlpha != null) {
          l.lineAlpha = attributes.lineAlpha;
        }
        
        triple.add(l);
        kObjects.add(triple);              
      }
      
      
      clock = new KString(time, 1000, 50); 
      clock.wordColor = "white";
      
  }


}

//------------------------------------------------------------------------
//                      draw

/void draw(){
  
//  background(255);
  background(0);
  smooth();
  frameRate(fps);
  time = frameCount/fps;


  update(kObjects);
  display(kObjects);

//  clock.content = time;
//  clock.display();

}

//------------------------------------------------------------------------
//                      update

void update(ArrayList kObjects){
  for (el : kObjects){
    animation = el.get(1);
    
    if(el.get(0) == "k-string"){
      s = el.get(2);
      s.update(animation);
    }
    
    if(el.get(0) == "k-line"){
      l = el.get(2);
      l.update(animation);
    }
    
  }
}

//------------------------------------------------------------------------
//                      display

/void display(ArrayList kObjects){
  for (el : kObjects){
    if(el.get(0) == "k-string"){
      s = el.get(2);
      s.display();
    } else if(el.get(0) == "k-line"){
      l = el.get(2);
      l.display();
    }
  }
}

//#########################################################################
//                      CLASSES
//*************************************************************************
//                      KString

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
    float wordShearX, wordShearY;

//------------------------------------------------------------------------

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
       wordShearX = 0;
       wordShearY = 0;
    }
    
  //------------------------------------------------------------------------

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
    text(content, location.x, location.y);
    smooth();
  }
  
//------------------------------------------------------------------------

  void update(Object animation) {
    update1(animation, 0.0);
  }

  void update1(Object animation, Float t0) {
    String label = (String) animation[0];
        
    if (label.equals("base")){
         attribute = (String) animation[1];
         label = (String) animation[2];
         duration = (Float) animation[3];
         parameters = (Object) animation[4];
         updateBase(attribute, label, t0, duration, parameters);
    } 
    
    else if (label.equals("add")){
      for (int i = 1; i < animation.length; i = i+1) {
            update1(animation[i], t0);
       }
    }
     
     else if (label.equals("join")){

       for(int i = 1; i < animation.length; i = i+1) {
        if (i == 1) {
            update1(animation[i], t0);          
        } else {
          Float dur = t0;
          for(int j = 1; j < i; j = j+1){
            dur = dur + getDuration(animation[j]);
          }
          update1(animation[i], dur);          
        }
      }



     
    }
   
    else if (label.equals("loop")){
      int n = (Integer) animation[1];
      Object animation1 = animation[2];
      Object animation2 = [];
      animation2[0] = "join";
      for(int i = 1; i <= n; i = i+1) {
        animation2[i] = animation1;        
      }
      update1(animation2, 0.0);     
    }


  }

//------------------------------------------------------------------------

ArrayList<Float> updateBase(String attribute, String label, float t0, float duration, 
      Object parameters) {

      Object outlist;
    
    if (label.equals("linear")) {

      float amount = (float) parameters.amount;
      
      outlist = updateLinear(attribute, t0, duration, amount);
    }

    else if (label.equals("linear-range")) {
      float init = (float) parameters.init;
      float end = (float) parameters.end;
      outlist = updateLinearRange(attribute, t0, duration, init, end);
    }

      return outlist;
}

//------------------------------------------------------------------------

ArrayList<Float> updateLinear(String attribute, float t0, float duration, float amount) {

  ArrayList<Float> outlist = new ArrayList<Float>();
  float initial = 0;
  float outvalue = 0;
  

  if(attribute.equals("x")){
    initial = location.x;
    if((time >= t0) && (time <= t0 + duration)) {
      outvalue = initial + amount; 
      location.x = outvalue;
    }
  }

  else if(attribute.equals("y")){
    initial = location.y;
    if((time >= t0) && (time <= t0 + duration)) {
      outvalue = initial + amount; 
      location.y = outvalue;
    }
  }

  else if(attribute.equals("wordRed")){
    initial = wordRed;
    if((time >= t0) && (time <= t0 + duration)) {
      outvalue = initial + amount; 
      wordRed = outvalue;
    }
  }

  else if(attribute.equals("wordGreen")){
    initial = wordGreen;
    if((time >= t0) && (time <= t0 + duration)) {
      outvalue = initial + amount; 
      wordGreen = outvalue;
    }
  }

  else if(attribute.equals("wordBlue")){
    initial = wordBlue;
    if((time >= t0) && (time <= t0 + duration)) {
      outvalue = initial + amount; 
      wordBlue = outvalue;
    }
  }

  else if(attribute.equals("wordAlpha")){
    initial = wordAlpha;
    if((time >= t0) && (time <= t0 + duration)) {
      outvalue = initial + amount; 
      wordAlpha = outvalue;
    }

  }

  outlist.add(outvalue);
  outlist.add(t0);
  outlist.add(duration);
  
  return outlist;
}

//------------------------------------------------------------------------

ArrayList<Float> updateLinearRange(String attribute, float t0, float duration, 
                                  float init, float end) {

  ArrayList<Float> outlist = new ArrayList<Float>();
  float initial = 0;
  float outvalue = 0;
  float variation = 0;

  variation = end - init;
  if((time >= t0) && (time <= t0 + duration)) {
    increment = initial + (variation/duration)*(time - t0);
    outvalue = init + increment; 

    if(attribute.equals("x")){
      location.x = outvalue;
    }

    else if(attribute.equals("y")){
      location.y = outvalue;
    }

    else if(attribute.equals("wordRed")){
      wordRed = outvalue;
    }

    else if(attribute.equals("wordGreen")){
      wordGreen = outvalue;
    }

    else if(attribute.equals("wordBlue")){
      wordBlue = outvalue;
    }
    
    else if(attribute.equals("wordAlpha")){
      wordAlpha = outvalue;
    }

  }

  outlist.add(outvalue);
  outlist.add(t0);
  outlist.add(duration);
  
  return outlist;
}

//------------------------------------------------------------------------

  Float getDuration(Object animation) {
    Float duration = 0.0;

    String label = (String) animation[0];
        
    if (label.equals("base")){
      duration = (Float) animation[3];
    } 
    
    else if (label.equals("add")){
       ArrayList durList = new ArrayList();
        for(int i = 1; i < animation.length; i = i+1) {
            durList.add(getDuration(animation[i]));
         }
  
        Float maxDur = 0.0;
        for(int i = 0; i < durList.size(); i = i+1){
           Float n = (Float) durList.get(i);
           if(n > maxDur){
              maxDur = n; 
           } 
        }
        



       duration = maxDur;
    }
   
    else if (label.equals("join")){
        ArrayList durList = new ArrayList();
        for(int i = 1; i < animation.length; i++) {
            durList.add(getDuration(animation[i]));
         }
         Float sumDur = 0.0;
         for (Object el : durList){
           Float el1 = (Float) el;
           sumDur = sumDur + el1;
         }
         duration = sumDur;
    }



    return duration;   
  }
  
//-------------------------------------------------------------------------

}

//*************************************************************************
//                      KLine

class KLine {

    PVector location1;
    PVector location2;
    String lineColor;
    int lineRed, lineGreen, lineBlue;
    boolean lineColorFlag;
    float lineAlpha;

//-------------------------------------------------------------------------

    KLine(float newX1, float newY1, float newX2, float newY2){
      
       location1 = new PVector(newX1, newY1);
       location2 = new PVector(newX2, newY2);
       lineColor = "white";
       lineColorFlag = true;
       lineRed = 0;
       lineGreen = 0;
       lineBlue = 0;
       
    }

  //-------------------------------------------------------------------------

  void display(){


    if(lineColorFlag) {
       if(lineColor.equals("black")) {
           lineRed = 0;
           lineGreen = 0;
           lineBlue = 0;
       } else if(lineColor.equals("white")) {
           lineRed = 255;
           lineGreen = 255;
           lineBlue = 255;
       } else if(lineColor.equals("red")) {
           lineRed = 255;
           lineGreen = 0;
           lineBlue = 0;
       } else if(lineColor.equals("green")) {
           lineRed = 0;
           lineGreen = 255;
           lineBlue = 0;
       } else if(lineColor.equals("blue")) {
           lineRed = 0;
           lineGreen = 0;
           lineBlue = 255;
       } else if(lineColor.equals("yellow")) {
           lineRed = 255;
           lineGreen = 255;
           lineBlue = 0;
       } else if(lineColor.equals("purple")) {
           lineRed = 255;
           lineGreen = 0;
           lineBlue = 255;
       } else if(lineColor.equals("orange")) {
           lineRed = 255;
           lineGreen = 165;
           lineBlue = 0;
       } 
    }
    
    
//    stroke(color(250, 250, 250, l.lineAlpha));
    stroke(color(lineRed, lineGreen, lineBlue, l.lineAlpha));
    strokeWeight(3);
    line(l.location1.x, l.location1.y, l.location2.x, l.location2.y);
  }

//-------------------------------------------------------------------------

  void update(Object animation) {
    update1(animation, 0.0);
  }

  void update1(Object animation, Float t0) {
    String label = (String) animation[0];
        
    if (label.equals("base")){
         attribute = (String) animation[1];
         label = (String) animation[2];
         duration = (Float) animation[3];
         parameters = (Object) animation[4];
         updateBase(attribute, label, t0, duration, parameters);
    } 
    
    else if (label.equals("add")){
      for (int i = 1; i < animation.length; i = i+1) {
            update1(animation[i], t0);
       }
    }
     
     else if (label.equals("join")){

       for(int i = 1; i < animation.length; i = i+1) {
        if (i == 1) {
            update1(animation[i], t0);          
        } else {
          Float dur = t0;
          for(int j = 1; j < i; j = j+1){
            dur = dur + getDuration(animation[j]);
          }
          update1(animation[i], dur);          
        }
      }



     
    }
   
    else if (label.equals("loop")){
      int n = (Integer) animation[1];
      Object animation1 = animation[2];
      Object animation2 = [];
      animation2[0] = "join";
      for(int i = 1; i <= n; i = i+1) {
        animation2[i] = animation1;        
      }
      update1(animation2, 0.0);     
    }


  }

//-------------------------------------------------------------------------

ArrayList<Float> updateBase(String attribute, String label, float t0, float duration, 
      Object parameters) {

      Object outlist;
    
    if (label.equals("linear")) {

      float amount = (float) parameters.amount;
      
      outlist = updateLinear(attribute, t0, duration, amount);
    }
    
    else if (label.equals("linear-range")) {
      float init = (float) parameters.init;
      float end = (float) parameters.end;
      outlist = updateLinearRange(attribute, t0, duration, init, end);
    }

      return outlist;
}

//-------------------------------------------------------------------------

ArrayList<Float> updateLinear(String attribute, float t0, float duration, float amount) {

  ArrayList<Float> outlist = new ArrayList<Float>();
  float initial = 0;
  float outvalue = 0;
  

  if(attribute.equals("x1")){
    initial = location1.x;
    if((time >= t0) && (time <= t0 + duration)) {
      outvalue = initial + amount; 
      location1.x = outvalue;
    }
  }

  else if(attribute.equals("y1")){
    initial = location1.y;
    if((time >= t0) && (time <= t0 + duration)) {
      outvalue = initial + amount; 
      location1.y = outvalue;
    }
  }

  else if(attribute.equals("x2")){
    initial = location2.x;
    if((time >= t0) && (time <= t0 + duration)) {
      outvalue = initial + amount; 
      location2.x = outvalue;
    }
  }

  else if(attribute.equals("y2")){
    initial = location2.y;
    if((time >= t0) && (time <= t0 + duration)) {
      outvalue = initial + amount; 
      location2.y = outvalue;
    }
  }

  else if(attribute.equals("lineRed")){
    initial = lineRed;
    if((time >= t0) && (time <= t0 + duration)) {
      outvalue = initial + amount; 
      lineRed = outvalue;
    }
  }

  else if(attribute.equals("lineGreen")){
    initial = lineGreen;
    if((time >= t0) && (time <= t0 + duration)) {
      outvalue = initial + amount; 
      lineGreen = outvalue;
    }
  }

  else if(attribute.equals("lineBlue")){
    initial = lineBlue;
    if((time >= t0) && (time <= t0 + duration)) {
      outvalue = initial + amount; 
      lineBlue = outvalue;
    }
  }

  else if(attribute.equals("lineAlpha")){
    initial = lineAlpha;
    if((time >= t0) && (time <= t0 + duration)) {
      outvalue = initial + amount; 
      lineAlpha = outvalue;
    }
  }

  outlist.add(outvalue);
  outlist.add(t0);
  outlist.add(duration);
  
  return outlist;
}

//-------------------------------------------------------------------------

ArrayList<Float> updateLinearRange(String attribute, float t0, float duration, 
                                  float init, float end) {

  ArrayList<Float> outlist = new ArrayList<Float>();
  float initial = 0;
  float outvalue = 0;
  float variation = 0;

  variation = end - init;
  if((time >= t0) && (time <= t0 + duration)) {
    increment = initial + (variation/duration)*(time - t0);
    outvalue = init + increment; 

    if(attribute.equals("x1")){
      location1.x = outvalue;
    }

    if(attribute.equals("x2")){
      location2.x = outvalue;
    }

    else if(attribute.equals("y1")){
      location1.y = outvalue;
    }

    else if(attribute.equals("y2")){
      location2.y = outvalue;
    }

    else if(attribute.equals("lineRed")){
      lineRed = outvalue;
    }

    else if(attribute.equals("lineGreen")){
      lineGreen = outvalue;
    }

    else if(attribute.equals("lineBlue")){
      lineBlue = outvalue;
    }
    
    else if(attribute.equals("lineAlpha")){
      lineAlpha = outvalue;
    }

  }

  outlist.add(outvalue);
  outlist.add(t0);
  outlist.add(duration);
  
  return outlist;
}

//-------------------------------------------------------------------------

  Float getDuration(Object animation) {
    Float duration = 0.0;

    String label = (String) animation[0];
        
    if (label.equals("base")){
      duration = (Float) animation[3];
    } 
    
    else if (label.equals("add")){
       ArrayList durList = new ArrayList();
        for(int i = 1; i < animation.length; i = i+1) {
            durList.add(getDuration(animation[i]));
         }
  
        Float maxDur = 0.0;
        for(int i = 0; i < durList.size(); i = i+1){
           Float n = (Float) durList.get(i);
           if(n > maxDur){
              maxDur = n; 
           } 
        }
        



       duration = maxDur;
    }
   
    else if (label.equals("join")){
        ArrayList durList = new ArrayList();
        for(int i = 1; i < animation.length; i++) {
            durList.add(getDuration(animation[i]));
         }
         Float sumDur = 0.0;
         for (Object el : durList){
           Float el1 = (Float) el;
           sumDur = sumDur + el1;
         }
         duration = sumDur;
    }



    return duration;   
  }

//-------------------------------------------------------------------------

}
