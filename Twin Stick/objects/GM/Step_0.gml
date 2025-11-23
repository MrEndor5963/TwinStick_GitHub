key_pause = keyboard_check_pressed(vk_escape) or gamepad_button_check_pressed_any(gp_start)
key_left = gamepad_axis_value_any(gp_axislh,false)
key_right = gamepad_axis_value_any(gp_axislh,true)
key_up = gamepad_axis_value_any(gp_axislv,false)
key_down = gamepad_axis_value_any(gp_axislv,true)
key_enter = gamepad_button_check_pressed_any(gp_face1)

if key_pause{
if game_paused = false{
game_paused = true

}
else{
game_paused = false

}
}

if game_paused = true{
key_left_pressed = false;key_right_pressed = false;key_up_pressed = false;key_down_pressed = false

if key_left{key_held_l += 1}else{key_held_l = -1};
if key_held_l = 0{key_held_l = -12;key_left_pressed = true}
if key_right{key_held_r += 1}else{key_held_r = -1};
if key_held_r = 0{key_held_r = -12;key_right_pressed = true}
if key_up{key_held_u += 1}else{key_held_u = -1};
if key_held_u = 0{key_held_u = -12;key_up_pressed = true}
if key_down{key_held_d += 1}else{key_held_d = -1};
if key_held_d = 0{key_held_d = -12;key_down_pressed = true}

if key_up_pressed = true{menu_cursor -= 1;if menu_cursor < 0{menu_cursor = array_length(menu)-1}}
if key_down_pressed = true{menu_cursor += 1;if menu_cursor > array_length(menu)-1{menu_cursor = 0}}

if key_enter{
if menu[menu_cursor] = "Resume"{game_paused = false}
if menu[menu_cursor] = "Character Select"{game_restart()}
if menu[menu_cursor] = "Exit Game"{game_end()}
}
exit}



set_tileset_collision()
view_enabled = true
view_visible[0] = true
clamp_x1 = -cam_size_x;clamp_x2 = room_width+cam_size_x
clamp_y1 = -cam_size_y;clamp_y2 = room_height+cam_size_y



//cam_target_x = Player.x+(Player.stick_aim_x*100)
//cam_target_y = Player.y+(Player.stick_aim_y*100)


//cam_move_x = (cam_target_x - cam_x)*cam_speed
//cam_move_y = (cam_target_y - cam_y)*cam_speed
camera_set_view_size(view_camera[0],cam_size_x,cam_size_y)
camera_set_view_pos(view_camera[0],round(cam_x),round(cam_y))

cam_x += sign(cam_target_x-cam_x)*cam_speed//clamp(cam_x+cam_move_x,clamp_x1+(cam_size_x/2),clamp_x2-(cam_size_x/2))
cam_y += sign(cam_target_y-cam_y)*cam_speed//clamp(cam_y+cam_move_y,clamp_y1+(cam_size_y/2),clamp_y2-(cam_size_y/2))

#region Room Transition Code
if next_room != -1{

array_push(map_visited,x_plus_y(map_x,map_y))	

	var_repeat = 0
	repeat (player_amount){
	var_player = array_get(player_list,var_repeat)
	var_player.can_control = false
	var_repeat += 1}

if next_room = "Left"{
next_room_id= ds_grid_get(map,map_x-1,map_y);
cam_target_x = 0-cam_size_x
cam_target_y = 0
cam_speed = 80
}
if next_room = "Right"{
next_room_id = ds_grid_get(map,map_x+1,map_y);
cam_target_x = room_width
cam_target_y = 0
cam_speed = 80
}
if next_room = "Up"{
next_room_id = ds_grid_get(map,map_x,map_y-1);
cam_target_x = 0
cam_target_y = 0-cam_size_y	
cam_speed = 45
}
if next_room = "Down"{
next_room_id = ds_grid_get(map,map_x,map_y+1)
cam_target_x = 0
cam_target_y = room_height
cam_speed = 45
}

if cam_x = cam_target_x && cam_y = cam_target_y{
	room_goto(next_room_id)
	cam_target_x = 0;cam_target_y = 0
	cam_x = -cam_x
	cam_y = -cam_y

	if next_room = "Left"{map_x -= 1}
	if next_room = "Right"{map_x += 1}
	if next_room = "Up"{map_y -= 1}
	if next_room = "Down"{map_y += 1}

	var_repeat = 0
	repeat (player_amount){
	var_player = array_get(player_list,var_repeat)
	if next_room = "Left"{
	var_player.x = room_width-160
	var_player.y = room_height/2
	}
	if next_room = "Right"{
	var_player.x = 160
	var_player.y = room_height/2
	}
	if next_room = "Up"{
	var_player.x = room_width/2
	var_player.y = room_height-160
	}
	if next_room = "Down"{
	var_player.x = room_width/2
	var_player.y = 160
	}
	var_player.can_control = true
	var_repeat += 1}
	next_room = -1
}

}
#endregion End of Room Transition Code

if next_floor = true{
next_floor = false

rooms_in_use = []
visited_rooms = []

floor_number += 1
floor_map_create()
room_goto(r_FloorTransition)


}