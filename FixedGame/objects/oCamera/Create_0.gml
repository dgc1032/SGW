cam = view_camera[0];
follow = oPlayer;

// How much of the room you want to see
view_width = 768;   // new width of camera
view_height = 432;  // new height of camera

camera_set_view_size(cam, view_width, view_height);

view_w_half = view_width * 0.5;
view_h_half = view_height * 0.5;

h_offset = -100; // horizontal: player more left
v_offset = 0;   // vertical offset (optional)

xTo = xstart;
yTo = ystart;
x = xTo;
y = yTo;