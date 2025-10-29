class Particle {
  double myX, myY, mySize, myAngle, mySpeed, myDist, weirdVar, circleNum;
  Particle() {
    circleNum = 0;
    myX = Math.random()*1001;
    myY = Math.random()*1001;
    mySize = Math.random()*5 + 3;
    myDist = 0;
    mySpeed = 0;
    myAngle = Math.random()*2*PI;
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
  color myColor;
  Oddball() {
    myX = Math.random()*1001;
    myY = Math.random()*1001;
    mySize = Math.random()*5 + 6;
    myDist = 0;
    mySpeed = Math.random()*5 + 3;
    myAngle = Math.random()*2*PI;
    weirdVar = 0;
    myColor = color(255, 0, 0);
  }
  void show() {
    fill(255,0,0);
    ellipse((float)myX, (float)myY, (float)mySize, (float)mySize);
  }
  void move() {
      myDist = (dist((float)myX, (float)myY, 500, 500));
    mySpeed = 1+myDist * myDist / 1000000000;
    myX += 0.2*(myX - 500) + Math.cos(myAngle)*mySpeed * 0.01;
    myY += 0.2*(myY - 500) + Math.sin(myAngle)*mySpeed * 0.01;
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
