if GM.game_paused = true or GM.game_over = true{exit}

set_nodes()
if spawn_timer > 0{
spawn_timer -= 1;exit
}

if hit_stun > 0{hit_stun -= 1}


get_move_directions()


var_width = sprite_get_width(sprite_index)
var_height = sprite_get_height(sprite_index)
sprite_set_bbox(sprite_index,10,var_height*0.75,var_width-10-1,var_height)

corner_cutting()

hsp += hsp_knockback;hsp_knockback = 0
vsp += vsp_knockback;vsp_knockback = 0

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

hover_timer += 0.05
z = -30-(10*sin(hover_timer))

y = floor_y+z

if move_direction_h != 0{image_xscale = sign(move_direction_h)}

move_hitbox()

depth = -y-(sprite_get_height(sprite_index)/2)

hurt_player()