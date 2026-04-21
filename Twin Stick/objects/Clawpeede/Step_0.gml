if GM.game_paused = true or GM.game_over = true{exit}

node_x = x div 48
node_y = y div 48
if spawn_timer > 0{
spawn_timer -= 1;exit
}

depth = -y
if hit_stun > 0{hit_stun -= 1}


hsp = move_direction_h*7;vsp = move_direction_v*7


if hsp != 0{image_angle = 0;image_xscale = sign(hsp)}

if vsp > 0{image_angle = -90*image_xscale};if vsp < 0{image_angle = 90*image_xscale}



corner_cutting()


if hsp_knockback != 0{hsp_knockback *= 0.2};if hsp_knockback < 0.1 && hsp_knockback > -0.1{hsp_knockback = 0}
if vsp_knockback != 0{vsp_knockback *= 0.2};if vsp_knockback < 0.1 && vsp_knockback > -0.1{vsp_knockback = 0}

if collision_present(x+hsp+hsp_knockback,y)
{
	while !collision_present(x+sign(hsp+hsp_knockback)*1,y){x += sign(hsp+hsp_knockback)*1}
	hsp = 0
	hsp_knockback = 0
	get_move_directions()
	move_direction_h = 0
	move_direction_v = round(move_direction_v)
	while move_direction_v = 0{move_direction_v = irandom_range(-1,1)}
}

x += hsp+hsp_knockback

if collision_present(x,y+vsp+vsp_knockback)
{
	while !collision_present(x,y+sign(vsp+vsp_knockback)*1){y += sign(vsp+vsp_knockback)*1}
	vsp = 0
	vsp_knockback = 0
	get_move_directions()
	move_direction_v = 0
	move_direction_h = round(move_direction_h)
	while move_direction_h = 0{move_direction_h = irandom_range(-1,1)}
}

y += vsp+vsp_knockback

move_hitbox()

#region Record Data
for(var i = record_size-1; i > 0; i--){
record_x[i] = record_x[i-1];record_x[0] = x
record_y[i] = record_y[i-1];record_y[0] = y
record_xscale[i] = record_xscale[i-1];record_xscale[0] = image_xscale
record_angle[i] = record_angle[i-1];record_angle[0] = image_angle
}
#endregion End Of Record Data