var target = instance_find(oPlayer, 0);

if (target != noone) {
    var dir = point_direction(x, y, target.x, target.y);
    var spd = 2.3;

    x += lengthdir_x(spd, dir);
    y = target_y;
}