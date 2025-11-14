if GM.next_room = -1{
weapon_yscale = 1

if aim_string != "U"{draw_self();melee.depth = depth-1}
//if recoil != 0{gun_angle = aim_direction+recoil}
//else{gun_angle = aim_direction+recoil_cooldown}
gun_angle = aim_direction+recoil
if aim_direction > 90 && aim_direction < 270{weapon_yscale = -1}else{weapon_yscale = 1}

if melee_equipped = false && hp > 0{
draw_sprite_ext(asset_get_index(weapon_sprite),0,x,y,1,weapon_yscale,gun_angle,-1,1)}


if aim_string = "U"{draw_self();melee.depth = depth+1}

image_xscale = 1;image_yscale = 1
}
//image_xscale = 2;image_yscale = 2
//draw_set_alpha(0.5)
//mp_grid_draw(global.grid)
//draw_set_alpha(1)