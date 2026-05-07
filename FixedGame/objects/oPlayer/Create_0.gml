hsp = 0;
vsp = 0;
grv = 0.18;
walksp = 1.6;

// Ladder variables
on_ladder = false;

switch (global.character) {
    case 1:
        spr_walk = Beatrice_walk;
        spr_idle = Beatrice_idle;
		spr_climb = Beatrice_climb;
		gun_xoff = 3;
        gun_yoff = -18;
    break;
    case 2:
        spr_walk = Edgar_walk;
        spr_idle = Edgar_idle;
		spr_climb = Edgar_climb;
	    gun_xoff = 3;
        gun_yoff = -25;
    break;
    case 3:
        spr_walk = Emily_walk;
        spr_idle = Emily_idle;
		spr_climb = Emily_climb;
		gun_xoff = 7;
        gun_yoff = -18;
    break;
    case 4:
        spr_walk = George_walk;
        spr_idle = George_idle;
		spr_climb = George_climb;
	    gun_xoff = 5;
        gun_yoff = -32;
    break;
    case 5:
        spr_walk = Lucky_walk;
        spr_idle = Lucky_idle;
		spr_climb = Lucky_climb;
	    gun_xoff = 5;
        gun_yoff = -23;
    break;
    case 6:
        spr_walk = Mable_walk;
        spr_idle = Mable_idle;
		spr_climb = Mable_climb;
	    gun_xoff = 5;
        gun_yoff = -18;
    break;
    case 7:
        spr_walk = Waddles_walk;
        spr_idle = Waddles_idle;
		spr_climb = Waddles_climb;
		gun_xoff = 5;
        gun_yoff = -22;
    break;
    case 8:
        spr_walk = Wallace_walk;
        spr_idle = Wallace_idle;
		spr_climb = Wallace_climb;
	    gun_xoff = 7;
        gun_yoff = -25;
    break;
}

// start idle
sprite_index = spr_idle;
image_speed = 0;

lives = 3;
lives = max(0, lives);

invincible = false;
inv_timer = 0;

spawn_timer = room_speed * 3;
monster_spawned = false;

knockback = 0;
knock_dir = 0;

//Bear Trap Variables
trapped = false;
trap_source = noone;

trap_slow = 0.6;
trap_jump_reduce = 0.85;

// Sprint variables
sprint_mult = 2.8;
is_sprinting = false;

// Sprint stamina system
sprint_time_max = room_speed * 0.5;
sprint_time = sprint_time_max;

sprint_cooldown_max = room_speed * 2;
sprint_cooldown = 0;

can_sprint = true;
