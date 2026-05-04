if (!monster_spawned) {
    spawn_timer--;

    if (spawn_timer <= 0) {
        monster_spawned = true;
    }
}

if (invincible) {
    inv_timer--;

    if (inv_timer <= 0) {
        invincible = false;
    }
}

// Get Player Input
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_jump = keyboard_check(vk_space);





// Calculate Movement
var move = key_right - key_left;

hsp = move * walksp;

vsp = vsp + grv;

if (place_meeting (x, y+1, oSolid)) && (key_jump) {
	vsp = -5.5;
}



// Horizontal Collisions
if (place_meeting(x+hsp, y, oSolid)) {
	
	while (!place_meeting (x + sign(hsp), y, oSolid)) {
		x = x + sign(hsp);
	}
	hsp = 0;
}

x = x + hsp;

// Verital Collisions
if (place_meeting(x, y + vsp, oSolid)) {
	
	while (!place_meeting (x, y + sign(vsp), oSolid)) {
		y = y + sign(vsp);
	}
	vsp = 0;
}

y = y + vsp;

// Check if standing on a platform
var plat = instance_place(x, y + 1, oMoving_Platform);

if (plat != noone) {
    var dx = plat.x - plat.x_prev;
    var dy = plat.y - plat.y_prev;

    x += dx;
    y += dy;
}

// --- Check Ladder ---
if (place_meeting(x, y, oLadder)) {
    on_ladder = true;
} else {
    on_ladder = false;
}

// --- Ladder Movement ---
if (on_ladder) {
    // Disable gravity
    vsp = 0;

    // Get vertical input
    var up = keyboard_check(ord("W"));
    var down = keyboard_check(ord("S"));

    if (up) {
        y -= walksp * 2;  // move up
    } else if (down) {
        y += walksp;  // move down
    }
} else {
    // --- Normal Movement ---
var key_left = keyboard_check(ord("A"));
var key_right = keyboard_check(ord("D"));
var key_jump = keyboard_check(vk_space);
var key_sprint = keyboard_check(vk_shift);

// Base values
var current_speed = walksp;
var current_jump = -5.5;

// Sprint (only if moving and not trapped)
is_sprinting = false;

if (key_sprint && (key_left || key_right) && !trapped) {
    current_speed *= sprint_mult;
    is_sprinting = true;
}

// Trap modifiers (override sprint feel a bit)
if (trapped) {
    current_speed *= trap_slow;
    current_jump *= trap_jump_reduce;
}

// Apply movement
hsp = (key_right - key_left) * current_speed;
vsp += grv;

// Jump
if (place_meeting(x, y + 1, oSolid)) {
    if (key_jump) {
        vsp = current_jump;
    }
}

    // Horizontal collision
    if (place_meeting(x + hsp, y, oSolid)) {
        while(!place_meeting(x + sign(hsp), y, oSolid)) x += sign(hsp);
        hsp = 0;
    }
    x += hsp;

    // Vertical collision
    if (place_meeting(x, y + vsp, oSolid)) {
        while(!place_meeting(x, y + sign(vsp), oSolid)) y += sign(vsp);
        vsp = 0;
    }
    y += vsp;
}

if (knockback > 0) {
    x += lengthdir_x(knockback, knock_dir);
    y += lengthdir_y(knockback, knock_dir);

    knockback -= 1;
}