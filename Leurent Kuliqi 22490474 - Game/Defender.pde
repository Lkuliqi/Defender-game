PImage player;
class Defender1{
  int x;
  int y;
  Defender1(int x, int y){
    this.x = x;
    this.y = y;
    player = loadImage("defender1.png");
    
  }
  
  void display(){
    image(player, x, y);
    player.resize(60,70);
  }
  void move(){
    x = mouseX;
    y = mouseY;
    
  }

}
