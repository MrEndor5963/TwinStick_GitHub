depth = -15990
draw_set_color(c_black)

#region draw black squares out of bounds
	if cam_x < 0 or cam_angle != 0{draw_rectangle(0-cam_size_x,0,0,room_height,false)
	draw_rectangle(0-cam_size_x,0-cam_size_y,0,0,false)
	draw_rectangle(0-cam_size_x,room_height,0,room_height+cam_size_y,false)
	}
	if cam_x > 0 or cam_angle != 0{draw_rectangle(room_width,0,room_width+cam_size_x,room_height,false)
	draw_rectangle(room_width,0-cam_size_y,room_width+cam_size_x,0,false)
	draw_rectangle(room_width,room_height,room_width+cam_size_y,room_height+cam_size_y,false)	
	}
	if cam_y < 0 or cam_angle != 0{draw_rectangle(0,0-cam_size_y,room_width,0,false)}
	if cam_y > 0 or cam_angle != 0{draw_rectangle(0,room_height,room_width,room_height+cam_size_y,false)}
#endregion draw black squares out of bounds

#region Map Screen
//Draw map
if room = r_FloorTransition{
draw_map = true
audio_stop_all()
if gamepad_button_check_pressed_any(gp_face1) or keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_enter) or keyboard_check_pressed(ord("Z")){
	glitch_intensity += 1
	i = 0
	repeat(array_length(player_list)){
			var_player = player_list[i]
			var_player.new_floor = true
			i += 1}
	floor_music_id = play_msc(floor_music)
	room_goto(spawn_room)
}

corp_logo_timer += 0.03
yoff =  1*sin(corp_logo_timer)
if yoff >=0{
draw_sprite_ext(s_RedactedCorp,0,1280-96,720-96,yoff,1,0,-1,1)}
else{draw_sprite_ext(s_RedactedCorp,1,1280-96,720-96,yoff,1,0,-1,1)}
}

if draw_map = true{
draw_map_x = (screen_width/2)-((map_size/2)*72)
draw_map_y = (screen_height/2)-((map_size/2)*72)
draw_set_alpha(0.5)
var_xx = 0
if instance_exists(Player){
repeat(map_size){
var_yy = 0
repeat(map_size){
room_type = ds_grid_get(map,var_xx,var_yy)
if room_type = 0{
//draw_sprite(s_UnVisited,0,var_xx*72,var_yy*72)
}
else{
if array_contains(visited_rooms,x_plus_y(var_xx,var_yy)){
draw_sprite(s_Visited,0,draw_map_x+var_xx*72,draw_map_y+var_yy*72)}
else{draw_sprite(s_UnVisited,0,draw_map_x+var_xx*72,draw_map_y+var_yy*72)}
}

if room_type = r_Floor1_Boss or room_type = r_Floor2_Boss
{draw_sprite(s_BossMarker,0,draw_map_x+var_xx*72,draw_map_y+var_yy*72)}
if room_type = r_Floor1_Spawn{draw_sprite(s_SpawnMarker,0,draw_map_x+var_xx*72,draw_map_y+var_yy*72)}
if room_type = r_Key{draw_sprite(s_KeyRoomMarker,0,draw_map_x+var_xx*72,draw_map_y+var_yy*72)}
if room_type = r_Shop{draw_sprite(s_ShopMarker,0,draw_map_x+var_xx*72,draw_map_y+var_yy*72)}
if room_type = r_Shop{draw_sprite(s_ShopMarker,0,draw_map_x+var_xx*72,draw_map_y+var_yy*72)}
if room_type = r_GunShop{draw_sprite(s_GunShopMarker,0,draw_map_x+var_xx*72,draw_map_y+var_yy*72)}
if room_type = r_Medbay{draw_sprite(s_MedbayMarker,0,draw_map_x+var_xx*72,draw_map_y+var_yy*72)}
if room_type = r_Gauntlet{draw_sprite(s_GauntletMarker,0,draw_map_x+var_xx*72,draw_map_y+var_yy*72)}
//if room_type = r_BoxRoom{draw_sprite(s_BoxRoomMarker_1,0,draw_map_x+var_xx*72,draw_map_y+var_yy*72)}
if room_type = r_Treasure{draw_sprite(s_TreaureMarker,0,draw_map_x+var_xx*72,draw_map_y+var_yy*72)}

var_yy += 1}
var_xx += 1}

draw_sprite(s_PlayerMarker,0,draw_map_x+map_x*72,draw_map_y+map_y*72)
}

draw_set_alpha(1)
draw_map = false
}
#endregion Map screen

#region menus
	draw_set_aligns(fa_left,fa_middle)
	draw_set_font(f_Main)
	font_height = font_get_size(f_Main)
	text_gap = font_height*1.5
if game_over = true or game_paused = true{draw_sprite_ext(s_BlackPixel,0,cam_x,cam_y,screen_width,screen_height,0,-1,0.5)}
if menu_active = true{
	draw_set_color(c_white)
	menu_x = screen_width/2
	menu_y = 240
	
	
	var_x = menu_x-32
	var_y = menu_y+(menu_cursor*text_gap)
	draw_sprite(s_MenuCursor,0,var_x,var_y)
	var_x = menu_x+32+(string_width(menu[menu_cursor]))
	draw_sprite_ext(s_MenuCursor,0,var_x,var_y,-1,1,0,-1,1)
	vrp = 0
	repeat(array_length(menu)){
	draw_text(menu_x,menu_y+(vrp*text_gap),menu[vrp])
	
		if menu[vrp] = "Sound"{
		i = 0
		repeat(10){
		if sfx_gain_saved*10 <= i{var_index = 1}else{var_index = 0}
		draw_sprite(s_AudioSquare,var_index,menu_x+string_width("Sound ")+(i*26),menu_y+(vrp*text_gap))
		i+= 1}
		}

		if menu[vrp] = "Music"{
		i = 0
		repeat(10){
		if msc_gain_saved*10 <= i{var_index = 1}else{var_index = 0}
		draw_sprite(s_AudioSquare,var_index,menu_x+string_width("Music ")+(i*26),menu_y+(vrp*text_gap))
		i+= 1}
		}
	
	vrp += 1}

}

#endregion menus
/*
if room != r_TitleScreen && room != r_FloorTransition && room != r_CharacterSelectScreen{
draw_sprite(s_Cursor,0,mouse_x,mouse_y)}