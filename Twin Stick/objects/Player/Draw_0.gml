draw_gun_size = 1

if sprite_index != s_HazelU{draw_self()}
gun_angle = aim_direction+recoil
if gun_angle > 90 && gun_angle < 270{draw_sprite_ext(asset_get_index(weapon_sprite),0,x,y,draw_gun_size,-draw_gun_size,gun_angle,-1,1)}
else{draw_sprite_ext(asset_get_index(weapon_sprite),0,x,y,draw_gun_size,draw_gun_size,gun_angle,-1,1)}

if sprite_index = s_HazelU{draw_self()}

image_xscale = 1;image_yscale = 1
//image_xscale = 2;image_yscale = 2
//draw_set_alpha(0.5)
//mp_grid_draw(global.grid)
//draw_set_alpha(1)