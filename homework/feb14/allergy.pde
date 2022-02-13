// A germ (or whatever the object is allergic to)
// and the allergy that develops from close contact
// idea : when the germ gets close to the object, it develops an allergic reaction that gets bigger and bigger with more close contact.
Germ g;
Allergy a;

void setup() {
  size(640, 360);
  g = new Germ();
  a = new Allergy();
}

void draw() {
  background(255);

// the attraction force 
  PVector force = a.attract(g);
  g.applyForce(force);
  g.update();

  a.display();
  g.display();
}

class Allergy {
  float mass;
  PVector location;
  float G;

  Allergy() {
    mass = 20;
    G = 0.4;
  }

  PVector attract(Germ g) {
    location = new PVector(mouseX, mouseY); // the object's location is your mouse
    PVector force = PVector.sub(location, g.location);
    float distance = force.mag();
    distance = constrain(distance, 5.0, 25.0);

    force.normalize();
    float strength = (G * mass * g.mass) / (distance * distance);
    force.mult(strength);
    return force;
  }
float size = mass*4; 
float alpha = 10; // opacity of the allergy's fill color

  void display() {
    stroke(0);
    fill(#95FAA5, alpha); 
    // detects if the object is in close contact with the germ. if it is, the allergy will grow bigger
    if(dist(a.location.x, a.location.y, g.location.x, g.location.y)<40){
    size = size - .2; // im not sure why it gets bigger if i subtract here, but it works.
    alpha += 10; // its subtle, but the color gets more intense as the ellipse grows
  }
    ellipse(location.x, location.y, size, size);
   
  }
}


// Mover class copied from last week's examples
//changed the name to germ to fit my idea

class Germ {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;

  Germ() {
    mass = 1;
    location = new PVector(30, 30);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }

  // Newton’s second law.
  void applyForce(PVector force) {
    //[full] Receive a force, divide by mass, and add to acceleration.
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void update() {
    //[full] Motion 101 from Chapter 1
    velocity.add(acceleration);
    location.add(velocity);
    //[end]
    // Now add clearing the acceleration each time!
    acceleration.mult(0);
  }

  void display() {
    stroke(0);
    fill(#FAC695);
    //[offset-down] Scaling the size according to mass.
    ellipse(location.x, location.y, mass*40, mass*40);
  }


  void checkEdges() {
    if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
    } else if (location.x < 0) {
      location.x = 0;
      velocity.x *= -1;
    }

    if (location.y > height) {
      location.y = height;
      velocity.y *= -1;
    } else if (location.y < 0) {
      location.y = 0;
      velocity.y *= -1;
    }
  }
}
