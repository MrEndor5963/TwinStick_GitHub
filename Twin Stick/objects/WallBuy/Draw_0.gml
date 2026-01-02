if GM.map_x != home_x or GM.map_y != home_y{
x = -3000;exit}
else{
x = xstart
}

if spawned = false{script_execute_wpn(weapon_sprite);spawned = true}
var_x = x+(sprite_width/2)-(sprite_get_width(weapon_sprite)/2)+sprite_get_xoffset(weapon_sprite)
var_y = y+(sprite_height/2)-(sprite_get_height(weapon_sprite)/2)+sprite_get_yoffset(weapon_sprite)
draw_sprite_ext(weapon_sprite,0,var_x,var_y,1,1,image_angle,image_blend,image_alpha)



font = f_Main;draw_set_color(c_white)

if display_text = true{
draw_set_aligns(fa_center,fa_middle)
var_text = "Press A to Buy "+string(weapon_name)+" [Cost "+string(cost)+"]"
GM.display_text = true
GM.display_text_x = x+(sprite_width/2)
GM.display_text_y = y-(font_get_size(font))
GM.display_text_string = var_text
}
display_text = false