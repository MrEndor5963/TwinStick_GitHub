if spawned = false{script_execute_wpn(weapon_sprite);spawned = true}
var_x = x+(sprite_width/2)-(sprite_get_width(weapon_sprite)/2)+sprite_get_xoffset(weapon_sprite)
var_y = y+(sprite_height/2)-(sprite_get_height(weapon_sprite)/2)+sprite_get_yoffset(weapon_sprite)
draw_sprite_ext(weapon_sprite,0,var_x,var_y,1,1,image_angle,image_blend,image_alpha)