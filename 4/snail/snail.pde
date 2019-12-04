int loc;
int minutes;

void setup() {
  size(1000, 1000);
  int iterations = 100;
  
  for (int i =0; i<iterations; i++) {
    snailMap(); 
  }
  
  int ms = millis()/iterations;
  String str = "Gold get! Total minutes: " + minutes + ". " + ms + "ms avg over " + iterations +  " iterations";
  println(str);
  
  updatePixels(); 
  textSize(30);
  text(str, 20, 900);
  fill(255,255,255);
  save("map.png"); 
}

void snailMap() {
  loc = 0;
  minutes = 0;
  //cx = current x
  int cx = 0;
  int cy = 0;
  
  loadPixels();
  //for (int i = 0; i < pixels.length; i++) pixels[i] = color(0,(sin(i/9)*10)+70,(sin(i/10)*10)+50); //Looks cooler, but takes time
  for (int i = 0; i < pixels.length; i++) pixels[i] = color(0,0,0);
  Table map = loadTable("coords.csv", "header");
  int rows = map.getRowCount();
  //println(rows + " instructions");
  
  for (int i = 0; i < rows; i++) {
    TableRow row = map.getRow(i);
    //gy =goal y
    int gx = row.getInt("x");
    int gy = row.getInt("y");
    //println("Step " +(i+1)+ " of " +rows+ ": Move to x" +gx+ " y" +gy);

    while (cx != gx) {
      if (cx < gx) cx++;
      else cx--;
      getLoc(cx, cy);
      paint();
    }

    while (cy != gy) {
      if (cy < gy) cy++;
      else cy--;
      getLoc(cx, cy);
      paint();
    }
 }
}

void getLoc (int x, int y) {
  loc = x + (y * width);
}

void paint() {
  float read = red(pixels[loc])+1;
  //pixels[loc] = color(read, 204-read*30, 102+read*30); //cooler but slower
  pixels[loc] = color(read, 255, 0);
  minutes += (int)(read);
}
