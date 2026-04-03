
vsp = vsp + grv;

// Horizontal Collisions
if (place_meeting(x+hsp, y, oWall)) {
	
	while (!place_meeting (x + sign(hsp), y, oWall)) {
		x = x + sign(hsp);
	}
	hsp = -hsp;
}

x = x + hsp;

// Verital Collisions
if (place_meeting(x, y + vsp, oWall)) {
	
	while (!place_meeting (x, y + sign(vsp), oWall)) {
		y = y + sign(vsp);
	}
	vsp = 0;
}

y = y + vsp;