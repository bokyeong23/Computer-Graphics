//카메라 추가, 기존 코드 속도 조절.
int cols, rows;
int scl = 20;
int w = 2000;
int h = 1600;

float flying = 0;

float [][] terrain;

void setup() {
  size(600, 600, P3D);
  cols = w / scl;
  rows = h / scl;
  terrain = new float[cols][rows];
}

void draw() {
  camera(00.0, mouseY, 220.0, // eyeX, eyeY, eyeZ
         0.0, 0.0, 0.0, // centerX, centerY, centerZ
         0.0, 1.0, 0.0); // upX, upY, upZ
  
  noStroke();
  box(90);
  stroke(255);
  flying -= 0.01;
  float yoff = flying;
  for (int y = 0; y < rows; y++) {
    float xoff = 0;
    for (int x = 0; x < cols; x++) {
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -100, 100);
      xoff += 0.2;
    }
    yoff += 0.2;
  }

  background(0);
  stroke(255);
  fill(0);
  if (mousePressed) {
    lights();
  }
  translate(mouseX, mouseY);
  noStroke();
  fill(255);


  rotateX(PI/3);
  frameRate(1);
  translate(-w/2, -h/2);

  for (int y = 0; y < rows-1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++) {
      vertex(x*scl, y*scl, terrain[x][y]);
      vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
      //rect (x*scl, y*scl, scl, scl);
    }
    endShape();
  }
}
