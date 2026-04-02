ang_vel += -gravity_force * sin(degtorad(angle));
ang_vel *= damping;
angle += ang_vel;

image_angle = angle;

