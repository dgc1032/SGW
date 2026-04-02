// LADDER MOVEMENT
// Start climbing ONLY if pressing W or S
if (near_ladder && (keyboard_check(ord("W")) || keyboard_check(ord("S"))))
{
    on_ladder = true;
}

// Let player leave ladder by moving sideways or jumping
if (on_ladder)
{
    if (keyboard_check(ord("A")) || keyboard_check(ord("D")) || keyboard_check(vk_space))
    {
        on_ladder = false;
    }
}

if (on_ladder)
{
    var _ladder = instance_place(x, y, obj_ladder);
    if (_ladder != noone)
    {
        x = _ladder.x;
    }

    vel_x = 0;
    vel_y = 0;

    if (keyboard_check(ord("W")))
    {
        vel_y = -climb_speed;
    }
    else if (keyboard_check(ord("S")))
    {
        vel_y = climb_speed;
    }

    grounded = true;
}

// If no longer touching ladder, exit climb
if (!near_ladder)
{
    on_ladder = false;
}

// Check for rope collision
var _rope = instance_place(x, y, obj_rope);
if (_rope != noone)
{
    on_rope = true;      // Player is now "latched" to the rope
    rope_obj = _rope;    // Store reference to the rope
    vel_x = 0;           // Stop horizontal movement
    vel_y = 0;           // Stop vertical movement
}

// If on rope, move player to rope tip
if (on_rope && rope_obj != noone)
{
    // Optionally, stick to a point on the rope
    // Here we just use rope's center
    x = rope_obj.x;
    y = rope_obj.y;

    // Optional: rotate player to match rope (if needed)
    image_angle = rope_obj.angle;
}

event_inherited();

// Set the position of the default audio listener to the player's position, for positional audio
// with audio emitters (such as in obj_end_gate)
audio_listener_set_position(0, x, y, 0);
