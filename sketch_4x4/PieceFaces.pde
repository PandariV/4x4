class PieceFace {
  
  PVector orientation, center;
  PVector[] corners = new PVector[4];
  
  PieceFace(PVector orientation, PVector center) {
    this.orientation = orientation;
    this.center = center;
    
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
      corners[0] = new PVector(r, -r, r);
      corners[1] = new PVector(r, -r, -r);
      corners[2] = new PVector(r, r, -r);
      corners[3] = new PVector(r, r, r);
    } else if(orientation == axes[3]) {
      corners[0] = new PVector(-r, -r, r);
      corners[1] = new PVector(-r, -r, -r);
      corners[2] = new PVector(-r, r, -r);
      corners[3] = new PVector(-r, r, r);
    } else if(orientation == axes[1]) {
      corners[0] = new PVector(-r, r, -r);
      corners[1] = new PVector(r, r, -r);
      corners[2] = new PVector(r, r, r);
      corners[3] = new PVector(-r, r, r);
    } else {
      corners[0] = new PVector(-r, -r, -r);
      corners[1] = new PVector(r, -r, -r);
      corners[2] = new PVector(r, -r, r);
      corners[3] = new PVector(-r, -r, r);
    }
  }
  
  void display() {
    pushMatrix();
    
    if (orientation == axes[0])
      fill(blue);
    else if(orientation == axes[1])
      fill(white);
    else if (orientation == axes[2])
      fill(red);
    else if (orientation == axes[3])
      fill(green);
    else if (orientation == axes[4])
      fill(yellow);
    else
      fill(orange);
    stroke(0);
    strokeWeight(7);
    
    translate(center.x, center.y, center.z);
    
    beginShape();
    PVector v;
    
    for(int i = 0; i <corners.length; i++) {
      v = corners[i];
      vertex(v.x, v.y, v.z);
    }
    
    endShape(CLOSE);
    
    popMatrix();
  }
}
