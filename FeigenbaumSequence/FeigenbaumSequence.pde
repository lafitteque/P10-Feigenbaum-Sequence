// This program draws the graph of the limit points of the Feigenbaum Sequence depending on the coeffichient mu in the sequence.

// Screen and graph parameters
int screenWidth = 1600;
int screenHeight = 1000;
int size_h;
int size_v;
int offset_v = 30;
int offset_h = 30;

// To know if we have to draw  
boolean activation = true;

int iterations = 10000;

float mu = 3;


void setup(){
  
  size_v = screenHeight - 2* offset_v;
  size_h = screenWidth - 2* offset_h;
  
  size(1600,1000);
  background(20);

  drawFeigenbaum();
}


void drawFeigenbaum(){
  // We draw each point in the list given by Feigenbaum in white
  
  if (activation){
    
    for (int c = 0; c<size_h; c++){
      float[] temp = Feigenbaum(0.5,iterations,mu, size_v);
      
      for (int l = 0 ; l < size_v ; l++){
        if (temp[l] != 0){
          stroke(255);
          point(c + offset_h , offset_v + size_v * temp[l]);
        }
      }
      
      mu += 0.0005;
    }
    activation = false;
  }

  
}

float[] Feigenbaum(float x , int n , float mu , int l ){
  // Returns a list containing the last values  of the sequence computed (the size_v last values, so they necessarly fit in the graph)
  
  int compte = 0;
  float[] list = new float[l];
  
  while(compte < n){
    x = mu*x*(1-x);
    
    if (n-compte<=size_v){
      list[-compte+n-1] = x;
    }
    
    compte++;
  }
  
  return list;

}
