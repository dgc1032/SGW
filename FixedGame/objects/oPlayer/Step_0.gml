if (global.game_state == "gameover") exit;

if (keyboard_check_pressed(vk_backspace)) {
    lives ++;
}

if (y > room_height + 200) {

    lives--;

    x = 70;
    y = 640;
	
    oMonster.x = oPlayer.x - 800;
    oMonster.y = oPlayer.y -250;

    hsp = 0;
    vsp = 0;
}


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

// Player Input
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_jump = keyboard_check(vk_space);



// Sprint Timers

// Cooldown
if (sprint_cooldown > 0) {
    sprint_cooldown--;
}

// Restore sprint after cooldown
if (sprint_cooldown <= 0 && sprint_time <= 0) {
    sprint_time = sprint_time_max;
    can_sprint = true;
}

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

// Check Ladder
if (place_meeting(x, y, oLadder)) {
    on_ladder = true;
} else {
    on_ladder = false;
}

// Ladder Movement
if (on_ladder) {
    // Disable gravity
    vsp = 0;

    // Get vertical input
    var up = keyboard_check(ord("W"));
    var down = keyboard_check(ord("S"));

    if (up) {
        y -= walksp * 2.5;
    } else if (down) {
        y += walksp * 1.5;
    }
	

} else {
    // Normal Movement
var key_left = keyboard_check(ord("A"));
var key_right = keyboard_check(ord("D"));
var key_jump = keyboard_check(vk_space);
var key_sprint = keyboard_check(vk_shift);

// Base values
var current_speed = walksp;
var current_jump = -5.5;

if (
    key_sprint &&
    (key_left || key_right) &&
    !trapped &&
    can_sprint
) {

    current_speed *= sprint_mult;
    is_sprinting = true;

    sprint_time--;

    // Sprint ran out
    if (sprint_time <= 0) {
        can_sprint = false;
        sprint_cooldown = sprint_cooldown_max;
    }
}
// Trap modifiers
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

    var kx = lengthdir_x(knockback, knock_dir);

    // Horizontal collision
    if (!place_meeting(x + kx, y, oSolid)) {

        x += kx;

    } else {

        // Move safely toward wall
        while (!place_meeting(x + sign(kx), y, oSolid)) {
            x += sign(kx);
        }

        knockback = 0;
    }

    knockback -= 1;
}

// --- LADDER TAKES PRIORITY ---
if (on_ladder) {

    if (keyboard_check(ord("W")) || keyboard_check(ord("S"))) {
        sprite_index = spr_climb;
        image_speed = 1;
    } else {
        sprite_index = spr_climb;
        image_speed = 0;
    }

} else {

    if (abs(hsp) > 0.1) {
        sprite_index = spr_walk;
        image_speed = is_sprinting ? 1.5 : 1;
    } else {
        sprite_index = spr_idle;
        image_speed = 0;
    }

}

if (hsp != 0) {
    image_xscale = sign(hsp);
}