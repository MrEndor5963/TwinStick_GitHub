if GM.game_paused = true or GM.game_over = true{exit}

set_nodes()
if spawn_timer > 0{
spawn_timer -= 1;exit
}

if hit_stun > 0{hit_stun -= 1}


get_move_directions()

//if shoot_timer > 0// && player_target != -1 && collision_line(x,y,player_target.x,player_target.y,[Collision,tiles],false,false) = false
//{shoot_timer -= 1;if shoot_timer = 0{image_index = 0}}

move_timer -= 1

if move_timer = 0{
	while abs(hsp)+ abs(vsp) < 3{
	hsp = irandom_range(-2,2)
	vsp = irandom_range(-2,2)}
}

shoot_timer -= 1
if sprite_index = s_LazerMouth{
image_speed = 1

if shoot_timer = 0{
sprite_index = s_LazerMouthOpening
image_index = 0}

}

if sprite_index = s_LazerMouthOpening && image_speed = 1 && image_index >= image_number-1{
sprite_index = s_LazerMouthShooting
shoot_timer = 15
}

if sprite_index = s_LazerMouthShooting && shoot_timer = 0{
_bullet = instance_create_depth(x,y,depth-1,EnemyBullet)
_bullet.sprite_index = s_LazerMouthLazer
_bullet.is_lazer = true
_bullet.image_angle = point_direction(x,y,Player.x,Player.y)
_bullet.creator = id
_bullet.spawn_timer = 60
}

if sprite_index = s_LazerMouthShooting && shoot_timer = -180{
sprite_index = s_LazerMouthOpening
image_index = image_number-1
image_speed = -1
instance_destroy(_bullet)
}

if sprite_index = s_LazerMouthOpening && image_index <= 0.5 && image_speed = -1{
sprite_index = s_LazerMouth
shoot_timer = 120
}


var_width = sprite_get_width(sprite_index)
var_height = sprite_get_height(sprite_index)
sprite_set_bbox(sprite_index,10,var_height*0.75,var_width-10-1,var_height)

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

hover_timer += 0.05
z = -30-(10*sin(hover_timer))

y = floor_y+z

if move_direction_h != 0{image_xscale = sign(move_direction_h)}

move_hitbox()

depth = -y-(sprite_get_height(sprite_index)/2)

hurt_player()