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
      
      //creates a temp copy of a side
      temp = new Piece[4];
      for(int i = 0; i < temp.length; i++) {
        temp[i] = new Piece(pieces[thingy][0][i].center);
        for(int j = 0; j < temp[i].side.size(); j++) {
          temp[i].side.get(j).orientation = pieces[thingy][0][i].side.get(j).orientation;
        }
      }
      
      //translates every individual piece face
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
      //outer translation fo piece faces
      for(int disdumb = 0; disdumb <= 3; disdumb +=3) {
        pieces[thingy][0][0].change(disdumb, pieces[thingy][0][3], disdumb);
        pieces[thingy][0][1].change(disdumb, pieces[thingy][1][3], disdumb);
        pieces[thingy][0][2].change(disdumb, pieces[thingy][2][3], disdumb);
        pieces[thingy][0][3].change(disdumb, pieces[thingy][3][3], disdumb);
        pieces[thingy][1][3].change(disdumb, pieces[thingy][3][2], disdumb);
        pieces[thingy][2][3].change(disdumb, pieces[thingy][3][1], disdumb);
        pieces[thingy][3][3].change(disdumb, pieces[thingy][3][0], disdumb);
        pieces[thingy][3][2].change(disdumb, pieces[thingy][2][0], disdumb);
        pieces[thingy][3][1].change(disdumb, pieces[thingy][1][0], disdumb);
        pieces[thingy][3][0].change(disdumb, temp[0], disdumb);
        pieces[thingy][2][0].change(disdumb, temp[1], disdumb);
        pieces[thingy][1][0].change(disdumb, temp[2], disdumb);
        pieces[thingy][0][0].change(disdumb, temp[3], disdumb);
        //inner
        //creates a temp copy of all the inner faces
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
        //translates the inner faces
        pieces[thingy][1][1].change(disdumb, temp2[1], disdumb);
        pieces[thingy][1][2].change(disdumb, temp2[3], disdumb);
        pieces[thingy][2][2].change(disdumb, temp2[2], disdumb);
        pieces[thingy][2][1].change(disdumb, temp2[0], disdumb); 
      }
    } else if (str.equals("x")) {
      //////////////////////////////////////////////////////////////////////////////////////
      //creates a temp copy of a side
      temp = new Piece[4];
      for(int i = 0; i < temp.length; i++) {
        temp[i] = new Piece(pieces[i][thingy][0].center);
        for(int j = 0; j < temp[i].side.size(); j++) {
          temp[i].side.get(j).orientation = pieces[i][thingy][0].side.get(j).orientation;
        }
      }
      
      //translates every individual piece face
      pieces[3][thingy][0].change(5, pieces[0][thingy][0], 3);
      pieces[2][thingy][0].change(5, pieces[0][thingy][1], 3);
      pieces[1][thingy][0].change(5, pieces[0][thingy][2], 3);
      pieces[0][thingy][0].change(5, pieces[0][thingy][3], 3);
      pieces[0][thingy][0].change(3, pieces[0][thingy][3], 2);
      pieces[0][thingy][1].change(3, pieces[1][thingy][3], 2);
      pieces[0][thingy][2].change(3, pieces[2][thingy][3], 2);
      pieces[0][thingy][3].change(3, pieces[3][thingy][3], 2);
      pieces[0][thingy][3].change(2, pieces[3][thingy][3], 0);
      pieces[1][thingy][3].change(2, pieces[3][thingy][2], 0);
      pieces[2][thingy][3].change(2, pieces[3][thingy][1], 0);
      pieces[3][thingy][3].change(2, pieces[3][thingy][0], 0);
      pieces[3][thingy][3].change(0, temp[3], 5);
      pieces[3][thingy][2].change(0, temp[2], 5);
      pieces[3][thingy][1].change(0, temp[1], 5);
      pieces[3][thingy][0].change(0, temp[0], 5);
      
      //changes the top pieces
      //outer translation fo piece faces
      for(int disdumb = 1; disdumb <= 4; disdumb += 3) {
        pieces[3][thingy][0].change(disdumb, pieces[0][thingy][0], disdumb);
        pieces[2][thingy][0].change(disdumb, pieces[0][thingy][1], disdumb);
        pieces[1][thingy][0].change(disdumb, pieces[0][thingy][2], disdumb);
        pieces[0][thingy][0].change(disdumb, pieces[0][thingy][3], disdumb);
        pieces[0][thingy][1].change(disdumb, pieces[1][thingy][3], disdumb);
        pieces[0][thingy][2].change(disdumb, pieces[2][thingy][3], disdumb);
        pieces[0][thingy][3].change(disdumb, pieces[3][thingy][3], disdumb);
        pieces[1][thingy][3].change(disdumb, pieces[3][thingy][2], disdumb);
        pieces[2][thingy][3].change(disdumb, pieces[3][thingy][1], disdumb); 
        pieces[3][thingy][3].change(disdumb, temp[3], disdumb);
        pieces[3][thingy][2].change(disdumb, temp[2], disdumb);
        pieces[3][thingy][1].change(disdumb, temp[1], disdumb);
        pieces[3][thingy][0].change(disdumb, temp[0], disdumb);
        //inner
        //creates a temp copy of all the inner faces
        int counter = 0;
        temp2 = new Piece[4];
        for(int i = 1; i <= 2; i++) {
          for(int j = 1; j <= 2; j++) {
            temp2[counter] = new Piece(pieces[i][thingy][j].center);
            for(int p = 0; p < temp2[counter].side.size(); p++) {
              temp2[counter].side.get(p).orientation = pieces[i][thingy][j].side.get(p).orientation;
            }
            counter++;
          }
        }
        //translates the inner faces
        pieces[2][thingy][1].change(disdumb, temp2[0], disdumb);
        pieces[1][thingy][1].change(disdumb, temp2[1], disdumb);
        pieces[1][thingy][2].change(disdumb, temp2[3], disdumb);
        pieces[2][thingy][2].change(disdumb, temp2[2], disdumb); 
      }
    } else {
      temp = new Piece[4];
      for(int i = 0; i < temp.length; i++) {
        temp[i] = new Piece(pieces[i][0][thingy].center);
        for(int j = 0; j < temp[i].side.size(); j++) {
          temp[i].side.get(j).orientation = pieces[i][0][thingy].side.get(j).orientation;
        }
      }
      
      //translates every individual piece face
      pieces[3][0][thingy].change(4, pieces[0][0][thingy], 3);
      pieces[2][0][thingy].change(4, pieces[0][1][thingy], 3);
      pieces[1][0][thingy].change(4, pieces[0][2][thingy], 3);
      pieces[0][0][thingy].change(4, pieces[0][3][thingy], 3);
      pieces[0][0][thingy].change(3, pieces[0][3][thingy], 1);
      pieces[0][1][thingy].change(3, pieces[1][3][thingy], 1);
      pieces[0][2][thingy].change(3, pieces[2][3][thingy], 1);
      pieces[0][3][thingy].change(3, pieces[3][3][thingy], 1);
      pieces[0][3][thingy].change(1, pieces[3][3][thingy], 0);
      pieces[1][3][thingy].change(1, pieces[3][2][thingy], 0);
      pieces[2][3][thingy].change(1, pieces[3][1][thingy], 0);
      pieces[3][3][thingy].change(1, pieces[3][0][thingy], 0);
      pieces[3][3][thingy].change(0, temp[3], 4);
      pieces[3][2][thingy].change(0, temp[2], 4);
      pieces[3][1][thingy].change(0, temp[1], 4);
      pieces[3][0][thingy].change(0, temp[0], 4);
      
      //changes the top pieces
      //outer translation fo piece faces
      for(int disdumb = 2; disdumb <= 5; disdumb += 3) {
        pieces[3][0][thingy].change(disdumb, pieces[0][0][thingy], disdumb);
        pieces[2][0][thingy].change(disdumb, pieces[0][1][thingy], disdumb);
        pieces[1][0][thingy].change(disdumb, pieces[0][2][thingy], disdumb);
        pieces[0][0][thingy].change(disdumb, pieces[0][3][thingy], disdumb);
        pieces[0][0][thingy].change(disdumb, pieces[0][3][thingy], disdumb);
        pieces[0][1][thingy].change(disdumb, pieces[1][3][thingy], disdumb);
        pieces[0][2][thingy].change(disdumb, pieces[2][3][thingy], disdumb);
        pieces[0][3][thingy].change(disdumb, pieces[3][3][thingy], disdumb);
        pieces[0][3][thingy].change(disdumb, pieces[3][3][thingy], disdumb);
        pieces[1][3][thingy].change(disdumb, pieces[3][2][thingy], disdumb);
        pieces[2][3][thingy].change(disdumb, pieces[3][1][thingy], disdumb);
        pieces[3][3][thingy].change(disdumb, pieces[3][0][thingy], disdumb);
        pieces[3][3][thingy].change(disdumb, temp[3], disdumb);
        pieces[3][2][thingy].change(disdumb, temp[2], disdumb);
        pieces[3][1][thingy].change(disdumb, temp[1], disdumb);
        pieces[3][0][thingy].change(disdumb, temp[0], disdumb);
        //inner
        //creates a temp copy of all the inner faces
        int counter = 0;
        temp2 = new Piece[4];
        for(int i = 1; i <= 2; i++) {
          for(int j = 1; j <= 2; j++) {
            temp2[counter] = new Piece(pieces[j][i][thingy].center);
            for(int p = 0; p < temp2[counter].side.size(); p++) {
              temp2[counter].side.get(p).orientation = pieces[j][i][thingy].side.get(p).orientation;
            }
            counter++;
          }
        }
        //translates the inner faces
        pieces[2][1][thingy].change(disdumb, temp2[0], disdumb);
        pieces[1][1][thingy].change(disdumb, temp2[2], disdumb);
        pieces[1][2][thingy].change(disdumb, temp2[3], disdumb);
        pieces[2][2][thingy].change(disdumb, temp2[1], disdumb); 
      }
    }
  }
}
