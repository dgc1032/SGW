draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_font(Font2);
draw_text(1150, 50, "Movement: WASD");
draw_text(1150, 80, "Jump: SPACE");
draw_text(1150, 110, "Sprint: SHIFT");
draw_text(1150, 140, "Shoot: Right Click");

draw_set_color(c_green);
draw_text(1150, 170, "Restart = R");

draw_set_color(c_red);
draw_text(1150, 20, "Lives: " + string(lives));