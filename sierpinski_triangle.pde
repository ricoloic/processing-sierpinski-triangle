class Triangle {
  PVector p1;
  PVector p2;
  PVector p3;
  PVector p4;
  PVector p5;
  PVector p6;
  
  boolean divided = false;
  Triangle[] triangles = new Triangle[3];

  Triangle(PVector p1, PVector p2, PVector p3) {
    this.p1 = p1;
    this.p2 = p2;
    this.p3 = p3;
    this.p4 = new PVector(
      lerp(p1.x, p2.x, 0.5),
      lerp(p1.y, p2.y, 0.5)
    );
    this.p5 = new PVector(
      lerp(p2.x, p3.x, 0.5),
      lerp(p2.y, p3.y, 0.5)
    );
    this.p6 = new PVector(
      lerp(p1.x, p3.x, 0.5),
      lerp(p1.y, p3.y, 0.5)
    );
  }
  
  void divide() {
    if (this.divided) {
      triangles[0].divide();
      triangles[1].divide();
      triangles[2].divide();
    } else {
      triangles[0] = new Triangle(p1, p4, p6);
      triangles[1] = new Triangle(p4, p2, p5);
      triangles[2] = new Triangle(p6, p5, p3);
      this.divided = true;
    }
  }
  
  void show() {
    if (this.divided) {
      fill(255);
      triangle(p4.x, p4.y, p5.x, p5.y, p6.x, p6.y);
      
      triangles[0].show();
      triangles[1].show();
      triangles[2].show();
    } else {
      fill(0);
      triangle(p1.x, p1.y, p2.x, p2.y, p3.x, p3.y);
    }
  }
}

Triangle t;

void setup() {
  size(800, 800);
  background(255);
  noStroke();

  PVector p1 = new PVector(width / 2, 0);
  PVector p2 = new PVector(width, height);
  PVector p3 = new PVector(0, height);
  
  t = new Triangle(p1, p2, p3);
  t.show();
}

void draw() {}

void keyPressed() {
  if (keyCode == 32) {
    t.divide();
    t.show();
  }
}
