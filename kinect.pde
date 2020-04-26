import org.openkinect.processing.*;
import ddf.minim.*;

Kinect kinect;
Minim minim;
AudioPlayer player1;
AudioPlayer player2;
AudioPlayer player3;
AudioPlayer player4;
AudioPlayer player5;
AudioPlayer player6;
AudioPlayer player7;
AudioPlayer player8;
AudioPlayer player9;
AudioPlayer player10;
AudioPlayer player11;
AudioPlayer player12;

PImage img;

void setup() {
  size(640, 480);
  kinect = new Kinect(this);
  kinect.initDepth();
  //kinect.initDevice();
  img = createImage(kinect.width,kinect.height, RGB);
  
  minim = new Minim(this);
  player1 = minim.loadFile("Nota_1.wav");
  player2 = minim.loadFile("Nota_2.wav");
  player3 = minim.loadFile("Nota_3.wav");
  player4 = minim.loadFile("Nota_4.wav");
  player5 = minim.loadFile("Nota_5.wav");
  player6 = minim.loadFile("Nota_6.wav");
  player7 = minim.loadFile("Nota_7.wav");
  player8 = minim.loadFile("Nota_8.wav");
  player9 = minim.loadFile("Nota_9.wav");
  player10 = minim.loadFile("Nota_10.wav");
  player11 = minim.loadFile("Nota_11.wav");
  player12 = minim.loadFile("Nota_12.wav");
}


