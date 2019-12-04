int loc;
int minutes;
float g;
float b;

void setup() {
  g = 0;
  b = 0;
  size(1000, 1000);
  loadPixels();
  for (int i = 0; i < pixels.length; i++) pixels[i] = color(0,70,70);
  minutes = 0;
  //cx = current x
  int cx = 0;
  int cy = 0;

  Table map = loadTable("coords.csv", "header");
  int rows = map.getRowCount();
  println(rows + " instructions");
  
  for (int i = 0; i < rows; i++) {
    TableRow row = map.getRow(i);
    //gy =goal y
    int gx = row.getInt("x");
    int gy = row.getInt("y");
    println("Step " +(i+1)+ " of " +rows+ ": Move to x" +gx+ " y" +gy);

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
 println("Gold get! Total minutes: " + minutes);
 updatePixels();
 save("map.png");
}

void getLoc (int x, int y) {
  loc = x + (y * width);
}

void paint() {
  float read = red(pixels[loc])+1;
  g += 0.1;
  b += 0.3;
  pixels[loc] = color(read, (sin(g)*54)+150-(read*10), (sin(b)*32)+70+(read*10));
  //pixels[loc] = color(read, 204-read*30, 102+read*30);
  minutes += (int)(read);
}
