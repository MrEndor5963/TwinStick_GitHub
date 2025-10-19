draw_set_halign(fa_left)
draw_text(10,20,"floor_max_x:"+string(map_x))
draw_text(10,40,"floor_max_y:"+string(map_y))
draw_text(10,60,"room_name:"+string(room_get_name(room)))

draw_set_alpha(0.5)
var_xx = 0
repeat(map_size){
var_yy = 0
repeat(map_size){
room_type = ds_grid_get(map,var_xx,var_yy)
if room_type = 0{
draw_sprite(s_LevelChangeBox,0,var_xx*32+32,var_yy*32+32+200)}
else{
draw_sprite(s_SpawnBox,0,var_xx*32+16,var_yy*32+16+200)}

if room_type = r_Floor1_Boss{draw_sprite(s_BossMarker,0,var_xx*32+16,var_yy*32+16+200)}
if room_type = r_Floor1_Spawn{draw_sprite(s_SpawnMarker,0,var_xx*32+16,var_yy*32+16+200)}
if room_type = r_Floor1_KeyRoom{draw_sprite(s_KeyRoomMarker,0,var_xx*32+16,var_yy*32+16+200)}
if room_type = r_Shop{draw_sprite(s_ShopMarker,0,var_xx*32+16,var_yy*32+16+200)}
if room_type = r_Casino{draw_sprite(s_CasinoMarker,0,var_xx*32+16,var_yy*32+16+200)}
if room_type = r_FastFood{draw_sprite(s_FastFoodMarker,0,var_xx*32+16,var_yy*32+16+200)}
if room_type = r_Gauntlet{draw_sprite(s_GauntletMarker,0,var_xx*32+16,var_yy*32+16+200)}

var_yy += 1}
var_xx += 1}

draw_sprite(s_HazelPortrait,0,map_x*32+20,map_y*32+14+232)

draw_set_alpha(1)