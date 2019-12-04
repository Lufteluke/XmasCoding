size(1287, 560);
String[] img = loadStrings("image.txt")[0].split("");
loadPixels();
for (int i = 0; i < img.length; i++) {
  pixels[i] = color(255*Integer.parseInt(img[i]));
}
updatePixels();
