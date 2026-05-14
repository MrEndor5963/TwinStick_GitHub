if GM.map_x != home_x or GM.map_y != home_y{
x = -3000;exit}
else{
x = xstart
}

if spawned = false{
script_execute_wpn(weapon_id);
sprite_index = weapon_id
spawned = true}
draw_sprite_ext(weapon_id,0,x,y,1,1,image_angle,image_blend,image_alpha)



font = f_Main;draw_set_color(c_white)


if player_id != -1{
var_text = "Press A to Buy "+string(weapon_name)+" [Cost "+string(cost)+"]"
if !instance_exists(display_text){
display_text = instance_create_depth(x-(string_width(display_text)/2),y-(font_get_size(font)),-room_height-100,DisplayText)
display_text.text_string = var_text
display_text.creator = id
display_text.despawn = false
}
}
else{if instance_exists(display_text){display_text.despawn = true}}

player_id = -1