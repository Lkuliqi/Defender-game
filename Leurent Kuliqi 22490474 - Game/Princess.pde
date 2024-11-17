PImage target;

class Princess1{
  int x; 
  int y;
  Princess1(int x, int y){
   this.x = x; 
   this.y = y;
   target = loadImage("princess.png");
   
  }
  void display(){
  image(target,x,y);
  target.resize(80,80);
  }
}
