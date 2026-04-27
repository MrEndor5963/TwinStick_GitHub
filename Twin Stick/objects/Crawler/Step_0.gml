if GM.game_paused = true or GM.game_over = true{exit}

node_x = x div 48
node_y = y div 48
if spawn_timer > 0{
spawn_timer -= 1;exit
}

depth = -y
if hit_stun > 0{hit_stun -= 1}



move_timer -= 1
if move_timer = 0{move_timer = 90}
if move_timer = 90{
get_move_directions()
hsp = move_direction_h*5;vsp = move_direction_v*5
}

if move_timer <= 30{hsp = 0;vsp = 0
move_direction_h = 0
move_direction_v = 0
}

corner_cutting()


if hsp_knockback != 0{hsp_knockback *=0.9};if hsp_knockback < 0.1 && hsp_knockback > -0.1{hsp_knockback = 0}
if vsp_knockback != 0{vsp_knockback *=0.9};if vsp_knockback < 0.1 && vsp_knockback > -0.1{vsp_knockback = 0}

if collision_present(x+hsp+hsp_knockback,y)
{
	while !collision_present(x+sign(hsp+hsp_knockback)*1,y){x += sign(hsp+hsp_knockback)*1}
	hsp = -hsp
	hsp_knockback = 0
}

x += hsp+hsp_knockback

if collision_present(x,y+vsp+vsp_knockback)
{
	while !collision_present(x,y+sign(vsp+vsp_knockback)*1){y += sign(vsp+vsp_knockback)*1}
	vsp = -vsp
	vsp_knockback = 0
}

y += vsp+vsp_knockback

if move_direction_h != 0 or move_direction_v != 0{
image_speed = 1
if hsp != 0{image_xscale = sign(move_direction_h)}

if vsp > 0{sprite_index = s_Crawler}
if vsp < 0{sprite_index = s_Crawler2}
}
else{
image_speed = 0}

move_hitbox()