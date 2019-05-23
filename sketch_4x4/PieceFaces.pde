class PieceFace {
  
  PVector orientation, center;
  PVector[] corners = new PVector[4];
  
  PieceFace(PVector orientation_, PVector center_) {
    orientation = orientation_;
    center = center_;
    
    if(orientation == axes[2]) {
      corners[0] = new PVector(-r, -r, r);
      corners[1] = new PVector(r, -r, r);
      corners[2] = new PVector(r, r, r);
      corners[3] = new PVector(-r, r, r);
    } else if(orientation == axes[5]) {
      corners[0] = new PVector(-r, -r, -r);
      corners[1] = new PVector(r, -r, -r);
      corners[2] = new PVector(r, r, -r);
      corners[3] = new PVector(-r, r, -r);
    } else if(orientation == axes[0]) {
      corners[0] = new PVector(-r, -r, r);
      corners[1] = new PVector(r, -r, r);
      corners[2] = new PVector(r, r, r);
      corners[3] = new PVector(-r, r, r);
    } else if(orientation == axes[3]) {
      corners[0] = new PVector(-r, -r, r);
      corners[1] = new PVector(r, -r, r);
      corners[2] = new PVector(r, r, r);
      corners[3] = new PVector(-r, r, r);
    } else if(orientation == axes[1]) {
      corners[0] = new PVector(-r, -r, r);
      corners[1] = new PVector(r, -r, r);
      corners[2] = new PVector(r, r, r);
      corners[3] = new PVector(-r, r, r);
    } else {
      corners[0] = new PVector(-r, -r, r);
      corners[1] = new PVector(r, -r, r);
      corners[2] = new PVector(r, r, r);
      corners[3] = new PVector(-r, r, r);
    }
  }
  
  void display() {
  }
}
