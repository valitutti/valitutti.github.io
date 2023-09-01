let x = 0;

function setup() {
  createCanvas(800, 400);
  textSize(30);
}

function draw() {
  background(220);
  t = frameCount/60;
// ogni secondo va avanti di 60 pixel
  x1 = 600;
  
  if (x <= x1) {
    x = x + update_x_linear_end(2, x, 0, 600);
  }
  rect(x, 81, 63, 63);  
  text("x = " + x, 0, 250);
}


function update_x_linear_end(delta_t, x, x0, x1) {
  delta_x = x1 - x0;
  v = delta_x / (delta_t * 60);  
  text("v = " + v, 0, height - 100);
  if (x < x1) {
    t_new = round(t, 1);
    text("t = " + t_new, 0, 200);
    return v ;
  } else {
    text("t = " + t_new, 0, 200);
    return 0;
  }
}