void draw() {
  background(0);
  
  // Get the raw depth as array of integers
  int[] depth = kinect.getRawDepth();

  for (int x = 0; x < kinect.width; x++) {
    for (int y = 0; y < kinect.height; y++) {
      int offset = x + y * kinect.width;
      int d = depth[offset];
      
      if (d > 400 && d < 410) {
        img.pixels[offset] = color(128, 0, 0);
        
      } else if (d > 410 && d < 420) {
        img.pixels[offset] = color(200, 0, 0);
        
      } else if (d > 420 && d < 430) {
        img.pixels[offset] = color(255, 0, 0);
        
      } else if (d > 430 && d < 440) {
        img.pixels[offset] = color(255, 128, 0);
        
      } else if (d > 440 && d < 450) {
        img.pixels[offset] = color(255, 191, 0);
        
      } else if (d > 450 && d < 460) {
        img.pixels[offset] = color(255, 255, 0);
        
      } else if (d > 460 && d < 470) {
        img.pixels[offset] = color(191, 255, 0);
        
      } else if (d > 470 && d < 480) {
        img.pixels[offset] = color(0, 255, 0);
        
      } else if (d > 480 && d < 490) {
        img.pixels[offset] = color(0, 255, 128);
        
      } else if (d > 490 && d < 500) {
        img.pixels[offset] = color(0, 255, 255);
        
      } else if (d > 500 && d < 510) {
        img.pixels[offset] = color(0, 128, 255);
        
      } else if (d > 510 && d < 520) {
        img.pixels[offset] = color(0, 0, 255);
        
      } else {
        img.pixels[offset] = color(0, 0, 0);
      }
    }
  }
  
  img.updatePixels();
  image(img, 0, 0);
  img.loadPixels();
  
  int P1 = 0; //variable per guardar pixels (128, 0, 0)
  int P2 = 0; //variable per guardar pixels (200, 0, 0)
  int P3 = 0; //variable per guardar pixels (255, 0, 0)
  int P4 = 0; //variable per guardar pixels (255, 128, 0)
  int P5 = 0; //variable per guardar pixels (255, 191, 0)
  int P6 = 0; //variable per guardar pixels (255, 255, 0)
  int P7 = 0; //variable per guardar pixels (191, 255, 0)
  int P8 = 0; //variable per guardar pixels (0, 255, 0)
  int P9 = 0; //variable per guardar pixels (0, 255, 128)
  int P10 = 0; //variable per guardar pixels (0, 255, 255)
  int P11 = 0; //variable per guardar pixels (0, 128, 255)
  int P12 = 0; //variable per guardar pixels (0, 0, 255)

  //recorrem tot l'array de pixels buscant pixels blancs o negres
  for (int pxCl : img.pixels) {
    if (pxCl == color(128, 0, 0)) {
      P1 = P1+1;
    }
    if (pxCl == color(200, 0, 0)) {
      P2 = P2+1;
    }
    if (pxCl == color(255, 0, 0)) {
      P3 = P3+1;
    }
    if (pxCl == color(255, 128, 0)) {
      P4 = P4+1;
    }
    if (pxCl == color(255, 191, 0)) {
      P5 = P5+1;
    }
    if (pxCl == color(255, 255, 0)) {
      P6 = P6+1;
    }
    if (pxCl == color(191, 255, 0)) {
      P7 = P7+1;
    }
    if (pxCl == color(0, 255, 0)) {
      P8 = P8+1;
    }
    if (pxCl == color(0, 255, 128)) {
      P9 = P9+1;
    }
    if (pxCl == color(0, 255, 255)) {
      P10 = P10+1;
    }
    if (pxCl == color(0, 128, 255)) {
      P11 = P11+1;
    }
    if (pxCl == color(0, 0, 255)) {
      P12 = P12+1;
    }
  }
  
  //Sona només com més significativa és l'àrea
  if (P1 > 1000 && P1 < 3000){
    player1.play();
    player1.setGain(-10);
  } else if (P1 > 3000 && P1 < 4000){
    player1.play();
    player1.setGain(-3);
  } else if (P1 > 4000){
    player1.play();
    player1.setGain(1);
  } else{
    player1.pause();
  }
  
  if (P2 > 1000 && P2 < 3000){
    player2.play();
    player2.setGain(-10);
  } else if (P2 > 3000 && P2 < 4000){
    player2.play();
    player2.setGain(-3);
  } else if (P2 > 4000){
    player2.play();
    player2.setGain(1);
  } else{
    player2.pause();
  }
  
  if (P3 > 1000 && P3 < 3000){
    player3.play();
    player3.setGain(-10);
  } else if (P3 > 3000 && P3 < 4000){
    player3.play();
    player3.setGain(-3);
  } else if (P3 > 4000){
    player3.play();
    player3.setGain(1);
  } else{
    player3.pause();
  }
  
  if (P4 > 1000 && P4 < 3000){
    player4.play();
    player4.setGain(-10);
  } else if (P4 > 3000 && P4 < 4000){
    player4.play();
    player4.setGain(-3);
  } else if (P4 > 4000){
    player4.play();
    player4.setGain(1);
  } else{
    player4.pause();
  }
  
  if (P5 > 1000 && P5 < 3000){
    player5.play();
    player5.setGain(-10);
  } else if (P5 > 3000 && P5 < 4000){
    player5.play();
    player5.setGain(-3);
  } else if (P5 > 4000){
    player5.play();
    player5.setGain(1);
  } else{
    player5.pause();
  }
  
  if (P6 > 1000 && P6 < 3000){
    player6.play();
    player6.setGain(-10);
  } else if (P6 > 3000 && P6 < 4000){
    player6.play();
    player6.setGain(-3);
  } else if (P6 > 4000){
    player6.play();
    player6.setGain(1);
  } else{
    player6.pause();
  }
  
  if (P7 > 1000 && P7 < 3000){
    player7.play();
    player7.setGain(-10);
  } else if (P7 > 3000 && P7 < 4000){
    player7.play();
    player7.setGain(-3);
  } else if (P7 > 4000){
    player7.play();
    player7.setGain(1);
  } else{
    player7.pause();
  }
  
  if (P8 > 1000 && P8 < 3000){
    player8.play();
    player8.setGain(-10);
  } else if (P8 > 3000 && P8 < 4000){
    player8.play();
    player8.setGain(-3);
  } else if (P8 > 4000){
    player8.play();
    player8.setGain(1);
  } else{
    player8.pause();
  }
  
  if (P9 > 1000 && P9 < 3000){
    player9.play();
    player9.setGain(-10);
  } else if (P9 > 3000 && P9 < 4000){
    player9.play();
    player9.setGain(-3);
  } else if (P9 > 4000){
    player9.play();
    player9.setGain(1);
  } else{
    player9.pause();
  }
  
  if (P10 > 1000 && P10 < 3000){
    player10.play();
    player10.setGain(-10);
  } else if (P10 > 3000 && P10 < 4000){
    player10.play();
    player10.setGain(-3);
  } else if (P10 > 4000){
    player10.play();
    player10.setGain(1);
  } else{
    player10.pause();
  }
  
  if (P11 > 1000 && P11 < 3000){
    player11.play();
    player11.setGain(-10);
  } else if (P11 > 3000 && P11 < 4000){
    player11.play();
    player11.setGain(-3);
  } else if (P11 > 4000){
    player11.play();
    player11.setGain(1);
  } else{
    player11.pause();
  }
  
  if (P12 > 1000 && P12 < 3000){
    player12.play();
    player12.setGain(-10);
  } else if (P12 > 3000 && P12 < 4000){
    player12.play();
    player12.setGain(-3);
  } else if (P12 > 4000){
    player12.play();
    player12.setGain(1);
  } else{
    player12.pause();
  }
  
  //Mostrem en pantalla el resultat
  fill(255, 255, 255);
  text("P1 = " +P1, 10, 10);
  text("P2 = " +P2, 10, 30);
  text("P3 = " +P3, 10, 60);
  text("P4 = " +P4, 10, 90);
  text("P5 = " +P5, 10, 120);
  text("P6 = " +P6, 10, 150);
  text("P7 = " +P7, 10, 180);
  text("P8 = " +P8, 10, 210);
  text("P9 = " +P9, 10, 240);
  text("P10 = " +P10, 10, 270);
  text("P11 = " +P11, 10, 300);
  text("P12 = " +P12, 10, 330);
  
}
