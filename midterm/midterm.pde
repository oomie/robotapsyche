
import ddf.minim.*;
Minim minim;
AudioPlayer bgm;

PImage imei, isam, ichloe, bg;
PImage test, test1, test2;
PFont font;
int screenmode = 1;
Sam[] sam;


void setup() {
  size(1200, 700);
  test1 = loadImage("yujiidle.png");
  test2= loadImage("yujishoot.png");
  bg = loadImage("bg.png");
  font  = createFont("Courier New", 25);
  noStroke();
  // might add some bgm later
  // minim = new Minim(this);
  //bgm = minim.loadFile("music.wav");
  //bgm.loop();

  imageMode(CENTER);
  textAlign(CENTER);

  sam = new Sam[1] ;
  for (int i = 0; i<sam.length; i++) {
    sam[i]= new Sam(random(100, width-100), random(500, height-100), random(2, -2), random(2, -2));
  }
}

void draw() {
  //start screen
  if (screenmode == 1) {
    background(#728DC6);
    textFont(font, 70);
    text("babysitting simulator!", width/2, height/2-100);
    textFont(font, 30);
    text("-press the space key to start-", width/2, height/2);
    text("Your little sister Mei has invited her friends over to play", width/2, height/2+60);
    text("with her in your home's backyard, but it is your job to", width/2, height/2+100);
    text("babysit them and make sure they don't cause any chaos!", width/2, height/2+140);

    if (keyPressed) {
      if (key == ' ' ) {
        screenmode = 2;
      }
    }
  }  // title screen end
  if (screenmode == 2) {
    background(bg);

    pushStyle();
    fill(255, 180);
    noStroke();
    rect(2, height-20, 360, 15 );
    textAlign(LEFT);
    textFont(font, 15);
    fill(0);
    text("press 'b' to go back to the main screen!", 2, height-8);
    popStyle();

    for (int i = 0; i<sam.length; i++) {
      sam[i].display();
      sam[i].move();
    }
    if (keyPressed) {
      if (key == 'b' || key == 'B' ) { //back to start
        screenmode = 1;
      }
      if (key == 's' || key == 'S' ) { // stickers for mei
        //image changes, adoration +1
      }
      if (key == 'c' || key == 'C' ) { //candy for sam
        test = test1;
        //sam.adoration += 1; // this is the part that doesnt work!
      }
    }
  } // main screen end
} // draw end

