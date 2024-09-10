
// definicion de variables y cantidad de circulos 
int numShapes = 20; 
float[] x = new float[numShapes];
float[] y = new float[numShapes];
float[] size = new float[numShapes];
float[] xSpeed = new float[numShapes];
float[] ySpeed = new float[numShapes];
color[] colors = new color[numShapes];

void setup() {
  size(400, 400);
  //Cambio de RGB A HSB para facilitar el cambio de color con la velocidad 
  colorMode(HSB, 360, 100, 100);
  for (int i = 0; i < numShapes; i++) {
    x[i] = random(width);
    y[i] = random(height);
    
    // Tamaño y velocidad  de los círculos 
    size[i] = random(30, 70); 
    xSpeed[i] = random(-2, 2);
    ySpeed[i] = random(-2, 2);
    // random (360) para un valor aleatorio en HUE 
    colors[i] = color(random(360), 80, 100);
  }
}

void draw() {
  background(255); // Fondo negro

  for (int i = 0; i < numShapes; i++) {
    fill(colors[i]);
    noStroke();
    ellipse(x[i], y[i], size[i], size[i]);

    x[i] += xSpeed[i];
    y[i] += ySpeed[i];

   
    //la velocidad de los círculos se ajusta al HUE 
    //El cambio de color es proporcional a la velocidad de los circulos 
    float speed = dist(0, 0, xSpeed[i], ySpeed[i]);
    float hueShift = map(speed, 0, 2, 0, 50);
    // Operador % permite que HUE se mantenga dentro del rango de 0 a 360 
    colors[i] = color((hue(colors[i]) + hueShift) % 360, 80, 100);

    // Rebote al contacto con los bordes
    if (x[i] < 0 || x[i] > width) xSpeed[i] *= -1;
    if (y[i] < 0 || y[i] > height) ySpeed[i] *= -1;
  }
}
