//Methods outside the class
void removeDeadStar(ArrayList<Particle> stars) {
  int lastIndex = stars.size() - 1;
  for (int i = lastIndex; i > 0; i--) {
    if (stars.get(i).isDead() == true) {
      stars.remove(i);
      //println("star was removed");
    }
  }
}
void removeDeadBurst(ArrayList<Particle> burst) {
  int lastIndex = burst.size() - 1;
  for (int i = lastIndex; i > 0; i--) {
    if (burst.get(i).isDead() == true) {
      burst.remove(i);
      //println("burst was removed");
    }
  }
}
void addStar() {
  float c_time, d_time;
  c_time = millis();
  d_time = c_time-last_star;

  if (last_star == 0 || d_time >= star_timer) {
    color _color = color(random(255), random(255), random(255));
    Particle star = new Particle()
      .setPosition(random(width), random(height))
      .setDiameter(int(random(1, 3)))
      .setVelocity(-1,0)
      .setAcceleration(.5)
      .setFriction(.99)
      .setColor(_color)
      .setLifespan(500);
    stars.add(star);
    last_star = c_time;
  }
}
void addBurst() {
  float c_time, d_time;
  c_time = millis();
  d_time = c_time-last_burst;

  if (last_burst == 0 || d_time >= burst_timer) {
    color _color = color(255,0,0);;
    if (mousePressed) {
      Particle explosion = new Explosion()
        .setPosition(mouseX, mouseY)
        .setLength(10)
        .setWidth(10)
        .setVelocity(random(-1,1),random(-1,1))
        .setAcceleration(.75)
        .setFriction(.99)
        .setColor(_color)
        .setLifespan(125);
      burst.add(explosion);
      last_burst = c_time;
    }
  }
}
