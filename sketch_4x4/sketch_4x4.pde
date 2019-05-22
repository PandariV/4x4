import peasy.*;

PeasyCam CAM;
PeasyCam BUFFERCAM;
PGraphics buffer;

float R = 25;

PVector center = new PVector(0, 0, 0);

PVector PX = new PVector(1, 0, 0);
PVector PY = new PVector(0, 1, 0);
PVector PZ = new PVector(0, 0, 1);
PVector NX = new PVector(-1, -0, -0);
PVector NY = new PVector(0, -1, 0);
PVector NZ = new PVector(0, 0, -1);
PVector[] AXES = {PX, PY, PZ, NX, NY, NZ};

int red = 0xffff3333;
int blue = 0xff3333ff;
int white = 0xffffffff;
int green = 0xff33ff33;
int yellow = 0xffffff33;
int orange = 0xffff7f33;
int black = 0xff000000;

void setup() {
  size(600, 600, P3D);
  strokeWeight(5);
  stroke(0);

  surface.setTitle("Winie the Pooh simulator");

  CAM = new PeasyCam(this, 600);
  CAM.setResetOnDoubleClick(false);
  CAM.setMinimumDistance((3 * R) * sqrt(3) + 200);

  buffer = createGraphics(width, height, P3D);
  BUFFERCAM = new PeasyCam(this, buffer, 600);
  BUFFERCAM.setResetOnDoubleClick(false);
  BUFFERCAM.setMinimumDistance((3 * R) * sqrt(3) + 200);

  Cube cube = new Cube();
}

void draw() {
   background(0);
   cube.update();
   cube.show();
}
