if GM.game_paused = true or GM.game_over = true{exit}

if spawn_timer > 0{
spawn_timer -= 1;exit
}

if hit_stun > 0{hit_stun -= 1}

var_width = sprite_get_width(sprite_index)
var_height = sprite_get_height(sprite_index)
sprite_set_bbox(sprite_index,10,var_height*0.75,var_width-10-1,var_height)

get_move_directions()
hsp = move_direction_h*8;vsp = move_direction_v*0.5//0.4
timer = 0

//10






if hsp_knockback != 0{hsp_knockback *=0.9};if hsp_knockback < 0.1 && hsp_knockback > -0.1{hsp_knockback = 0}
if vsp_knockback != 0{vsp_knockback *=0.9};if vsp_knockback < 0.1 && vsp_knockback > -0.1{vsp_knockback = 0}

if collision_present(x+hsp+hsp_knockback,y)
{
	while !collision_present(x,y){x += sign(hsp+hsp_knockback)};x -= sign(hsp+hsp_knockback)
	hsp = 0
	hsp_knockback = 0
}

x += hsp+hsp_knockback

pop_out_of_collision()

if collision_present(x,y+vsp+vsp_knockback)
{
	while !collision_present(x,y){y += sign(vsp+vsp_knockback)*1};y -= sign(vsp+vsp_knockback)

	vsp = 0
	vsp_knockback = 0
}

y += vsp+vsp_knockback
pop_out_of_collision()

set_nodes()

hsp *= 0.95
vsp *= 0.95

//if move_direction_h != 0 or move_direction_v != 0{
//image_speed = 1
//if move_direction_h != 0{image_xscale = sign(move_direction_h)}

//if move_direction_v <= move_direction_h/2{sprite_index = s_Sidewalker2}
//else{sprite_index = s_Sidewalker1}
//}

move_hitbox()
hurt_player()

if sprite_index = s_Sidewalker1 && image_index = 1 or sprite_index = s_Sidewalker2{
sprite_set_bbox(sprite_index,13,23,78,63)
}
else{sprite_set_bbox(sprite_index,10,30,86,63)}

depth = -y-(sprite_get_height(sprite_index)/2)