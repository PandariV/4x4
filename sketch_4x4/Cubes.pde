class Cube {
  Piece[][][] piece = new Piece[4][4][4];
  
  Cube() {
    for(int i = -2; i < 2; i++) {
      for(int j = -2; j < 2; j++) {
        for(int p = -2; p < 2; p++) {
          piece = new Piece(new PVector(i*2*R, j*2*R, p*2*R));
        }
      }
    }
  }
  
  void display() {
    fill(255);
    box(100);
  }
}
