if (triggered) {

    // Make sure player still exists
    if (!instance_exists(attached_player)) {
        instance_destroy();
        exit;
    }

    // Stick trap to player's feet
    x = attached_player.x;
    y = attached_player.bbox_bottom - 2;

    // Countdown
    timer--;

    if (timer <= 0) {

        // Release player safely
        if (instance_exists(attached_player)) {
            attached_player.trapped = false;
            attached_player.trap_source = noone;
        }

        instance_destroy();
    }
}