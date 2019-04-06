ArrayList<Asteroid> asteroidlist;
Player player;
//Asteroid asteroid;
int asteroidnum = 100;
int starradius = 25;
void setup() {
  size(1500, 800);
  player = new Player();
  asteroidlist = new ArrayList<Asteroid>();
  for (int i=0; i<asteroidnum; i++) {
    asteroidlist.add(new Asteroid(random(0, width), random(0, height), 10));
  }
}
void draw() {
  background(0, 0, 0, 125);
  //asteroid.display();
  //asteroid.motion();
  //asteroid.move();
   player.display();
  //  player.keyTyped();
    player.move();
   player.gravity();
  // player.health();
   player.keyPressed();
  fill(255);
  ellipse(width/2, height/2, starradius*2, starradius*2);
  // text("playerx: " + player.playerx, 100, 50);
  // text("playery: " + player.playery, 100, 100);
  // text("playerspeedx: " + player.playerspeedx, 100, 150);
  // text("playerspeedy: " + player.playerspeedy, 100, 200);
  for (int i = 0; i < asteroidlist.size(); i++) {
    asteroidlist.get(i).display();
    asteroidlist.get(i).move();
    asteroidlist.get(i).motion();
  }
  for (int i = 0; i < asteroidlist.size(); i++) {
    if (asteroidlist.get(i).r + starradius > dist(width/2, height/2, asteroidlist.get(i).x, asteroidlist.get(i).y)) {
      asteroidlist.remove(i);
    }
  }
}


class Asteroid {
  float x = random(0, 1500);
  float y = random(0, 100);
  float r = 5;
  float speed = .0001;
  float xspeed = 0;
  float yspeed = 0;
  Asteroid(float _x, float _y, float _r) {
    _x = x;
    _y = y;
    _r = r;
  }
  void display() {
    fill(100);
    ellipse(x, y, r*2, r*2);
  }
  void motion() {
    if (x<width/2) {
      xspeed +=.01;
    } else if (x>width/2) {
      xspeed -=.01;
    }
    if (y<height/2) {
      yspeed +=.01;
    } else if (y>height/2) {
      yspeed -=.01;
    }
  }
  void move() {
    x += xspeed;
    y += yspeed;
  }
}


class Player {
  float x = 0;
  float y = 100;
  float r = 10;
  float q = 0;
  float xspeed = 0;
  float yspeed = 0;
  void display() {
    fill(random(0, 255), random(0, 255), random(0, 255), random(0, 255));
    pushMatrix();
    translate(x, y);
    rotate(q);
    ellipse(0, 0, r*2, r*2);
    line(0, -15, 0, 15);
    popMatrix();
  }
  void move() {
    x+=xspeed;
    y+=yspeed;
  }
  void gravity() {
    if (x<width/2) {
      xspeed +=.01;
    } else if (x>width/2) {
      xspeed -=.01;
    }
    if (y<height/2) {
      yspeed +=.01;
    } else if (y>height/2) {
      yspeed -=.01;
    }
  }
  void keyPressed(){
  if(key == 'w'){
    yspeed -=.05;
  }
  if(key == 'a'){
    xspeed -=.05;
  }
  if(key == 's'){
  yspeed +=.05;
  }
  if(key == 'd'){
    xspeed +=.05;
  }
  if(key == 'q'){
    q-=PI/100;
  }
  if(key == 'e'){
    q+=PI/100;
  }
  }
}

