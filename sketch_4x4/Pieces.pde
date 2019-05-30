class Piece {
  PVector center;
  ArrayList<PieceFace> side = new ArrayList<PieceFace>();
  
  Piece(PVector center) {
    this.center = center;
    
    for(PVector p: axes) {
      side.add(new PieceFace(p, new PVector(p.x, p.y, p.z)));
    }
  }
  
  void display() {
    pushMatrix();
    translate(center.x, center.y, center.z);
    
    for(PieceFace face : side) {
      face.display();
    }
    
    popMatrix();
  }
  
  void setOrientation() {
    for(int i = 0; i < side.size(); i++)
      side.get(i).setOrientation();
  }
}
