if GM.next_room = -1{
draw_gun_size = 1

if aim_string != "U"{draw_self();melee.depth = depth-1}
//if recoil != 0{gun_angle = aim_direction+recoil}
//else{gun_angle = aim_direction+recoil_cooldown}
if melee_equipped = false{
gun_angle = aim_direction+recoil
if gun_angle > 90 && gun_angle < 270{draw_sprite_ext(asset_get_index(weapon_sprite),0,x,y,draw_gun_size,-draw_gun_size,gun_angle,-1,1)}
else{draw_sprite_ext(asset_get_index(weapon_sprite),0,x,y,draw_gun_size,draw_gun_size,gun_angle,-1,1)}
}

if aim_string = "U"{draw_self();melee.depth = depth+1}

image_xscale = 1;image_yscale = 1
}
//image_xscale = 2;image_yscale = 2
//draw_set_alpha(0.5)
//mp_grid_draw(global.grid)
//draw_set_alpha(1)