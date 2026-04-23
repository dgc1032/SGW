if (room == rmLvl1 || room == rmLvl2) {

    var m = instance_find(oMonster, 0);

    var cam = view_camera[0];
    var cam_x = camera_get_view_x(cam);

    if (m != noone) {
        // Monster already exists → move it
        m.x = cam_x - 600;
    } else {
        // Monster doesn't exist → create it
        instance_create_layer(cam_x - 600, 450, "Instances", oMonster);
    }

} else {
    // If we're NOT in those rooms, remove the monster
    with (oMonster) instance_destroy();
}