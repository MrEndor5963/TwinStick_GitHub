view_enabled = true
view_visible[0] = true
clamp_x1 = 0;clamp_x2 = room_width
clamp_y1 = 0;clamp_y2 = room_height

cam_target_x = Player.x+(Player.stick_aim_x*100)
cam_target_y = Player.y+(Player.stick_aim_y*100)

cam_speed = 0.1
cam_move_x = (cam_target_x - cam_x)*cam_speed
cam_move_y = (cam_target_y - cam_y)*cam_speed
camera_set_view_size(view_camera[0],cam_size_x,cam_size_y)
camera_set_view_pos(view_camera[0],round(cam_x-(cam_size_x/2)),round(cam_y-(cam_size_y/2)))

cam_x = clamp(cam_x+cam_move_x,clamp_x1+(cam_size_x/2),clamp_x2-(cam_size_x/2))
cam_y = clamp(cam_y+cam_move_y,clamp_y1+(cam_size_y/2),clamp_y2-(cam_size_y/2))