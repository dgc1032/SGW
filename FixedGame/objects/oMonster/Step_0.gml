var target = instance_find(oPlayer, 0);

if (target != noone) {

    var dir = point_direction(x, y, target.x, target.y);
    var spd = 2.8;

    x += lengthdir_x(spd, dir);

    // Smoothly move toward player's Y
    y = lerp(y, target.y - 250, 0.03);
}