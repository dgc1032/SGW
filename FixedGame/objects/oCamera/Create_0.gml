cam = view_camera[0];
follow = oPlayer;

view_width = 768;
view_height = 432;

camera_set_view_size(cam, view_width, view_height);

view_w_half = view_width * 0.5;
view_h_half = view_height * 0.5;

h_offset = -100;
v_offset = 0;

xTo = xstart;
yTo = ystart;
x = xTo;
y = yTo;