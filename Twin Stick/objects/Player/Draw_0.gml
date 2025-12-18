if GM.next_room = -1{
weapon_yscale = 1
if weapon_draw_sprite = -99{weapon_draw_sprite = weapon_sprite}

if aim_string != "U"{draw_self();melee.depth = depth-1}
//if recoil != 0{gun_angle = aim_direction+recoil}
//else{gun_angle = aim_direction+recoil_cooldown}
if aim_direction > 90 && aim_direction < 270{weapon_yscale = -1}else{weapon_yscale = 1}
gun_angle = aim_direction+recoil+((deploy_timer*(90/deploy_time))*(weapon_yscale*deploy_direction))

if melee_equipped = false && hp > 0{
direction = gun_angle;speed = 1
draw_sprite_ext(weapon_draw_sprite,0,x,y,1,weapon_yscale,gun_angle,-1,1)
if slide_sprite != s_0{draw_sprite_ext(slide_sprite,0,x+(slide_offset*hspeed),y+(slide_offset*vspeed),1,weapon_yscale,gun_angle,-1,1)}
if animate_slide = true{
if shoot_timer > 3{slide_offset += -4;}
else{slide_offset+= 4}
if slide_offset = 0{animate_slide = false}
}
speed = 0
}


if aim_string = "U"{draw_self();melee.depth = depth+1}

image_xscale = 1;image_yscale = 1
}
//image_xscale = 2;image_yscale = 2
//draw_set_alpha(0.5)
//mp_grid_draw(global.grid)
//draw_set_alpha(1)