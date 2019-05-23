class Cube {
  Piece[][][] pieces = new Piece[4][4][4];
  
  Cube() {
    for(int i = -1; i < 3; i++) {
      for(int j = -1; j < 3; j++) {
        for(int p = -1; p < 3; p++) {
          Piece piece = new Piece(new PVector(i*2*r, j*2*r, p*2*r));
          pieces[i+1][j+1][p+1] = piece;
        }
      }
    }
  }
  
  void display() {
    for(int i = -2; i < 2; i++) {
      for(int j = -2; j < 2; j++) {
        for(int p = -2; p < 2; p++) {
          pieces[i][j][p].display();
        }
      }
    }
  }
}
