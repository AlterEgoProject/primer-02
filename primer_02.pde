PImage im;
float degree; // angle og image
float delta=1.0; // speed fo rotation
float DEGREE_MAX=45;
float AXIS_DISTANCE=4; // location of rotation axis from edge 
                       // (1/AXIS_DISTANCE from bottom edge of image)
float axis_x, axis_y;

void setup(){
  frameRate(60); // drawing speed (times/second)
  size(800,450); // window size
  check_parameter(); // NOT NECESSARY (error check)
  // init image
  degree=0;
  imageMode(CENTER); // centerize the location of image
  im = loadImage("face.png");
  im.resize(0,200); // image size
}

void draw(){
  pushMatrix();
  background(255,255,255); // white backgroud
  change_degree();
  rotation();
  popMatrix();
}

// correct error of parameter (NOT NECESSARY)
void check_parameter(){
  if ( abs(delta) > DEGREE_MAX ){
    delta = DEGREE_MAX;
  }
  if ( AXIS_DISTANCE < 2){
    AXIS_DISTANCE = 2;
  }
}

// swiching direction of rotaion
void change_degree(){
  if( abs(degree) >= DEGREE_MAX ){
    delta = -delta;
  } 
  degree+=delta;
}

//calcuration of axis and image location
void rotation(){
  translate(width/2, height/2); // center of window
  // axis location
  axis_x = im.width * ( -1/2 + 1/AXIS_DISTANCE  ) * signum(degree); // imagine vector!
  axis_y = im.height/2; // bottom of image
  translate(axis_x, axis_y); // move to axis point
  rotate(radians(degree));
  // image location
  translate(-axis_x, -axis_y); // back to the center of window
  image(im, 0, 0);
}

// Is argument(f) greater than zero ?
float signum(float f) {
  if (f >= 0) {
    return 1.0;
  } else {
    return -1.0;
  }
}
