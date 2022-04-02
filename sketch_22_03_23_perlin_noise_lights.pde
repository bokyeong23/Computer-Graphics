
int cols, rows;
int scl = 20;
int w = 2000;
int h = 1600;

float flying = 0;

float [][] terrain;

void setup() {
  size(600, 600, P3D);
  noStroke();
  fill(204);
  sphereDetail(60);
  
  cols = w / scl;
  rows = h / scl;
  terrain = new float[cols][rows];
  
}

void draw() {
  flying += 0.1;
  float yoff = flying;
  for (int y = 0; y < rows; y++) {
    float xoff = 0;
    for (int x = 0; x < cols; x++) {
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -50, 50);
      xoff += 0.4;


    }
    yoff += 0.24;
  }

  background(51,128,170);
  noStroke();
  fill(0);
  
  if (mousePressed) {
    lights();
    directionalLight(51, 102, 126, -1, 1, 0);
    
  }
  translate(mouseX, mouseY);
  noStroke();
  fill(193,187,227,93);
  
  rotateX(PI/3);
  frameRate(1);
  translate(-w/2, -h/2);
  for (int y = 0; y < rows-1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++) {
      vertex(x*scl, y*scl, terrain[x][y]);
      vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
      
    }
    endShape();
  }
  fill(247,195,234);
translate(w/2,h/2);
translate(mouseX-width/2, (mouseY-height/2)*3);
rotateX(PI/6);
rotateY(PI/3);


sphere(90);
fill(0);

beginCamera();
camera();
rotateX(-PI/6);
endCamera();

translate(200, 200, 0);
rotateY(PI/3);

}


