camera_box = instance_place(x,y,CameraBox)
if camera_box != noone{
GM.clamp_x1 = camera_box.clamp_x1;
GM.clamp_x2 = camera_box.clamp_x2
GM.clamp_y1 = camera_box.clamp_y1
GM.clamp_y2 = camera_box.clamp_y2
}