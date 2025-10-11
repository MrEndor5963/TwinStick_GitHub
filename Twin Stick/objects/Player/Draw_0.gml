if sprite_index != s_HazelU{draw_self()}
gun_angle = point_direction(x, y, mouse_x, mouse_y)+recoil
if gun_angle > 90 && gun_angle < 270{draw_sprite_ext(asset_get_index(weapon_sprite),0,x,y,3,-3,gun_angle,-1,1)}
else{draw_sprite_ext(asset_get_index(weapon_sprite),0,x,y,3,3,gun_angle,-1,1)}

if sprite_index = s_HazelU{draw_self()}