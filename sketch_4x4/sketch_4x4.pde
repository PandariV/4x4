import peasy.*;

PeasyCam camera;
PeasyCam buffercam;
PGraphics buffer;

float r = 25;

PVector center = new PVector(0, 0, 0);
PVector[] axes = {new PVector(1, 0, 0), new PVector(0, 1, 0), new PVector(0, 0, 1), new PVector(-1, -0, -0), new PVector(0, -1, 0), new PVector(0, 0, -1)};

//red, blue, white, green, yellow, orange
color[] colors = {#87000f, #0757bf, #ffffff, #30ff4b, #ffff11, #ff973d};

Cube cube;

void setup() {
  size(600, 600, P3D);
  stroke(0);

  camera = new PeasyCam(this, 600);
  camera.setResetOnDoubleClick(false);
  camera.setMinimumDistance(600);
  camera.setMaximumDistance(600);

  buffer = createGraphics(width, height, P3D);
  buffercam = new PeasyCam(this, buffer, 600);
  buffercam.setResetOnDoubleClick(false);
  buffercam.setMinimumDistance(600);
  buffercam.setMaximumDistance(600);
  
  cube = new Cube();
}

void draw() {
   background(0);
   cube.display();
}

void keyPressed() {
  if(key == 'R')
    //cube.turn(new PVector(500, 500, 500));
    print();
  else if(key == 'r')
    cube.turn(new PVector(500, 500, 500));
  else if(key == 'L')
    print();
  else if(key == 'l')
    print();
  else if(key == 'U')
    print();
  else if(key == 'u')
    print();
  else if(key == 'D')
    print();
  else if(key == 'd')
    print();
  else if(key == 'F')
    print();
  else if(key == 'f')
    print();
  else if(key == 'B')
    print();
  else if(key == 'b')
    print();
  else if(key == ' ')
    cube = new Cube();
}
