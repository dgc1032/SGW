switch (state) {
	
    case FlytrapState.IDLE:
    
            var p = instance_nearest(x, y, oPlayer);
        
            if (p != noone && point_distance(x, y, p.x, p.y) < detect_range) {
                target = p;
                state = FlytrapState.ATTACK;
            }
    break;

    case FlytrapState.ATTACK:
        if (instance_exists(target)) {
            
            //snaps the player(s) to the position of the mouth
            target.x = lerp(target.x, x, 0.3);
            target.y = lerp(target.y, y, 0.3);
            
            target.can_move = false;
            
            hold_timer = hold_time;
            state = FlytrapState.HOLD;
        }
    break;

    case FlytrapState.HOLD:
        if (instance_exists(target)) {
            
            //keeps the player(s) stuck
            target.x = x;
            target.y = y;
            
            hold_timer--;
            
            if (hold_timer <= 0) {
                state = FlytrapState.SPIT;
            }
        }
    break;    
    
    case FlytrapState.SPIT:
        if (instance_exists(target)) {
            
            target.can_move = true;
            
            //launches the player(s) upwards
        	target.vspeed = -45;
            target.hspeed = -20;
            
            hold_timer = 60;
            state = FlytrapState.COOLDOWN;
        }
    break;
    
    case FlytrapState.COOLDOWN:
        if (instance_exists(target)) {
            hold_timer --;
            if (hold_timer == 0) {
                
                target.vspeed = 0;
                target.hspeed = 0;
                
                target = noone;
                state = FlytrapState.IDLE;
            }
            
        }
        
    break;
}