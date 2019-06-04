class Cube {
  Piece[][][] pieces = new Piece[4][4][4];
  Piece[] temp;
  
  Cube() {
    for(int i = -1; i < 3; i++) {
      for(int j = -1; j < 3; j++) {
        for(int p = -1; p < 3; p++) {
          pieces[i+1][j+1][p+1] = new Piece(new PVector((i-0.5)*2*r, (j-0.5)*2*r, (p-0.5)*2*r));
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
  
  void turn() {
    temp = new Piece[4];
    for(int i = 0; i < temp.length; i++) {
      temp[i] = new Piece(pieces[3][0][i].center);
      for(int j = 0; j < temp[i].side.size(); j++)
      temp[i].side.get(j).orientation = pieces[3][0][i].side.get(j).orientation;
    }
    pieces[3][0][0].change(4, pieces[3][0][3], 2);
    pieces[3][0][1].change(4, pieces[3][1][3], 2);
    pieces[3][0][2].change(4, pieces[3][2][3], 2);
    pieces[3][0][3].change(4, pieces[3][3][3], 2);
    pieces[3][0][3].change(2, pieces[3][3][3], 1);
    pieces[3][1][3].change(2, pieces[3][3][2], 1);
    pieces[3][2][3].change(2, pieces[3][3][1], 1);
    pieces[3][3][3].change(2, pieces[3][3][0], 1);
    pieces[3][3][3].change(1, pieces[3][3][0], 5);
    pieces[3][3][2].change(1, pieces[3][2][0], 5);
    pieces[3][3][1].change(1, pieces[3][1][0], 5);
    pieces[3][3][0].change(1, pieces[3][0][0], 5);
    pieces[3][3][0].change(5, temp[0], 4);
    pieces[3][2][0].change(5, temp[1], 4);
    pieces[3][1][0].change(5, temp[2], 4);
    pieces[3][0][0].change(5, temp[3], 4);
  }
}
