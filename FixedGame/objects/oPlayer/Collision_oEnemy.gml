if (place_meeting(x, y, oEnemy) && !invincible) {

    // lose life
    lives -= 1;

    // knockback direction away from enemy
    var enemy = instance_place(x, y, oEnemy);
    knock_dir = point_direction(enemy.x, enemy.y, x, y);
    knockback = 15;

    // invincibility frames
    invincible = true;
    inv_timer = room_speed * 1.5;
}

if (lives <= 0) {
    // Game over
    room_goto(rmGameOver);
}