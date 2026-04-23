if (!invincible) {
    lives -= 1;

    invincible = true;
    inv_timer = room_speed * 2; // 2 seconds of protection
}

if (lives <= 0) {
    // Game over
    room_goto(rmGameOver);
} else {
    // Respawn player
    x = 192; 
    y = 640; // adjust to your spawn point
	
	var m = instance_find(oMonster, 0);

	if (m != noone) {
		m.x = x - 600; // put monster behind player
	}
}
