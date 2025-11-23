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


function draw_text_with_outline(arg_x,arg_y,arg_text,arg_color){
draw_set_color(c_black)
draw_text(arg_x-2,arg_y,arg_text)
draw_text(arg_x+2,arg_y,arg_text)
draw_text(arg_x,arg_y-2,arg_text)
draw_text(arg_x,arg_y+2,arg_text)
draw_set_color(arg_color)
draw_text(arg_x,arg_y,arg_text)
}

function player_point_change(arg_amount){
array_insert(point_que,0,arg_amount)
array_insert(point_draw_timer,0,0)
}