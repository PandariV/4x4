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
      fill(colors[1]);
    else if(orientation == axes[1])
      fill(colors[2]);
    else if (orientation == axes[2])
      fill(colors[5]);
    else if (orientation == axes[3])
      fill(colors[3]);
    else if (orientation == axes[4])
      fill(colors[4]);
    else
      fill(colors[0]);
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
