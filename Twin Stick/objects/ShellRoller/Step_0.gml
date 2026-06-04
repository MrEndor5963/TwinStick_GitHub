if GM.game_paused = true or GM.game_over = true{exit}

set_nodes()
if spawn_timer > 0{
spawn_timer -= 1;exit
}

if hit_stun > 0{hit_stun -= 1}



move_timer -= 1

if sprite_index = s_ShellRollerCrawl{
get_move_directions()
hsp = move_direction_h*1;vsp = move_direction_v*1
}

if move_timer = 0 && sprite_index = s_ShellRollerCrawl{
image_index = 0
sprite_index = s_ShellRollerTucking
}

if sprite_index = s_ShellRollerTucking && image_index >= image_number-1 && image_speed = 1{
sprite_index = s_ShellRollerTucked
shell_active = true;blood_color = c_white
move_timer = 150
get_move_directions()
hsp = move_direction_h*15;vsp = move_direction_v*15
wall_bounces = 0
}

if sprite_index = s_ShellRollerTucked && wall_bounces >= 5 && abs(hsp) < 1 && abs(vsp) < 1{
image_speed = -1
sprite_index = s_ShellRollerTucking
image_index = image_number-1
shell_active = false;blood_color = $DAB6E5
}

if sprite_index = s_ShellRollerTucking && image_index <= 1 && image_speed =- 1{
sprite_index = s_ShellRollerCrawl
image_speed = 1
move_timer = 160
}

if sprite_index = s_ShellRollerTucked{
if abs(hsp) > abs(vsp){image_angle -= hsp/1.5}
else{image_angle -= vsp/1.5}
}
else{image_angle = 0}


corner_cutting()

if hsp_knockback != 0{hsp_knockback *=0.9};if abs(hsp_knockback) < 0.1{hsp_knockback = 0}
if vsp_knockback != 0{vsp_knockback *=0.9};if abs(vsp_knockback) < 0.1{vsp_knockback = 0}

if wall_bounces >= 5{hsp *= 0.9;vsp *= 0.9}

if collision_present(x+hsp+hsp_knockback,y)
{
	while !collision_present(x+sign(hsp+hsp_knockback)*1,y){x += sign(hsp+hsp_knockback)*1}
	hsp = -hsp
	hsp_knockback = 0
	wall_bounces += 1
}

x += hsp+hsp_knockback

if collision_present(x,y+vsp+vsp_knockback)
{
	while !collision_present(x,y+sign(vsp+vsp_knockback)*1){y += sign(vsp+vsp_knockback)*1}
	vsp = -vsp
	vsp_knockback = 0
	wall_bounces += 1
}

y += vsp+vsp_knockback


if move_direction_h != 0 or move_direction_v != 0{
if hsp != 0{image_xscale = sign(move_direction_h)}

//if vsp > 0{sprite_index = s_Crawler}
//if vsp < 0{sprite_index = s_Crawler2}
}

move_hitbox()

depth = -y-(sprite_get_height(sprite_index)/2)

hurt_player()