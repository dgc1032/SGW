if (alive) {

    // Applying the gravity.
    vsp += grav;

    // The horizontal movement.
    hsp = 2 * dir;

    // Checks for the wall collision.
    if (place_meeting(x + hsp, y, oWall)) {
        dir *= -1; // Turns around around
    }

    // Edge detection (prevents walking off of platforms).
    if (!place_meeting(x + dir * 8, y + 16, oWall)) {
        dir *= -1; // turn around at edge
    }

    // Applys the movement.
    x += hsp;

    // The vertical collision.
    if (place_meeting(x, y + vsp, oWall)) {
        while (!place_meeting(x, y + sign(vsp), oWall)) {
            y += sign(vsp);
        }
        vsp = 0;
    }

    y += vsp;
}