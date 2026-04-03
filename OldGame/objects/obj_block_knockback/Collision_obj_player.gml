// Gets the direction from the block to the player.
var dir = point_direction(x, y, other.x, other.y);

// Force of the knockback.
var force = 8;

// Applies the knockback to the player. 
other.hsp = lengthdir_x(force, dir);
other.vsp = lengthdir_y(force, dir);