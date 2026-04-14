function set_image_scale(arg_scale){
image_xscale = arg_scale;image_yscale = arg_scale
}

function draw_set_aligns(arg_halign,arg_valign){
draw_set_halign(arg_halign);draw_set_valign(arg_valign)
}

function set_tileset_collision(){
tiles = layer_tilemap_get_id("TileMap")
}

function collision_present(x_place,y_place){
if place_meeting(x_place,y_place,[Collision,tiles]){return true}
return false
}

function play_sfx(arg_sfx){
var var_temp = audio_play_sound(arg_sfx,5,false)
return var_temp
}

function play_msc(arg_msc){
var var_temp = audio_play_sound(arg_msc,1,true)
return var_temp
}


function draw_text_with_outline(arg_x,arg_y,arg_text,arg_color){
draw_set_color(c_black)
draw_text(arg_x-2,arg_y,arg_text)
draw_text(arg_x+2,arg_y,arg_text)
draw_text(arg_x,arg_y-2,arg_text)
draw_text(arg_x,arg_y+2,arg_text)
draw_set_color(arg_color)
draw_text(arg_x,arg_y,arg_text)
}

function freeze_frame(arg_freeze_time){
var _t = current_time+arg_freeze_time
while current_time < _t{}
}

function goto_main_menu(){
vrp = 1
repeat(array_length(GM.persistent_object_list)-1){
var_temp = array_get(GM.persistent_object_list,vrp)
if instance_exists(var_temp){instance_destroy(var_temp)}
vrp += 1
}
with GM.player_list[0]{player_destroy_protocol()}
if array_length(GM.player_list) > 1{with GM.player_list[1]{player_destroy_protocol()}}
if array_length(GM.player_list) > 2{with GM.player_list[2]{player_destroy_protocol()}}
if array_length(GM.player_list) > 3{with GM.player_list[3]{player_destroy_protocol()}}
GM.floor_number = 0
GM.player_amount = 0
GM.player_list = []
game_over = false
game_paused = false;pause_alpha = 0;audio_stop_all()
room_goto(r_TitleScreen)
}

function settings_menu(){


var_x = menu_x-32
var_y = menu_y+(menu_cursor*text_gap)
draw_sprite(s_MenuCursor,0,var_x,var_y)
var_x = menu_x+32+(string_width(menu[menu_cursor]))
if menu_cursor > 1{draw_sprite_ext(s_MenuCursor,0,var_x,var_y,-1,1,0,-1,1)}
vrp = 0
repeat(array_length(menu)){
draw_text(menu_x,menu_y+(vrp*text_gap),menu[vrp])

if vrp = 0{
i = 0
repeat(10){
if GM.sfx_gain_saved*10 <= i{var_index = 1}else{var_index = 0}
draw_sprite(s_AudioSquare,var_index,menu_x+string_width("Sound ")+(i*26),menu_y+(vrp*text_gap))
i+= 1}
}

if vrp = 1{
i = 0
repeat(10){
if GM.msc_gain_saved*10 <= i{var_index = 1}else{var_index = 0}
draw_sprite(s_AudioSquare,var_index,menu_x+string_width("Music ")+(i*26),menu_y+(vrp*text_gap))

i+= 1}
}

vrp += 1
}
}