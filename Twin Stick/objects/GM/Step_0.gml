set_tileset_collision()

if audio_is_playing(floor_music_id){
pitch = audio_sound_get_pitch(floor_music_id)

if game_paused = true or game_over = true {if pitch > 0.7{pitch -= 0.01}}
if pitch < 1 && glitch_intensity = 0 && game_paused = false{pitch += 0.01}

audio_sound_pitch(floor_music_id,pitch)

if game_paused = true or game_over = true{audio_sound_gain(floor_music_id,msc_gain_saved*(pitch/1.5),0)}
else{audio_sound_gain(floor_music_id,msc_gain_saved,0)}
}

//Civilian - D Class
//Security - C Class
//Soldier - B Class
//Elite Op - A Class
//Containment Breach - S Class
//Classified - Z Class
#region menus and menu control
menu_active = false
if dev_item_menu = true{menu_active = true}

key_pause = keyboard_check_pressed(vk_escape) or gamepad_button_check_pressed_any(gp_start)
if key_pause && room != r_TitleScreen && room != r_CharacterSelectScreen && room != r_FloorTransition{
if game_paused = false{game_paused = true}else{game_paused = false}
glitch_intensity = 0.5
}


if room = r_TitleScreen{
menu_active = true
if sub_menu = 0{
menu[0] = "Start Game"
menu[1] = "?????"
menu[2] = "??????"//"Versus"
menu[3] = "????????"
menu[4] = "???????????"//"Achievments"
menu[5] = "Configuration"}
}

if game_paused = true{
menu_active = true
if sub_menu = 0{
menu = []
menu[0] = "Resume"
menu[1] = "Main Menu"
menu[2] = "Configuration"
}
//Main menu = "Abondon protocol"
//WARING: Performing this action will result in the immediete mutilation and/or dismemberment of any/all living organisims remaining 
//within the facility
//Continue?
}

if game_over = true{
menu_active = true
menu = []
menu[0] = "Retry"
menu[1] = "Main Menu"
}

if menu_active = true{
menu_controls()
if key_down_pressed or key_up_pressed{play_sfx(sfx_Cursor)}

if key_back{
if sub_menu != 0{
sub_menu = 0
play_sfx(sfx_MenuBack)
GM.glitch_intensity = 0.5
}
}

if key_enter{
sub_menu = menu[menu_cursor]

if sub_menu = "Start Game"{
sub_menu = 0
glitch_intensity = 1
room_goto(r_CharacterSelectScreen)}

if sub_menu = "Configuration"{
menu_cursor = 0
glitch_intensity = 0.5
}

if sub_menu = "Fullscreen: Enabled" or sub_menu = "Fullscreen: Disabled"{
if window_get_fullscreen() = false{
window_set_fullscreen(true)}
else{window_set_fullscreen(false)}
glitch_intensity = 0.5
sub_menu = "Configuration"}

//play_sfx(sfx_MenuClick)

	if sub_menu = "Resume"{glitch_intensity = 0.5;game_paused = false;sub_menu = 0}

	if sub_menu = "Retry"{

	glitch_intensity += 1
	repeat (GM.player_amount){
	var1 = player_list[0].player_name
	var2 = player_list[0].input_number
	var3 = player_list[0].player_number
	with player_list[0]{player_destroy_protocol()}
	var_player = instance_create_depth(300,300,depth,Player)
	var_player.player_name = var1
	var_player.input_number = var2
	var_player.player_number = var3
	array_delete(player_list,0,1)}


	floor_number = 0
	next_floor = true
	}

	if sub_menu = "Main Menu"{goto_main_menu();glitch_intensity += 1}

	if sub_menu = "Exit Game"{game_end()}

}

if sub_menu = "Configuration"{
menu = []
menu[0] = "Sound"
menu[1] = "Music"
if window_get_fullscreen() = false{menu[2] = "Fullscreen: Disabled"}
else{menu[2] = "Fullscreen: Enabled"}
//window_set
if menu_cursor = 0{
if key_left_pressed{sfx_gain_saved -= 0.1}
if key_right_pressed{sfx_gain_saved += 0.1}
sfx_gain_saved = clamp(sfx_gain_saved,0,1)
audio_group_set_gain(audiogroup_sfx,sfx_gain_saved,0)
}

if menu_cursor = 1{
if key_left_pressed{msc_gain_saved -= 0.1}
if key_right_pressed{msc_gain_saved += 0.1}
msc_gain_saved = clamp(msc_gain_saved,0,1)
audio_group_set_gain(audiogroup_default,msc_gain_saved,0)
}

}	

}


