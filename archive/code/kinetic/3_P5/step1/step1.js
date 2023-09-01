let x = 0;

function setup() {
  createCanvas(600, 400);
  textSize(30);
}

function draw() {
  background(220);
  t = frameCount/60;
  x = x + update_linear(t, 2, 7);
  rect(x, 81, 63, 63);
  text(round(t, 1), width / 2, height / 2);
}

function update_linear(t, start_time, duration) {
  if (t > start_time && t - start_time < duration) {
    return 1;
  } else {
    return 0;
  }
  
}
