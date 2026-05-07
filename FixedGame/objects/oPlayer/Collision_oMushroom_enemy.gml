if (place_meeting(x, y, oMushroom_enemy) && !invincible) {

    // lose life
    lives -= 1;

    // knockback direction away from enemy
    var enemy = instance_place(x, y, oMushroom_enemy);
	if (x < enemy.x) {
		knock_dir = 180; // left
	} else {
		knock_dir = 0; // right
	}

	knockback = 15;
	vsp = -4; // upward pop

    // invincibility frames
    invincible = true;
    inv_timer = room_speed * 1.5;
}

if (lives <= 0) {
    global.game_state = "gameover";
    room_goto(rmGameOver);
}