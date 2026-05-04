hsp = 0;
vsp = 0;
grv = 0.18;
walksp = 1.6;

// Ladder variables
on_ladder = false;

//sets the character after select
switch (global.character) {
    case 1:
        sprite_index = Beatrice_walk;
    break;
	case 2:
        sprite_index = Edgar_walk;
    break;
    case 3:
        sprite_index = Emily_walk;
    break;
    case 4:
        sprite_index = George_walk;
    break;
    case 5:
        sprite_index = Lucky_walk;
    break;
    case 6:
        sprite_index = Mable_walk;
    break;
    case 7:
        sprite_index = Waddles_walk;
    break;
    case 8:
        sprite_index = Wallace_walk;
    break;
}

lives = 3;
lives = max(0, lives);

invincible = false;
inv_timer = 0;

spawn_timer = room_speed * 3; // 3 second delay
monster_spawned = false;

knockback = 0;
knock_dir = 0;

//Bear Trap Variables
trapped = false;
trap_source = noone;

trap_slow = 0.6;
trap_jump_reduce = 0.85;

//Sprint variables
sprint_mult = 2.8;  //how much faster sprint is
is_sprinting = false;
