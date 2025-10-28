
draw_set_halign(fa_left)
//draw_text(10,20,"floor_max_x:"+string(map_x))
//draw_text(10,40,"floor_max_y:"+string(map_y))
//draw_text(10,60,"room_name:"+string(room_get_name(room)))
//draw_text(100,100,room_get_name(rooms_in_use[4]))
//draw_text(100,120,room_get_name(rooms_in_use[5]))
//draw_text(100,140,room_get_name(rooms_in_use[6]))
//draw_text(100,160,room_get_name(rooms_in_use[7]))
//draw_text(100,180,room_get_name(rooms_in_use[8]))

draw_set_alpha(0.5)
var_xx = 0
repeat(map_size){
var_yy = 0
repeat(map_size){
room_type = ds_grid_get(map,var_xx,var_yy)
if room_type = 0{
//draw_sprite(s_UnVisited,0,var_xx*48,var_yy*48+200)
}
else{
if array_contains(visited_rooms,x_plus_y(var_xx,var_yy)){
draw_sprite(s_Visited,0,var_xx*48,var_yy*48+200)}
else{draw_sprite(s_UnVisited,0,var_xx*48,var_yy*48+200)}
}

if room_type = r_Floor1_Boss{draw_sprite(s_BossMarker,0,var_xx*48,var_yy*48+200)}
if room_type = r_Floor1_Spawn{draw_sprite(s_SpawnMarker,0,var_xx*48,var_yy*48+200)}
if room_type = r_Floor1_KeyRoom{draw_sprite(s_KeyRoomMarker,0,var_xx*48,var_yy*48+200)}
if room_type = r_Shop{draw_sprite(s_ShopMarker,0,var_xx*48,var_yy*48+200)}
if room_type = r_Casino{draw_sprite(s_CasinoMarker,0,var_xx*48,var_yy*48+200)}
if room_type = r_FastFood{draw_sprite(s_FastFoodMarker,0,var_xx*48,var_yy*48+200)}
if room_type = r_Gauntlet{draw_sprite(s_GauntletMarker,0,var_xx*48,var_yy*48+200)}

var_yy += 1}
var_xx += 1}

draw_sprite(s_PlayerMarker,0,map_x*48,map_y*48+232)

draw_set_alpha(1)