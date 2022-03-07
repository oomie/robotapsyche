
//image sizes:
float sizew= 100;
float sizeh = 200;

// mei's class;

class Mei {
  PVector location, velocity ;
  float adoration;

  Mei( float posx, float posy, float vx, float vy) {
    location = new PVector(posx, posy);
    velocity = new PVector(vx, vy);
  } //constructor end

  //functions:
  void display() {
    image(imei, location.x, location.y, sizew, sizeh);
  }

  void move() { // there might be a better way to implement this? a for loop?
    if (adoration < 5) {
      velocity.x += random (5, 10);
      velocity.y += random(5, 10);
      //she moves more , more speed
    } else if (adoration > 5) {
      //  velocity.x -=
      // she moves less " "
    }
  } // move function end
} // end of mei's class



class Sam {
  PVector location, velocity ;
  float adoration = 1;

  Sam(float posx, float posy, float vx, float vy) {
    location = new PVector(posx, posy);
    velocity = new PVector(vx, vy);
    constrain(adoration, 0, 10);
    test = test1;
  } //constructor end

  //functions:
  void display() {   
    image(test, width/2, height/2+150, sizew, sizeh);
    //ellipse(width/2, height/2, sizew, sizeh);
  }

  void move() {
    println(adoration);
    if (adoration < 5) {
      //he jumps more
      if (frameCount % 120 == 0) { // every 2 seconds
        test = test2;
        float timer = millis();
        if (timer > 3000){
          adoration -=1;
      }
        velocity.add(random(-10, 10), random(-10, 10));
      }
      // he jumps less
    }
    if (adoration >= 5) {
      if (frameCount % 360 == 0) { // every 6 seconds
      }
    }
  } // move function end
} // end of sam's class


