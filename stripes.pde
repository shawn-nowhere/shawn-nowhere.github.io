int margin = 50;
int numFrames = 20;
 
void setup(){
  size(600,600);
 
}
 
float pixel_color(float x,float y,float t){
  float result = map(sin(TWO_PI*t),-1,1,0,1);
  return 255*result;
}
 
void draw(){
  background(0);
 
  float t = 1.0*(frameCount-1)%numFrames/numFrames;
 
  // Draws every pixel
  for(int i=margin;i<width-margin;i++){
    for(int j=margin;j<height-margin;j++){
      stroke(pixel_color(i,j,t));
      point(i,j);
    }
  }
 
  // Draws a white rectangle
  stroke(255);
  noFill();
  rect(margin,margin,width-2*margin,height-2*margin);
 
  // Saves the frame
  println(frameCount,"/",numFrames);
  saveFrame("frame###.png");
 
  // Stops when all the frames are rendered
  if(frameCount == numFrames){
    println("finished");
    stop();
  }
}
