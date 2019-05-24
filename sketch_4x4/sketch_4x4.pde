import peasy.*;

PeasyCam CAM;
PeasyCam BUFFERCAM;
PGraphics buffer;

float r = 25;

PVector center = new PVector(0, 0, 0);
PVector[] axes = {new PVector(1, 0, 0), new PVector(0, 1, 0), new PVector(0, 0, 1), new PVector(-1, -0, -0), new PVector(0, -1, 0), new PVector(0, 0, -1)};

int red = 0xff990000;
int blue = 0xff3000ff;
int white = 0xffffffff;
int green = 0xff00ff00;
int yellow = 0xffffff00;
int orange = 0xffff9900;
int black = 0xff000000;

Cube cube;

void setup() {
  size(600, 600, P3D);
  strokeWeight(5);
  stroke(0);

  surface.setTitle("4x4 Simulator");

  CAM = new PeasyCam(this, 600);
  CAM.setResetOnDoubleClick(false);
  CAM.setMinimumDistance(700);
  CAM.setMaximumDistance(700);

  buffer = createGraphics(width, height, P3D);
  BUFFERCAM = new PeasyCam(this, buffer, 600);
  BUFFERCAM.setResetOnDoubleClick(false);
  BUFFERCAM.setMinimumDistance(700);
  BUFFERCAM.setMaximumDistance(700);
  
  cube = new Cube();
}

void draw() {
   background(0);
   //cube.update();
   cube.display();
}
