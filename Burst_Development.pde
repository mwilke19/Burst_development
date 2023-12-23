void setup() {
  size(800, 800);
  background(0);
}
void draw() {
  background(0);
  for (Particle explosion : burst) {
    explosion.run();
  }
  for (Particle star : stars) {
    star.run();
  }
 
  addStar();
  addBurst();
  removeDeadStar(stars);
  removeDeadBurst(burst);
}
