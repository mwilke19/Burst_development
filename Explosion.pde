ArrayList<Particle> burst = new ArrayList<Particle>();
float last_burst = 0;
float burst_timer = 250;
class Explosion extends Particle {
  Explosion() {
    super();
  }
  void run() {
    move(burst);
    render();
    isDead();
    accel();
    frict();
    bounce();
  }
  void accel() {
    x_vel += accel;
    y_vel += accel;
  }
  void frict() {
    //x_vel *= frict;
    y_vel *= frict;
  }
  //Bounce is used with velocity, acceleration and friction
  void bounce() {
    if (x <= d/2 || x >= width-d/2)x_vel*=-1;
    if (y <= d/2 || y >= height-d/2)y_vel*=-1;
  }
  //Moves Particle and decrements lifespan
  void move(ArrayList<Particle> burst) {
    x += x_vel;
    y += y_vel;
    lifespan-=1.0;
  }
  //Draws Particle to the screen
  void render() {
    push();
    fill(_color, lifespan);
    rect(x, y, _width, _length);
    pop();
  }
  //Test to see if the Particle is dead
  boolean isDead() {
    if (lifespan <= 0) {
      //println("Particle is dead");
      //println(frameCount + "......." + stars.size());
      return true;
    } else {
      return false;
    }
  }
}
