if GM.game_paused = true or room = r_FloorTransition{exit}

x = player_id.x
y = player_id.y
aim_direction = player_id.aim_direction
image_angle = aim_direction+recoil
depth = player_id.depth-1
if player_id.aim_string = "U"{depth += 2}
if aim_direction > 90 && aim_direction < 270{image_yscale = -1}else{image_yscale = 1}
//gun_angle = aim_direction+recoil+((deploy_timer*(90/deploy_time))*(image_yscale*deploy_direction))
sprite_index = player_id.weapons_held[player_id.weapon_equipped]
script_execute_wpn(sprite_index)

weapon_draw_sprite = sprite_index

if player_id.hp > 0{
direction = image_angle;speed = 1
/*
if hammer_sprite != s_0{
hammer_angle_offset = ((trigger_delay_timer*12)*image_yscale)*revolver_hammer_time_divider
if trigger_delay_timer >= trigger_delay{hammer_angle_offset = 0}
hammer_x_offset = hspeed*(sprite_get_xoffset(hammer_sprite)-sprite_get_xoffset(weapon_draw_sprite))
hammer_y_offset = vspeed*(sprite_get_xoffset(hammer_sprite)-sprite_get_xoffset(weapon_draw_sprite))//xoffset*vspeed works I guess?
draw_sprite_ext(hammer_sprite,0,x+hammer_x_offset,y+hammer_y_offset,1,image_yscale,image_angle+hammer_angle_offset,-1,1)
}
*/

draw_sprite_ext(weapon_draw_sprite,0,x,y,1,image_yscale,image_angle,-1,1)
/*
if slide_sprite != s_0{

slide_offset = slide_distance/(shoot_delay/shoot_timer)
draw_sprite_ext(slide_sprite,0,x+(slide_offset*hspeed),y+(slide_offset*vspeed),1,image_yscale,image_angle,-1,1)
}

if pump_sprite != s_0{
pump_offset = 0
draw_sprite_ext(pump_sprite,0,x+(pump_offset*hspeed),y+(pump_offset*vspeed),1,image_yscale,image_angle,-1,1)
}
*/
speed = 0}