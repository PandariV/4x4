class Cube {
  Piece[][][] pieces = new Piece[4][4][4];
  Piece[] temp, temp2;
  
  Cube() {
    for(int i = -1; i < 3; i++) {
      for(int j = -1; j < 3; j++) {
        for(int p = -1; p < 3; p++) {
          pieces[i+1][j+1][p+1] = new Piece(new PVector((i-0.5)*2*r, (j-0.5)*2*r, (p-0.5)*2*r));
        }
      }
    }
    pieces[3][1][2].side.get(0).orientation = axes[5];
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
  
  // uggghh, this was the hardest part to code, my function is insanely ineffecient, but it works
  void turn(int thingy, String str) { //takes two inputs, thingy is the index and str identifies x, y, or z axis of rotation
    if(str.equals("y")) {
      
      //changes the side pieces by swapping them with corresponding face
      temp = new Piece[4];
      for(int i = 0; i < temp.length; i++) {
        temp[i] = new Piece(pieces[thingy][0][i].center);
        for(int j = 0; j < temp[i].side.size(); j++)
        temp[i].side.get(j).orientation = pieces[thingy][0][i].side.get(j).orientation;
      }
      pieces[thingy][0][0].change(4, pieces[thingy][0][3], 2);
      pieces[thingy][0][1].change(4, pieces[thingy][1][3], 2);
      pieces[thingy][0][2].change(4, pieces[thingy][2][3], 2);
      pieces[thingy][0][3].change(4, pieces[thingy][3][3], 2);
      pieces[thingy][0][3].change(2, pieces[thingy][3][3], 1);
      pieces[thingy][1][3].change(2, pieces[thingy][3][2], 1);
      pieces[thingy][2][3].change(2, pieces[thingy][3][1], 1);
      pieces[thingy][3][3].change(2, pieces[thingy][3][0], 1);
      pieces[thingy][3][3].change(1, pieces[thingy][3][0], 5);
      pieces[thingy][3][2].change(1, pieces[thingy][2][0], 5);
      pieces[thingy][3][1].change(1, pieces[thingy][1][0], 5);
      pieces[thingy][3][0].change(1, pieces[thingy][0][0], 5);
      pieces[thingy][3][0].change(5, temp[0], 4);
      pieces[thingy][2][0].change(5, temp[1], 4);
      pieces[thingy][1][0].change(5, temp[2], 4);
      pieces[thingy][0][0].change(5, temp[3], 4);
      
      //changes the top pieces
      //outer
      pieces[thingy][0][0].change(0, pieces[thingy][0][3], 0);
      pieces[thingy][0][1].change(0, pieces[thingy][1][3], 0);
      pieces[thingy][0][2].change(0, pieces[thingy][2][3], 0);
      pieces[thingy][0][3].change(0, pieces[thingy][3][3], 0);
      pieces[thingy][0][3].change(0, pieces[thingy][3][3], 0);
      pieces[thingy][1][3].change(0, pieces[thingy][3][2], 0);
      pieces[thingy][2][3].change(0, pieces[thingy][3][1], 0);
      pieces[thingy][3][3].change(0, pieces[thingy][3][0], 0);
      pieces[thingy][3][3].change(0, pieces[thingy][3][0], 0);
      pieces[thingy][3][2].change(0, pieces[thingy][2][0], 0);
      pieces[thingy][3][1].change(0, pieces[thingy][1][0], 0);
      pieces[thingy][3][0].change(0, pieces[thingy][0][0], 0);
      pieces[thingy][3][0].change(0, temp[0], 0);
      pieces[thingy][2][0].change(0, temp[1], 0);
      pieces[thingy][1][0].change(0, temp[2], 0);
      pieces[thingy][0][0].change(0, temp[3], 0);
      //inner
      int counter = 0;
      temp2 = new Piece[4];
      for(int i = 1; i <= 2; i++) {
        for(int j = 1; j <= 2; j++) {
          temp2[counter] = new Piece(pieces[thingy][i][j].center);
          for(int p = 0; p < temp2[counter].side.size(); p++) {
            temp2[counter].side.get(p).orientation = pieces[thingy][i][j].side.get(p).orientation;
          }
          counter++;
        }
      }
      pieces[thingy][1][1].change(0, temp2[1], 0);
      pieces[thingy][1][2].change(0, temp2[3], 0);
      pieces[thingy][2][2].change(0, temp2[2], 0);
      pieces[thingy][2][1].change(0, temp2[0], 0); 
    } else if (str.equals("x")) {
      //insert horizontal turn code
    } else {
      //inser z-axis turn code
    }
  }
}
