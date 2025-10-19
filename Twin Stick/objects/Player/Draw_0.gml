if sprite_index != s_HazelU{draw_self()}
gun_angle = aim_direction+recoil
if gun_angle > 90 && gun_angle < 270{draw_sprite_ext(asset_get_index(weapon_sprite),0,x,y,4,-4,gun_angle,-1,1)}
else{draw_sprite_ext(asset_get_index(weapon_sprite),0,x,y,4,4,gun_angle,-1,1)}

if sprite_index = s_HazelU{draw_self()}

//draw_set_alpha(0.5)
//mp_grid_draw(global.grid)
//draw_set_alpha(1)