ArrayList<Asteroid> asteroidList;
Player player;
int asteroidnum = 50;
int starradius = 25;
void setup() {
  size(1700, 800);
  player = new Player();
  asteroidList = new ArrayList<Asteroid>();
  for (int i=0; i<asteroidnum; i++) {
    asteroidList.add(new Asteroid(random(0, width), 0));
  }
}
void draw() {
  background(0, 0, 0, 125);
  for (int i=0; i<asteroidList.size(); i++) {
    asteroidList.get(i).display();
  }
  for (int b=0; b<asteroidList.size(); b++) {
    asteroidList.get(b).move();
    for (int w=0; w<asteroidList.size(); w++) {
      asteroidList.get(w).gravity();
    }
  }
  player.display();
  player.keyTyped();
  player.move();
  player.gravity();
  player.health();
  player.keyPressed();
  fill(255);
  ellipse(width/2, height/2, starradius*2, starradius*2);
  text("playerx: " + player.playerx, 100, 50);
  text("playery: " + player.playery, 100, 100);
  text("playerspeedx: " + player.playerspeedx, 100, 150);
  text("playerspeedy: " + player.playerspeedy, 100, 200);
}
