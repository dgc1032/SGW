// Stop all movement
hsp = 0;
vsp = 0;

// Teleport player to new location
x = other.target_x;
y = other.target_y;

// Go to the new room
room_goto(other.target_room);