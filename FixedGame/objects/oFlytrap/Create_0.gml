// the states of the flytrap
enum FlytrapState {
    IDLE,
    ATTACK,
    HOLD,
    SPIT,
    COOLDOWN
}

state = FlytrapState.IDLE;

detect_range = 80;
hold_time = 90; //1.5 seconds at 60 fps
hold_timer = 0;

target = noone;