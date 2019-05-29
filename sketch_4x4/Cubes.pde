class Cube {
  Piece[][][] pieces = new Piece[4][4][4];
  
  Cube() {
    for(int i = -1; i < 3; i++) {
      for(int j = -1; j < 3; j++) {
        for(int p = -1; p < 3; p++) {
          Piece piece = new Piece(new PVector((i-0.5)*2*r, (j-0.5)*2*r, (p-0.5)*2*r));
          pieces[i+1][j+1][p+1] = piece;
        }
      }
    }
  }
  
  void display() {
    for(int i = 0; i < pieces.length; i++) {
      for(int j = 0; j < pieces[i].length; j++) {
        for(int p = 0; p < pieces[i][j].length; p++) {
          pieces[i][j][p].display();
        }
      }
    }
  }
  
  void turn(PVector vector) {
    for(int i = 0; i < pieces.length; i++) {
      for(int j = 0; j < pieces[0].length; j++) {
        for(int p = 0; p < pieces[0][0].length; p++) {
          pieces[i][j][p].setOrientation(axes[(int) (random(0, 6))]);
        }
      }
    }
  }
}
