size(275, 183);
PImage img = loadImage("mush.png");
img.loadPixels();    
loadPixels(); 

for (int i = 1; i < pixels.length; i++) {
  color col = img.pixels[i];
  color pcol = img.pixels[i-1];
  
  pixels[i] = color(
    (int)red(pcol) ^ (int)red(col), 
    (int)green(pcol) ^ (int)green(col), 
    (int)blue(pcol) ^ (int)blue(col)
  );
}

pixels[0] = img.pixels[0];
updatePixels();
save("result.png"); 
