x += horizontal_speed * dir;

if (x < position_from || x >= position_to) {
	dir *= -1;
}