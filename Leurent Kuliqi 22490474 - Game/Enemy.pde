class Enemy1 {
  int x;
  float y;
  int deltaX = 5;
  float speedY;
  int AlienCounter;
  int resetCounter;
  PImage Alien[] = new PImage [10];

  Enemy1( int x, float y, float speedY) {
    this.x = x;
    this.y = y;
    this.speedY = speedY;

    for (int i=0; i<Alien.length; i++) {
      Alien[i] = loadImage("alien1" + ".png");
      Alien[i].resize(30, 30);
    }
  }
  void display() {
    if (AlienCounter<10) {
      image(Alien[1], x, y);
    }
    if (AlienCounter<20) {
      image(Alien[2], x, y);
    }
    respawn();
  }
// this moves the alien upwards.
  void move() {
   y = y-speedY;
   if (x<0)
   x = width +50;
   x = x + (int) random( -3, 3);

   
  }
// this part makes it so that when the alien touches the princess the lives goes down by 1.  
  void collision() {
    if (abs (x-princess.x)<60 && abs ( y-princess.y)<60) {
      x = (int)random(0, 400);
      y=0;
      lives = lives - 1;
      
    }
   
  }



  void respawn() {
    if (y<=0 ) {
      y=600;
    }
  }
}