#endregion menus

#region Camera control
view_enabled = true
view_visible[0] = true
clamp_x1 = 0;clamp_x2 = room_width-cam_size_x
clamp_y1 = 0;clamp_y2 = room_height-cam_size_y

if instance_exists(Player){
var1 = 2
if var1 = 1{
aim_offset_x = Player.stick_aim_x*100
aim_offset_y = Player.stick_aim_y*100
}
if var1 = 2{
aim_offset_x = ((mouse_x-Player.x)*0.4)*(1+Player.key_aim)
aim_offset_y = ((mouse_y-Player.y)*0.4)*(1+Player.key_aim)
//aim_offset_x = clamp(aim_offset_x,-300,300)
//aim_offset_y = clamp(aim_offset_y,-200,200)
}

if free_camera = false && abs(cam_x-cam_target_x) < 5 && abs(cam_y-cam_target_y) < 5{
free_camera = true}

if next_room = -1 && free_camera = true{
cam_target_x = Player.x+(aim_offset_x)-(screen_width/2)
cam_target_y = Player.y+(aim_offset_y)-(screen_height/2)
}

#region Room Transition Code
if next_room != -1 && game_paused = false {

	var_repeat = 0
	repeat (player_amount){
	var_player = array_get(player_list,var_repeat)
	var_player.can_control = false
	var_repeat += 1}

if next_room = "Left"{
next_room_id = ds_grid_get(map,map_x-1,map_y);
cam_target_x = 0-cam_size_x
cam_target_y = 0
}

if next_room = "Right"{
next_room_id = ds_grid_get(map,map_x+1,map_y);
cam_target_x = room_width
cam_target_y = 0
}
if next_room = "Up"{
next_room_id = ds_grid_get(map,map_x,map_y-1);
cam_target_x = 0
cam_target_y = 0-cam_size_y	
}
if next_room = "Down"{
next_room_id = ds_grid_get(map,map_x,map_y+1)
cam_target_x = 0
cam_target_y = room_height
}

if abs(cam_x-cam_target_x) < 10 && abs(cam_y-cam_target_y) < 10{
	array_push(map_visited,x_plus_y(map_x,map_y))
	cam_target_x = 0;cam_target_y = 0
	free_camera = false
	cam_x = -cam_x
	cam_y = -cam_y
	

	if next_room = "Left"{map_x -= 1}
	if next_room = "Right"{map_x += 1}
	if next_room = "Up"{map_y -= 1}
	if next_room = "Down"{map_y += 1}
	room_goto(next_room_id)
}

}
#endregion End of Room Transition Code



}

cam_speed = 0.2;
cam_x += (cam_target_x-cam_x)*cam_speed
cam_y += (cam_target_y-cam_y)*cam_speed
if next_room = -1 && free_camera = true{
cam_x = clamp(cam_x,clamp_x1,clamp_x2)
cam_y = clamp(cam_y,clamp_y1,clamp_y2)}
cam_x += cam_shake_x
cam_y += cam_shake_y
cam_shake_x *= 0.8
cam_shake_y *= 0.8


camera_set_view_angle(view_camera[0],cam_angle)
cam_angle*=0.8
camera_set_view_size(view_camera[0],cam_size_x,cam_size_y)
camera_set_view_pos(view_camera[0],round(cam_x),round(cam_y))

#endregion End of camera control


if instance_exists(Player){
var1 = false;var2 = false;var3 = false;var4 = false
if player_list[0].hp <= 0{var1 = true}
if array_length(player_list) < 2 or player_list[1].hp <= 0{var2 = true}
if array_length(player_list) < 3 or player_list[2].hp <= 0{var3 = true}
if array_length(player_list) < 4 or player_list[3].hp <= 0{var4 = true}

if var1 = true && var2 = true && var3 = true && var4 = true
{game_over = true}
}
else{game_over = false}

time_in_room +=	1;if time_in_room > 999998{time_in_room = 999998}
weapon_tiers = []
if floor_number >= 1{
array_push(weapon_tiers,1)
}

if floor_number >= 2{
array_push(weapon_tiers,2)
}

if floor_number >= 3{
array_push(weapon_tiers,3)
}

if floor_number >= 4{
array_push(weapon_tiers,4)
}

if floor_number >= 5{
array_push(weapon_tiers,5)
}

//floor 9, tiers 1-5
//floor 10, tiers 1-6

	if next_floor = true{
	next_floor = false

	rooms_in_use = []
	visited_rooms = []

	floor_number += 1
	floor_map_create()
	room_goto(r_FloorTransition)
	game_over = false

	}