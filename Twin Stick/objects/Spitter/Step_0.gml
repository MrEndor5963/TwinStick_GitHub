if GM.game_paused = true or GM.game_over = true{exit}


set_nodes()

if spawn_timer > 0{
spawn_timer -= 1;exit
}

depth = -y
if hit_stun > 0{hit_stun -= 1}

var_width = sprite_get_width(sprite_index)
var_height = sprite_get_height(sprite_index)
sprite_set_bbox(sprite_index,var_width*0.25,var_height*0.75,var_width*0.75,var_height)

get_move_directions()

if shoot_timer > 1// && player_target != -1 && collision_line(x,y,player_target.x,player_target.y,[Collision,tiles],false,false) = false
{shoot_timer -= 1;if shoot_timer = 0{image_index = 0}}

mov_spd = 2
//if shoot_timer != 0{
	hsp = move_direction_h*mov_spd
	;vsp = move_direction_v*mov_spd
	//}

if move_direction_h != 0 or move_direction_v != 0{
if move_direction_h != 0{image_xscale = sign(move_direction_h)}

if move_direction_v > 0{
if shoot_timer = 0{sprite_index = s_SpitterSpitF}else{sprite_index = s_SpitterF}
}
if move_direction_v < 0{
if shoot_timer = 0{sprite_index = s_SpitterSpitB}else{sprite_index = s_SpitterB}
}
}

if shoot_timer = 0{
if image_index >= image_number{
_bullet = instance_create_depth(x,y-8,depth-1,EnemyBullet)
_bullet.image_angle = point_direction(x,y,Player.x,Player.y)
_bullet.bullet_speed = 8
_bullet.creator = id
shoot_timer = 60
sprite_index = s_SpitterF
}
}

var_width = sprite_get_width(sprite_index)
var_height = sprite_get_height(sprite_index)

sprite_set_bbox(sprite_index,var_width*0.25,var_height*0.75,var_width*0.75,var_height)

corner_cutting()

if hsp_knockback != 0{hsp_knockback *=0.9};if hsp_knockback < 0.1 && hsp_knockback > -0.1{hsp_knockback = 0}
if vsp_knockback != 0{vsp_knockback *=0.9};if vsp_knockback < 0.1 && vsp_knockback > -0.1{vsp_knockback = 0}

if collision_present(x+hsp+hsp_knockback,y)
{
	while !collision_present(x+sign(hsp+hsp_knockback)*1,y){x += sign(hsp+hsp_knockback)*1};
	if collision_present(x,y){x -= sign(hsp+hsp_knockback)};
	hsp = 0
	hsp_knockback = 0
}

x += hsp+hsp_knockback

if collision_present(x,y+vsp+vsp_knockback)
{
	while !collision_present(x,y+sign(vsp+vsp_knockback)*1){y += sign(vsp+vsp_knockback)*1};
	if collision_present(x,y){y -= sign(hsp+hsp_knockback)}
	vsp = 0
	vsp_knockback = 0
}

y += vsp+vsp_knockback


hsp *= 0.94
vsp *= 0.94

move_hitbox()

sprite_set_bbox(sprite_index,47,15,96,126)