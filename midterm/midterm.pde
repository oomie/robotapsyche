Include a block at the beginning of the code with your name, short description of the project, class, and date
//Toomie's Robota Pysche midterm project: Babysitting Simulator. March 9th, 2022. 
// Use the mouse to give the children candy when they misbehave so that they listen to you and begin to like you. Once their adoration levels reach a certain value,they will stop trying to cause mischief!

import ddf.minim.*;
Minim minim;
AudioPlayer bgm;

PImage pmei, psam, bg, candy, mei1, mei2, mei3, sam1, sam2, sam3;
PFont font;
int screenmode = 1;
int r = 60;
float dsam, dmei;
Mei mei;
Sam sam;

void setup() {
  size(1200, 700);
  mei1 = loadImage("mei1.png");
  mei2 = loadImage("mei2.png");
  mei3 = loadImage("mei3.png");
  sam1 = loadImage("sam1.png");
  sam2 = loadImage("sam2.png");
  sam3 = loadImage("sam3.png");
  bg = loadImage("bg.png");
  candy = loadImage("candy.png");
  font  = createFont("/Users/fatimaaljneibi/Downloads/Fonts/Hubballi/Hubballi-Regular.ttf", 32);
  noStroke();
  smooth(4);
  // background music
  minim = new Minim(this);
  bgm = minim.loadFile("bgm.wav");
  bgm.loop();

  imageMode(CENTER);
  textAlign(CENTER);

  sam= new Sam(random(100, width-100), 500, random(2, -2), random(2, -2));
  mei = new Mei(random(100, width-100), random(500, height-100), random(2, -2), random(2, -2));
}

void draw() {
  //start screen , background info
  if (screenmode == 1) {
    background(#728DC6);
    textFont(font, 70);
    text("babysitting simulator!", width/2, height/2-100);
    textFont(font, 30);
    text("-press the space key to start-", width/2, height/2);
    text("Your little sister Mei has invited her friend over to play", width/2, height/2+60);
    text("with her in your home's backyard, but it is your job to", width/2, height/2+100);
    text("babysit them and make sure they don't cause any chaos!", width/2, height/2+140);
    text("(give them candy to make them listen to you!)", width/2, height/2+180);

    // moving to next screen , resetting some values for the next screen
    if (keyPressed) {
      if (key == ' ' ) {
        screenmode = 2;
        sam.adoration = 1;
        mei.adoration = 1;
        pmei = mei1;
        psam = sam1;
        mei.timerstarted = false;
        sam.timerstarted = false;
      }
    }
  }  // title screen end
  if (screenmode == 2) {
    background(bg);

    // calling class functions :

    sam.display();
    sam.move();
    sam.jump();

    mei.display();
    mei.move();
    mei.edge();

    //detect if the mouse is touching the kids:

    dsam = dist(mouseX, mouseY, sam.location.x, sam.location.y);
    dmei = dist(mouseX, mouseY, mei.location.x, mei.location.y);

    if (mousePressed) {
      if ( dsam < r && psam == sam2 ) {
        psam = sam1;
        sam.adoration +=1;
        sam.timerstarted =false;
        sam.jump = false;
      }
      if ( dmei < r && pmei == mei2 ) {
        pmei = mei1;
        mei.adoration += 1;
        mei.timerstarted = false;
      }
    }
    if ( pmei == mei1) {
      mei.velocity.mult(0);
      mei.location.add(mei.velocity);
    } // she stops moving around for some time

    if (pmei == mei1 && mei.adoration >= 10) {
      mei.velocity.mult(0);
      mei.location.add(mei.velocity);
      pmei = mei3;
    } // she's happy and likes you! she stops moving around now!

    // just for my reference:
    //println("sam:", sam.adoration);
    //println("mei:", mei.adoration);

    // code for going back to the main screen, + instructions:
    pushStyle();

    fill(255, 180);
    noStroke();
    rect(2, height-24, 350, 20, 20);
    rect(2, 6, 430, 20, 20);
    rect(10, 35, 200, 20, 20);
    rect(10, 75, 200, 20, 20);
    textAlign(LEFT);
    textFont(font, 20);
    fill(0);
    text("press 'b' to go back to the main screen!", 10, height-8);
    text("click your mouse on the kids to give them candy!", 10, 20);

    // visual rep of their levels:
    text("sam's adoration levels:", 20, 50);
    text("mei's adoration levels:", 20, 90);
    fill(#6583ED);
    rect(2, 55, sam.adoration*20, 20);
    fill(#A449F0);
    rect(2, 95, mei.adoration*20, 20);

    popStyle();
    
    if (mei.adoration >= 10 && sam.adoration >=10) {
      textFont(font, 40);
      text("The kids like you know! Mission:Success!", width/2, height/2);
    }
    
    if (keyPressed) {
      if (key == 'b' || key == 'B'  ) {
        screenmode = 1;
      }
    }

    // candy image on mouse
    image(candy, mouseX, mouseY, 150, 150);
  } // main screen end
} // draw end
