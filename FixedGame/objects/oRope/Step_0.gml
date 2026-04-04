// Pendulum physics
swing_speed += -rope_gravity * sin(degtorad(angle));
angle += swing_speed;

// Apply to sprite
image_angle = angle;