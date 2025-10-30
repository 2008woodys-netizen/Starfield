Particle[] stars = new Particle[1000];

void setup() {
  size(1000, 1000);
  for (int i = 300; i<stars.length; i++)
    stars[i] = new Particle();
  for (int j = 0; j<300; j++)
    stars[j] = new Oddball();
}
void draw() {
  background(0);
  for (int i = stars.length - 1; i>=0; i--) {
    stars[i].show();
    stars[i].move();
  }
}
void keyPressed() {
  if (keyCode == UP) {
    for (int i = 0; i<stars.length; i++)
      stars[i].weirdVar += 0.05;
  }
  if (keyCode == DOWN) {
    for (int i = 0; i<stars.length; i++)
      stars[i].weirdVar -= 0.05;
  }
}
class Particle {
  private double myX, myY, mySize, myAngle, mySpeed, myDist, weirdVar, circleNum;
  
  double getmyX() {return myX;}
  void setmyX(double newX) {myX = newX;}
  double getmyY() {return myY;}
  void setmyY(double newY) {myY = newY;}
  double getmySize() {return mySize;}
  void setmySize(double newSize) {mySize = newSize;}
  double getmyAngle() {return myAngle;}
  void setmyAngle(double newAngle) {myAngle = newAngle;}
  double getmySpeed() {return mySpeed;}
  void setmySpeed(double newSpeed) {mySpeed = newSpeed;}
  double getmyDist() {return myDist;}
  void setmyDist(double newDist) {myDist = newDist;}
  double getweirdVar() {return weirdVar;}
  void setweirdVar(double newweirdVar) {weirdVar = newweirdVar;}
  double getcircleNum() {return circleNum;}
  void setcircleNum(double newcircleNum) {circleNum = newcircleNum;}
  
  Particle() {
    circleNum = 0;
    myX = Math.random()*1001;
    myY = Math.random()*1001;
    mySize = Math.random()*5 + 3;
    myDist = 0;
    mySpeed = 0;
    myAngle = Math.random()*2*Math.PI;
    weirdVar = 0;
  }
  void show() {
    fill(0,255,0);
    ellipse((float)myX, (float)myY, (float)mySize, (float)mySize);
  }
  void move() {
    myDist = (dist((float)myX, (float)myY, 500, 500));
    mySpeed = 1+myDist * myDist / 1000000000;
    myX += 0.2*(myX - 500) + Math.cos(myAngle)*mySpeed * weirdVar;
    myY += 0.2*(myY - 500) + Math.sin(myAngle)*mySpeed * weirdVar;
    mySize = circleNum * 1;
    circleNum ++;
    if ((myX>1020 || myY > 1020) || (myY<-1020 || myX<-1020)) {
      myX = mouseX;
      myY = mouseY;
      mySize = Math.random()*5 + 3;
      myAngle = Math.random()*2*PI;
      circleNum = 0;
    }
  }
}
class Oddball extends Particle {
  Oddball() {
    setmyX(Math.random()*1001);
    setmyY(Math.random()*1001);
    setmySize(Math.random()*5 + 6);
    setmyDist(0);
    setmySpeed(Math.random()*5 + 3);
    setmyAngle(Math.random()*2*3.141592);
    setweirdVar(0);
  }
  void show() {
    fill(255,0,0);
    ellipse((float)getmyX(), (float)getmyY(), (float)getmySize(), (float)getmySize());
  }
  void move() {
    setmyDist((dist((float)getmyX(), (float)getmyY(), 500, 500)));
    setmySpeed(1+getmyDist() * getmyDist() / 1000000000);
    setmyX(getmyX() + 0.2*(getmyX() - 500) + Math.cos(getmyAngle())*getmySpeed() * 0.01);
    setmyY(getmyY() + 0.2*(getmyY() - 500) + Math.sin(getmyAngle())*getmySpeed() * 0.01);
    setmySize(getcircleNum() * 1);
    setcircleNum(getcircleNum() + 1);
    if ((getmyX()>1020 || getmyY() > 1020) || (getmyY()<-1020 || getmyX()<-1020)) {
      setmyX(mouseX);
      setmyY(mouseY);
      setmySize(Math.random()*5 + 3);
      setmyAngle(Math.random()*2*PI);
      setcircleNum(0);
    }
    }
}

