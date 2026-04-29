if room = r_FloorTransition{exit}

//direction = image_angle;speed = 1
//floor_y = y+(player_id.floor_y-player_id.y)
//draw_sprite_ext(sprite_index,0,x,floor_y,image_xscale,image_yscale,image_angle+angle_offset,c_black,0.5)
//gun_angle = aim_direction+recoil+((deploy_timer*(90/deploy_time))*(image_yscale*deploy_direction))

if weapon_draw_sprite = s_0{weapon_draw_sprite = sprite_index}

if player_id.hp > 0{
direction = image_angle;speed = 1
#region Reloads and reload animations
if reload_progress >= 0 && mag_loaded = false && angle_offset = 0{
direction = image_angle+(mag_offset*-image_yscale)
speed = 1
draw_x = player_id.x+((mag_xoff-sprite_get_xoffset(sprite_index))*hspeed)+(position_xoffset*hspeed)
draw_y = player_id.y+((mag_xoff-sprite_get_xoffset(sprite_index))*vspeed)+(position_xoffset*vspeed)+(mag_yoff-sprite_get_yoffset(sprite_index))
draw_sprite_ext(mag_sprite,0,draw_x,draw_y,1,image_yscale,image_angle+(mag_offset*-image_yscale),-1,1)}
#endregion


if hammer_sprite != s_0 && melee_attack = false{
revolver_hammer_time_divider = 1//I think?
hammer_angle_offset = ((trigger_delay_timer*12)*image_yscale)*revolver_hammer_time_divider
if trigger_delay_timer >= trigger_delay{hammer_angle_offset = 0}
hammer_x_offset = hspeed*(sprite_get_xoffset(hammer_sprite)-sprite_get_xoffset(weapon_draw_sprite))
hammer_y_offset = vspeed*(sprite_get_yoffset(hammer_sprite)-sprite_get_yoffset(weapon_draw_sprite))//xoffset*vspeed works I guess?
draw_sprite_ext(hammer_sprite,0,x+hammer_x_offset,y+hammer_y_offset,1,image_yscale,image_angle+hammer_angle_offset,-1,1)
}


draw_sprite_ext(weapon_draw_sprite,0,x,y,1,image_yscale,image_angle+angle_offset,-1,1)

direction = image_angle+angle_offset

if slide_sprite != s_0{
draw_sprite_ext(slide_sprite,0,x+(slide_offset*hspeed),y+(slide_offset*vspeed),1,image_yscale,image_angle+angle_offset,-1,1)
}

if pump_sprite != s_0{
draw_sprite_ext(pump_sprite,0,x+(pump_offset*hspeed),y+(pump_offset*vspeed),1,image_yscale,image_angle+angle_offset,-1,1)
}

speed = 0}

angle_offset *= 0.85;if abs(angle_offset) < 0.5{angle_offset = 0}

/*
draw_text(x,y,shoot_timer)
draw_text(x,y+30,slide_offset)