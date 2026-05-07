if (room == rmLvl1 || room == rmLvl2 || room == rmLvl3 || room == rmLvl4 || room == rmLvl5) {

    var m = instance_find(oMonster, 0);

    var cam = view_camera[0];
    var cam_x = camera_get_view_x(cam);

    if (m != noone) {
        m.x = cam_x - 600;
    } else {
        instance_create_layer(cam_x - 600, 450, "Instances", oMonster);
    }

} else {
    with (oMonster) instance_destroy();
}