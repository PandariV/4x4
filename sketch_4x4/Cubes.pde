class Cube {
  float x, y, z;
  
  Cube(float x, float y, float z) {
    this.x = x;
    this.y = y;
    this.z = z;
  }
  
  void display() {
    fill(255);
    box(100);
  }
}
