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