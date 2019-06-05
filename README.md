# 4x4 Rubik's Cube Simulator

This is a 3D simulation of a 4x4 Rubik's Cube. The implementation of the peasy cam allows the perspective to be rotated to view the cube at different angles. It can turn in any direction, though, I was unable to create turn animations due to the complexity of rotating PVectors. The turn function simply shifts the contents (the colors) of each piece onto the target piece. There are 3 functions for horizontal turns, vertical turns, and z-axis turns.

Contorls:
r - right side clockwise
l - left clockwise
u - up clockwise
d - down clockwise
f - front clockwise
b - back clockwise

SHIFT + any of the listed keys - turns the middle layer of that axis

SPACE - reset cube

### Difficulties or opportunities you encountered along the way.

The toughest part was creating the 3 turn functions. Rendering the cube itself wasn't as hard since I looked for help online, but I implemented turning all on my own. It took me about a week to expirement with different methods to turn the cube before deciding on what I thought was the best one. Rather than physically rotate the pieces, which I was unable to implement, I decided to transfer the color of one piece to another piece. The arrangement of the pieces in the cube was too complex for me to figure out a way to create a for loop to handle the translations, so I wrote a line of code for every piece along the edge of a face to translate it while creating a temporary array of same pieces. I then created a double for loop to translate the center pieces. The process of coding the functions was ineffecient and prone to errors, but it worked nonetheless.

### Most interesting piece of your code and explanation for what it does.

```Java
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
}
```
This is the code for one of the turn functions inside of the turn method, specifically the vertical turns (ie. right turns and left turns). Its method takes in an int called "thingy" which indicates which row is being turned. It starts by creating a new copy of a side of pieces and changes all the side colors to that of the original piece. Next, all the outer side pieces are manually changed to their corresponsing piece using the temporary array for the last part. After that, the sides on the top of the face are also changed. Next, an temporary array of copys of the middle-center pieces are created. Then the pieces are translated. This is done twice by a for loop that iterates two times. This shifts the faces on both sides of the row ensuring it will work for all possible turns on that axis. The variable "disdumb" represents the side that is being changed in a certain iteration.
## Built With

* [Processing](https://processing.org/) - The IDE used

## Authors

* **Virinch Pandari** 

## Acknowledgments

https://github.com/GregHilmes/RubiksCube - I adapted the rendering of the cube from his 3x3 model and changed it a bit. The turn functions I created were made independently.
