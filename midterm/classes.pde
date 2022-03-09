
// mei's class;

class Mei {
  float sizew= 130;
  float sizeh = 200;
  PVector location, velocity ;
  float adoration = 1;
  boolean timerstarted = false;
  float timer;

  Mei(float posx, float posy, float vx, float vy) {
    location = new PVector(posx, posy);
    velocity = new PVector(vx, vy);
    pmei = mei1;
  }  //constructor end

  //functions:
  void display() {
    image(pmei, location.x, location.y, sizew, sizeh);

    if (pmei == mei3) {
      sizeh = 250;
    } else{
     sizeh = 200;
    }
  }

  void move() {
    if (adoration >= 1 && adoration < 10) {
      velocity.x += random (-1, 1);
      velocity.y += random(-.1, .1);
      location.add(velocity); // she moves around

      if (frameCount % 240 == 0) { // every 4 seconds
        pmei = mei2;

        if (timerstarted == false) {
          timer = millis();
          timerstarted = true;
        }

        if (millis() > timer + 7000) { // if you ignore her for 7 seconds you lose a point
          adoration -=1;
          timerstarted = false;
        }
      } else if (adoration >= 10) {
        pmei = mei3;
        // she is happy and behaved
      }
    }
  } // move function end

  void edge() {
    if (location.x >= width-50) {
      velocity.x =  random(-1, 0);
    } else if (location.x <= 50) {
      velocity.x = random(0, 1);
    } else if (location.y >= height-100) {
      velocity.y = random(-1, 0);
    } else if (location.y <=500) {
      velocity.y = random(0, 1) ;
    }
  }//edge function
} // end of mei's class

class Sam {
  float sizew= 110;
  float sizeh = 200;
  PVector location, velocity ;
  float adoration = 1;
  float gravity = .5;
  boolean timerstarted = false;
  float timer, up, down;
  int ground = 500;
  float jumpspeed = 10;
  boolean jump = false;

  Sam(float posx, float posy, float vx, float vy) {
    location = new PVector(posx, posy);
    velocity = new PVector(vx, vy);
    psam = sam1;
  } //constructor end

  //functions:
  void display() {
    image(psam, location.x, location.y, sizew, sizeh);
    if (psam == sam3) {
      sizeh = 250;
    }else{
     sizeh = 200;
    }
  }

  void move() {
    if (adoration >= 1 && adoration < 10) {
      if (frameCount % 300 == 0) { // every 6 seconds
        psam = sam2;

        if (timerstarted == false) {
          timer = millis();
          timerstarted = true;
        }

        if (millis() > timer + 8000) { // if you ignore him for 8 seconds you lose a point
          adoration -=1;
          timerstarted = false;
        }
      }
    } else if (adoration >= 10) {
      psam = sam3;
      jump = false; // he is happy and behaved
    }
  } // move function end

  void jump() {
    if (psam == sam2) {
      jump = true;
    }
    if (location.y < ground ) { //if its above ground apply gravity
      velocity.y += gravity;
      location.add(velocity);
    } else {
      velocity.y = 0;
      location.add(velocity);
    }

    if (jump == true && location.y >= ground ) { // if its on the ground and jump is true then it'll go up
      velocity.y = -jumpspeed;
      location.add(velocity);
    }
    if (jump == false && location.y >= ground ) {
      velocity.mult(0);
      location.add(velocity);
    }
  }//jump end
}// end of sam's class
