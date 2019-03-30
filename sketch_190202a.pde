ArrayList<Asteroid> asteroidlist;
Player player;
//Asteroid asteroid;
int asteroidnum = 50;
int starradius = 25;
void setup() {
  size(1700, 800);
  player = new Player();
asteroidlist = new ArrayList<Asteroid>();
for(int i=0; i<asteroidnum; i++){
  asteroidlist.add(new Asteroid(random(0,width),random(0,height),10));
}
}
void draw() {
  background(0, 0, 0, 125);
  //asteroid.display();
  //asteroid.motion();
  //asteroid.move();
 // player.display();
//  player.keyTyped();
//  player.move();
 // player.gravity();
 // player.health();
 // player.keyPressed();
  fill(255);
  ellipse(width/2, height/2, starradius*2, starradius*2);
 // text("playerx: " + player.playerx, 100, 50);
 // text("playery: " + player.playery, 100, 100);
 // text("playerspeedx: " + player.playerspeedx, 100, 150);
 // text("playerspeedy: " + player.playerspeedy, 100, 200);
}

class Asteroid {
  float x = random(0, 1700);
  float y = 0;
  float r = 5;
  float speed = .0001;
  float xspeed = dist(width/2, 0, x, 0)/200;
  float yspeed = dist(height/2,0,y,0)/200;
  Asteroid(float _x,float _y, float _r){
  _x = x;
  _y = y;
  _r = r;
  }
  void display() {
    fill(100);
    ellipse(x, y, r*2, r*2);
  }
  void motion() {
    if (width/2 < x) {
      xspeed*=-1;
    }
    if(height/2 < y){
      yspeed *= -1;
    }
  }
  void move(){
  x += xspeed;
  y += yspeed;
  }
  
}

class Player{

}
