PImage imgUser1;  // Declare variable "a" of type PImage
PImage imgUser2;
PImage imgUser3;
import processing.serial.*;

Serial myPort;  // The serial port


void setup() {
  size(1024, 768);
  // The image file must be in the data folder of the current sketch 
  // to load successfully
  imgUser1 = loadImage("user1.png");  // Load the image into the program  
  imgUser2 = loadImage("user2.jpg");
  imgUser3 = loadImage("user3.jpg");
  
  printArray(Serial.list());
  // Open the port you are using at the rate you want:
  myPort = new Serial(this, Serial.list()[3], 115200);
}

void draw() {
  // Displays the image at its actual size at point (0,0)
  //image(imgUser1, 300, 0);
  // Displays the image at point (0, height/2) at half of its size
  //image(img, 0, height/2, img.width/2, img.height/2);
  //image(imgUser2, 300, 100);
  //image(imgUser3, 300, 200);
  
  
  while (myPort.available() > 0) {
      String inBuffer = myPort.readString();   
          if (inBuffer != null) {
            
            if(inBuffer.contains("user1")){
              clear();
              image(imgUser1, 300, 0);
              textSize(30);
              text("user1", 380, 450);
              text("Score : 1000", 380, 500);
              text("Welcom to Stadium!!!", 350, 550);
              
            }
            else if(inBuffer.contains("user2")){
              clear();
              image(imgUser3, 400, 100);
              textSize(30);
              text("user2", 380, 450);
              text("Score : 2000", 380, 500);
              text("Welcom to Stadium!!!", 350, 550);              
            }
            else {
              
              println(inBuffer);
            }
          }
  }
  
}
