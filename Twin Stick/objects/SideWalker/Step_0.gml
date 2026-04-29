if GM.game_paused = true or GM.game_over = true{exit}

if spawn_timer > 0{
spawn_timer -= 1;exit
}

depth = -y
if hit_stun > 0{hit_stun -= 1}


get_move_directions()
if abs(move_direction_v) < 0.8 {move_direction_v = 0}
else{move_direction_h = 0}

hsp = move_direction_h*7;vsp = move_direction_v*1



corner_cutting()


if hsp_knockback != 0{hsp_knockback *=0.9};if hsp_knockback < 0.1 && hsp_knockback > -0.1{hsp_knockback = 0}
if vsp_knockback != 0{vsp_knockback *=0.9};if vsp_knockback < 0.1 && vsp_knockback > -0.1{vsp_knockback = 0}

if collision_present(x+hsp+hsp_knockback,y)
{
	while !collision_present(x+sign(hsp+hsp_knockback)*1,y){x += sign(hsp+hsp_knockback)*1}
	hsp = 0
	hsp_knockback = 0
}

x += hsp+hsp_knockback

if collision_present(x,y+vsp+vsp_knockback)
{
	while !collision_present(x,y+sign(vsp+vsp_knockback)*1){y += sign(vsp+vsp_knockback)*1}
	vsp = 0
	vsp_knockback = 0
}

y += vsp+vsp_knockback

node_x = x div 64
node_y = y div 64

hsp *= 0.95
vsp *= 0.95

if move_direction_h != 0 or move_direction_v != 0{
image_speed = 1
if move_direction_h != 0{image_xscale = sign(move_direction_h)}

if move_direction_v != 0{sprite_index = s_Sidewalker2}
else{sprite_index = s_Sidewalker1}
}

move_hitbox()