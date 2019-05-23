import peasy.*;

PeasyCam CAM;
PeasyCam BUFFERCAM;
PGraphics buffer;

float r = 25;

PVector center = new PVector(0, 0, 0);
PVector[] axes = {new PVector(1, 0, 0), new PVector(0, 1, 0), new PVector(0, 0, 1), new PVector(-1, -0, -0), new PVector(0, -1, 0), new PVector(0, 0, -1)};

int red = 0xffff3333;
int blue = 0xff3333ff;
int white = 0xffffffff;
int green = 0xff33ff33;
int yellow = 0xffffff33;
int orange = 0xffff7f33;
int black = 0xff000000;

Cube cube;

void setup() {
  size(600, 600, P3D);
  strokeWeight(5);
  stroke(0);

  //surface.setTitle("");

  CAM = new PeasyCam(this, 600);
  CAM.setResetOnDoubleClick(false);
  CAM.setMinimumDistance((3 * r) * sqrt(3) + 200);

  buffer = createGraphics(width, height, P3D);
  BUFFERCAM = new PeasyCam(this, buffer, 600);
  BUFFERCAM.setResetOnDoubleClick(false);
  BUFFERCAM.setMinimumDistance((3 * r) * sqrt(3) + 200);
  
  cube = new Cube();
}

void draw() {
   background(0);
   //cube.update();
   cube.display();
}
