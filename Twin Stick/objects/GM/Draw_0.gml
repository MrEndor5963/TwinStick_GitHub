depth = -15990
draw_set_color(c_black)
draw_rectangle(0-cam_size_x,0,0,cam_size_y,false)
draw_rectangle(room_width,0,room_width+cam_size_x,cam_size_y,false)
draw_rectangle(0,0-cam_size_y,cam_size_x,0,false)
draw_rectangle(0,room_height,cam_size_x,room_height+cam_size_y,false)

draw_set_color(c_white)
font = f_Main
draw_set_halign(fa_left)
//draw_text(10,20,"floor_max_x:"+string(map_x))
//draw_text(10,40,"floor_max_y:"+string(map_y))
//draw_text(10,60,"room_name:"+string(room_get_name(room)))
//draw_text(100,100,room_get_name(rooms_in_use[4]))
//draw_text(100,120,room_get_name(rooms_in_use[5]))
//draw_text(100,140,room_get_name(rooms_in_use[6]))
//draw_text(100,160,room_get_name(rooms_in_use[7]))
//draw_text(100,180,room_get_name(rooms_in_use[8]))

draw_set_aligns(fa_center,fa_middle)

if game_paused = true{
if pause_alpha < 1{pause_alpha += 0.05}}
else{
if pause_alpha > 0{pause_alpha -= 0.05}}


if pause_alpha > 0{
draw_sprite_ext(s_BlackPixel,0,0,0,screen_width,screen_height,0,-1,pause_alpha/2)
draw_set_alpha(pause_alpha)
var_x = (screen_width/2)-32-(string_width(menu[menu_cursor])/2)
var_y = 240+(menu_cursor*(font_get_size(f_Main)*1.5))
draw_sprite(s_MenuCursor,0,var_x,var_y)
var_x = (screen_width/2)+32+(string_width(menu[menu_cursor])/2)
draw_sprite_ext(s_MenuCursor,0,var_x,var_y,-1,1,0,-1,pause_alpha)
draw_text(screen_width/2,200,"Game Paused")
vrp = 0
repeat(array_length(menu)){
draw_text(screen_width/2,240+(vrp*(font_get_size(f_Main)*1.5)),menu[vrp])
vrp += 1}
}

draw_set_alpha(1)
//end of pause menu

#region Game Over
if game_over = true{
draw_sprite_ext(s_BlackPixel,0,0,0,screen_width,screen_height,0,-1,0.5)
var_x = (screen_width/2)-32-(string_width(menu[menu_cursor])/2)
var_y = 240+(menu_cursor*(font_get_size(f_Main)*1.5))
draw_sprite(s_MenuCursor,0,var_x,var_y)
var_x = (screen_width/2)+32+(string_width(menu[menu_cursor])/2)
draw_sprite_ext(s_MenuCursor,0,var_x,var_y,-1,1,0,-1,1)
draw_text(screen_width/2,200,"Game Over")
vrp = 0
repeat(array_length(menu)){
draw_text(screen_width/2,240+(vrp*(font_get_size(f_Main)*1.5)),menu[vrp])
vrp += 1}
}

#endregion End of Gmae over


//Draw map
if draw_map = true or room = r_FloorTransition{
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
//draw_sprite(s_UnVisited,0,var_xx*48,var_yy*48)
}
else{
if array_contains(visited_rooms,x_plus_y(var_xx,var_yy)){
draw_sprite(s_Visited,0,draw_map_x+var_xx*72,draw_map_y+var_yy*72)}
else{draw_sprite(s_UnVisited,0,draw_map_x+var_xx*72,draw_map_y+var_yy*72)}
}

if room_type = r_Floor1_Boss{draw_sprite(s_BossMarker,0,draw_map_x+var_xx*72,draw_map_y+var_yy*72)}
if room_type = r_Floor1_Spawn{draw_sprite(s_SpawnMarker,0,draw_map_x+var_xx*72,draw_map_y+var_yy*72)}
if room_type = r_Floor1_KeyRoom{draw_sprite(s_KeyRoomMarker,0,draw_map_x+var_xx*72,draw_map_y+var_yy*72)}
if room_type = r_Shop{draw_sprite(s_ShopMarker,0,draw_map_x+var_xx*72,draw_map_y+var_yy*72)}
if room_type = r_Casino{draw_sprite(s_CasinoMarker,0,draw_map_x+var_xx*72,draw_map_y+var_yy*72)}
if room_type = r_FastFood{draw_sprite(s_FastFoodMarker,0,draw_map_x+var_xx*72,draw_map_y+var_yy*72)}
if room_type = r_Gauntlet{draw_sprite(s_GauntletMarker,0,draw_map_x+var_xx*72,draw_map_y+var_yy*72)}
if room_type = r_BoxRoom{draw_sprite(s_BoxRoomMarker,0,draw_map_x+var_xx*72,draw_map_y+var_yy*72)}
if room_type = r_Treasure{draw_sprite(s_TreaureMarker,0,draw_map_x+var_xx*72,draw_map_y+var_yy*72)}

var_yy += 1}
var_xx += 1}

draw_sprite(s_PlayerMarker,0,draw_map_x+map_x*72,draw_map_y+map_y*72)
}

draw_set_alpha(1)
draw_map = false
}

////////////////////////






global.moment += global.spd
if global.moment >= sprite_get_width(global.noise){
	global.moment = 0
}

if display_text = true{draw_text(display_text_x,display_text_y,display_text_string)}

if description_text = true{draw_text(description_text_x,description_text_y,description_text_string)}

shader_reset()

////////////////////////////

if room = r_FloorTransition{
if gamepad_button_check_pressed_any(gp_face1) or keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_enter) or keyboard_check_pressed(ord("Z")){
glitch_intensity += 1
room_goto(spawn_room)}

corp_logo_timer += 0.03
yoff =  1*sin(corp_logo_timer)
if yoff >=0{
draw_sprite_ext(s_RedactedCorp,0,1280-96,720-96,yoff,1,0,-1,1)}
else{draw_sprite_ext(s_RedactedCorpBack,0,1280-96,720-96,yoff,1,0,-1,1)}
}