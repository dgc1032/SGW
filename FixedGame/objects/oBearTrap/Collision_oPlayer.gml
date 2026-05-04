if (!triggered) {
    triggered = true;
    attached_player = other;

    // Apply trap to player
    other.trapped = true;
    other.trap_source = id;

    // Little Mario-style bounce
    other.vsp = -2;

    timer = duration;
}    