if spawned = false{exit}
if GM.next_room = -1{
weapon_yscale = 1
if weapon_draw_sprite = s_0{weapon_draw_sprite = weapon_sprite}

if aim_string != "U"{draw_self();melee.depth = depth-1}
//if recoil != 0{gun_angle = aim_direction+recoil}
//else{gun_angle = aim_direction+recoil_cooldown}
if aim_direction > 90 && aim_direction < 270{weapon_yscale = -1}else{weapon_yscale = 1}
gun_angle = aim_direction+recoil+((deploy_timer*(90/deploy_time))*(weapon_yscale*deploy_direction))

if melee_equipped = false && hp > 0{
direction = gun_angle;speed = 1

if hammer_sprite != s_0{
hammer_angle_offset = (trigger_delay_timer*12)*weapon_yscale
if trigger_delay_timer >= trigger_delay{hammer_angle_offset = 0}
hammer_x_offset = hspeed*(sprite_get_xoffset(hammer_sprite)-sprite_get_xoffset(weapon_draw_sprite))
hammer_y_offset = vspeed*(sprite_get_xoffset(hammer_sprite)-sprite_get_xoffset(weapon_draw_sprite))//xoffset*vspeed works I guess?
draw_sprite_ext(hammer_sprite,0,x+hammer_x_offset,y+hammer_y_offset,1,weapon_yscale,gun_angle+hammer_angle_offset,-1,1)
}

draw_sprite_ext(weapon_draw_sprite,0,x,y,1,weapon_yscale,gun_angle,-1,1)

if slide_sprite != s_0{

slide_offset = slide_distance/(shoot_delay/shoot_timer)
draw_sprite_ext(slide_sprite,0,x+(slide_offset*hspeed),y+(slide_offset*vspeed),1,weapon_yscale,gun_angle,-1,1)
}

speed = 0}


if aim_string = "U"{draw_self();melee.depth = depth+1}

image_xscale = 1;image_yscale = 1
}