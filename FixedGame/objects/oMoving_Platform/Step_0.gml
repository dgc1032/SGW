// Store previous position
x_prev = x;
y_prev = y;
// Always use positive speed
var spd = abs(move_speed);

// Move
x += spd * plat_dir;

// Reverse at bounds
if (x >= end_x) {
    x = end_x;
    plat_dir = -1;
}

if (x <= start_x) {
    x = start_x;
    plat_dir = 1;
}
