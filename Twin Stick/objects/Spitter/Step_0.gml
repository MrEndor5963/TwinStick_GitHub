if GM.game_paused = true or GM.game_over = true{exit}

node_x = x div 48
node_y = y div 48
if spawn_timer > 0{
spawn_timer -= 1;exit
}

depth = -y
if hit_stun > 0{hit_stun -= 1}

get_move_directions()
if shoot_timer > 0// && player_target != -1 && collision_line(x,y,player_target.x,player_target.y,[Collision,tiles],false,false) = false
{shoot_timer -= 1;if shoot_timer = 0{image_index = 0}}

if shoot_timer != 0{hsp = move_direction_h*1;vsp = move_direction_v*1}

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

hsp *= 0.94
vsp *= 0.94

move_hitbox()

sprite_set_bbox(sprite_index,23,1,71,95)