if GM.game_paused = true or GM.game_over = true{exit}

node_x = x div 64
node_y = y div 64
if spawn_timer > 0{
spawn_timer -= 1;exit
}

depth = -y
if hit_stun > 0{hit_stun -= 1}



move_timer -= 1
if move_timer <= 0{
move_timer = 60*(hp/hp_max);if move_timer < 10{move_timer = 10}
get_move_directions()
hsp = move_direction_h*15;vsp = move_direction_v*15
}

corner_cutting()


if hsp_knockback != 0{hsp_knockback /= weight};if hsp_knockback < 0.1 && hsp_knockback > -0.1{hsp_knockback = 0}
if vsp_knockback != 0{vsp_knockback /= weight};if vsp_knockback < 0.1 && vsp_knockback > -0.1{vsp_knockback = 0}

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

hsp *= 0.84
vsp *= 0.84

/*
if move_direction_h != 0 or move_direction_v != 0{

if abs(move_direction_h) > abs(move_direction_v){
if move_direction_h < 0{var_string = "L"}
if move_direction_h > 0{var_string = "R"}}
else{
if move_direction_v < 0{var_string = "U"}
if move_direction_v > 0{var_string = "D"}
}


sprite_string = "s_"+string(object_get_name(object_index))+string(var_string)
sprite_index = asset_get_index(sprite_string)
}*/

move_hitbox()