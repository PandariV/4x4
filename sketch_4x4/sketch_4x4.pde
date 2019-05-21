Cube[][][] cubes = new Cube[4][4][4];

void setup() {
  size(800, 800, P3D);
  for(int i = 0; i < 4; i++) {
    for(int j = 0; j < 4; j++) {
      for(int k = 0; k < 4; k++){
        cubes[i][j][k] = new Cube(50, 50, 50);
      }
    }
  }
}

void draw() {
   background(0);
   //lights();
}
