if GM.game_paused = true or GM.game_over = true{exit}

set_nodes()
if spawn_timer > 0{
spawn_timer -= 1;exit
}

if hit_stun > 0{hit_stun -= 1}



if sprite_index = s_LongHopper && z = 0{move_timer -= 1}
if move_timer <= 0{move_timer = 10
sprite_index = s_LongHopperJump
image_index = 0
}

if sprite_index = s_LongHopperJump && image_index >= image_number-1{
get_move_directions()
hsp = (Player.x-x)/30
hsp = clamp(hsp,-15,15)
vsp = (Player.y-y)/30
vsp = clamp(vsp,-15,15)
zsp = distance_to_object(Player)/-30
if zsp > -5{zsp = -5}
if zsp < -15{zsp = -15}
sprite_index = s_LongHopperAir
}
z += zsp
zsp += grv

if z >= 0{
z = 0
if zsp > 0 && sprite_index = s_LongHopperAir{
sprite_index = s_LongHopperLand
image_index = 0
}
zsp = 0
hsp = 0
vsp = 0
image_xscale = 1
image_xscale = sign(Player.x-x)
}
else{image_index = 0}

if sprite_index = s_LongHopperLand && image_index >= image_number-1{
sprite_index = s_LongHopper;
image_index = 0}


corner_cutting()


if hsp_knockback != 0{hsp_knockback *=0.9};if abs(hsp_knockback) < 0.1{hsp_knockback = 0}
if vsp_knockback != 0{vsp_knockback *=0.9};if abs(vsp_knockback) < 0.1{vsp_knockback = 0}

if collision_present(x+hsp+hsp_knockback,floor_y)
{
	while !collision_present(x+sign(hsp+hsp_knockback)*1,floor_y){x += sign(hsp+hsp_knockback)*1}
	hsp = -hsp
	hsp_knockback = 0
}

x += hsp+hsp_knockback

if collision_present(x,floor_y+vsp+vsp_knockback)
{
	while !collision_present(x,floor_y+sign(vsp+vsp_knockback)*1){floor_y += sign(vsp+vsp_knockback)*1}
	vsp = -vsp
	vsp_knockback = 0
}

floor_y += vsp+vsp_knockback

y = floor_y+z

move_hitbox()

depth = -y-(sprite_get_height(sprite_index)/2)

if z > -(sprite_height/2){hurt_player()}