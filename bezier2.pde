PVector loc = new PVector(width/2, height/2);
PVector vel = new PVector(0, 0);
PVector acc = new PVector(0, 0);
int i = 0;
int ii = 0;
float v = 0;
float vv = 0;
float angle = 0;
/*boolean sketchFullScreen() {
    return true;
  }*/
 
void setup() {
  size(800, 600);
  background(0);
}
 
void draw() {
  angle += 0.01;
  background(10+5*sin(angle*random(-0.1, 0.1)));
  pushMatrix();
  translate(width/2, height/2);
  for (i=0;i<=20;i++) {
    v = random(-1, 1);
    vv = random(-1, 1);
    acc.x = random(-0.1, 0.1);
    acc.y = random(-0.2, 0.2);
    vel.add(acc);
    constrain(vel.x, -1, 1);
    constrain(vel.y, -1, 1);
    loc.add(vel);
    if (loc.y < -height/4 && acc.y < 0) {
      vel.y = -vel.y;
    }
    if (loc.y > height/4 && acc.y > 0) {
      vel.y = -vel.y;
    }
    if (loc.x < -width/2 && acc.x < 0) {
      vel.x = -vel.x;
    }
    if (loc.x > width/2 && acc.x > 0) {
      vel.x = -vel.x;
    }
    angle += 0.01;
    for (ii=0;ii<=8;ii++) {
      v = random(-1, 1);
      vv = random(-1, 1);
      stroke(255, 25+50*sin(angle*random(-0.1, 0.1)));
      ellipse(ii*(width/8)+i*(width/160)-width/2, (loc.y*v)/2, 1, 1);
      stroke(224, 25+50*sin(angle*random(-0.1, 0.1)));
      ellipse(random(-width/2, width/2), random(-height/2, height/2), 1, 1);
      ellipse(random(-width/2, width/2), random(-height/2, height/2), 1, 1);
    }
    stroke(128, 25+50*sin(angle*random(-0.1, 0.1)));
    fill(0, 0);
    beginShape();
    vertex(-width/2, 0);
    bezierVertex(-width/2, 0, loc.x*vv, loc.y*v, width/2, 0);
    endShape();
    stroke(32, 25+50*sin(angle*random(-0.1, 0.1)));
    beginShape();
    vertex(-width/2, (i-10)*80);
    bezierVertex(-width/2, (i-10)*80, loc.x*vv, loc.y*v, width/2, (i-10)*80);
    endShape();
  }
  popMatrix();
}

