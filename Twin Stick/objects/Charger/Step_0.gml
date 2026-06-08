if GM.game_paused = true or GM.game_over = true{exit}

set_nodes()
if spawn_timer > 0{
spawn_timer -= 1;exit
}

if hit_stun > 0{hit_stun -= 1}



if sprite_index = s_Charger{move_timer -= 1
get_move_directions()
hsp = move_direction_h*2;vsp = move_direction_v*2
}

if move_timer <= 0 && sprite_index = s_Charger{
get_move_directions()
sprite_index = s_ChargerWindUp
image_index = 0
hsp = 0;vsp = 0
}

if sprite_index = s_ChargerWindUp && image_index >= image_number-1{
get_move_directions()
hsp = move_direction_h*10;vsp = move_direction_v*10
sprite_index = s_ChargerCharging
}




corner_cutting()

if hsp_knockback != 0{hsp_knockback *=0.9};if abs(hsp_knockback) < 0.1{hsp_knockback = 0}
if vsp_knockback != 0{vsp_knockback *=0.9};if abs(vsp_knockback) < 0.1{vsp_knockback = 0}

if collision_present(x+hsp+hsp_knockback,y)
{
	while !collision_present(x+sign(hsp+hsp_knockback)*1,y){x += sign(hsp+hsp_knockback)*1}
	hsp = 0
	hsp_knockback = 0
	sprite_index = s_Charger
	move_timer = 90
}

x += hsp+hsp_knockback

if collision_present(x,y+vsp+vsp_knockback)
{
	while !collision_present(x,y+sign(vsp+vsp_knockback)*1){y += sign(vsp+vsp_knockback)*1}
	vsp = 0
	vsp_knockback = 0
	sprite_index = s_Charger
	move_timer = 90
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