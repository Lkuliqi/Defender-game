PImage background1;
final int START = 0;
final int RUNNING = 1;
final int GAMEISUP = 2;
final int RETRY = 3;
int lives = 5;
int gameMode;
int score = 0;
Defender1 defender;
Princess1 princess;

ArrayList<Enemy1> alien = new ArrayList<>();
void setup() {
  size (700, 600);
  background1 = loadImage("castle.png");
  background1.resize(900, 650);
  imageMode(CENTER);
  princess = new Princess1(510, 60);
  princess = new Princess1(200, 60);
  defender = new Defender1(300, 300);
  //this loop adds the enemies. And the amount of enemies.
  for (int i=0; i<8; i++) {
    alien.add(new Enemy1((int) random(0, 700), 600, 1));
  }
}

void draw() {
  background(0, 0, 0);
  image(background1, 350, 300);
  princess.display();


  switch (gameMode)
  {
  case START:
    background(0, 0, 0);
    text(" CLICK l TO START THE GAME ", 130, 300);
    textSize(40);
    keyPressed();
    break;

  case RUNNING:

    for (int i=0; i<alien.size(); i++) {
      Enemy1 alien1= alien.get(i);
      alien1.display();
      alien1.move();
      alien1.collision();
    }
     if (lives == 0) { 
   gameMode = 2;  
  }
     
    defender.display();
    defender.move();

    text("score: " + score, 300, 40);
    textSize(30);
    text ("lives " + lives, 100, 40);
    textSize(30);
    break;
   
   case GAMEISUP:   
   background(0,0,0);
   fill(0,255,0);
   textSize(50);
   text("GAME IS OVER " , 180, 300);
   textSize(30);
   text ("Your score is:  " + score, 182, 340);
   text(" Press the l key to retry" ,180, 380);
   
  case RETRY:
    if (keyPressed == true && keyCode == 'l') {
      gameMode = START;
      if (lives == 0) { 
      gameMode = 2;  
      }
    }
  }
}




void keyPressed() {
  if ( gameMode == 0) {
    if (key == 'l') gameMode = 1;
  } else if (gameMode== 2) {
    if (key == 'l') {
      gameMode = 1;
      lives = 5;
      score = 0;
    }
  }
}


//this part makes sure that when you have clicked on the alien the alien will disappear and it adds 1 to the score.

void mouseClicked() {
  for (int i=0; i<alien.size(); i++) {
    Enemy1 alien1= alien.get(i);
    if (abs(defender.x-alien1.x)<40 && abs(defender.y-alien1.y)<40) {
      alien1.x= (int)random(0, 700);
      alien1.y= 600;
      score = score +1;
    }
  }
}
