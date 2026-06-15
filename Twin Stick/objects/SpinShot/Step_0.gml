if GM.game_paused = true or GM.game_over = true{exit}

set_nodes()
if spawn_timer > 0{
spawn_timer -= 1;exit
}

if hit_stun > 0{hit_stun -= 1}

if sprite_index = s_SpinShotWalk && z = 0{move_timer -= 1
get_move_directions()
hsp = move_direction_h*1
vsp = move_direction_v*1
}

if move_timer <= 0{move_timer = 60
sprite_index = s_SpinShotJump
image_index = 0
}

if sprite_index = s_SpinShotJump && image_index >= 2{
zsp = -8
sprite_index = s_SpinShotAir
shots_left = 3
}

if sprite_index = s_SpinShotAir{
if attack_timer > 0{attack_timer -= 1}
else{hsp *= 0.95;vsp *= 0.95}
if shots_left > 0 && attack_timer <= 0{
shoot_timer -= 1
if shoot_timer <= 0{
get_move_directions()

var_power = 15/shots_left
hsp += move_direction_h*(var_power/-2)
vsp += move_direction_v*(var_power/-2)
_bullet = instance_create_depth(x,y-8,depth-1,EnemyBullet)
_bullet.image_angle = point_direction(x,y,Player.x,Player.y)
_bullet.bullet_speed = var_power
_bullet.creator = id
shots_left -= 1
shoot_timer = 60/shots_left
}
}
}

z += zsp
zsp += grv
if zsp > 0 && shots_left > 0{
zsp = 0
hover_timer += 0.05
z = -110-(10*sin(hover_timer))
if attack_timer > 0{
get_move_directions()
hsp = move_direction_h*2
vsp = move_direction_v*2}
}

if z >= 0{
z = 0
image_angle = 0
if zsp > 0 && sprite_index = s_SpinShotAir{
sprite_index = s_SpinShotLand
image_index = 0
zsp = 0
}
}

image_xscale = 1
image_xscale = sign(Player.x-x)

if sprite_index = s_SpinShotLand && image_index >= image_number-1{
sprite_index = s_SpinShotWalk;
image_index = 0
shoot_timer = 60
attack_timer = 60
}


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

if sprite_index = s_SpinShotAir{
if abs(hsp) > abs(vsp){image_angle += hsp*-3}
else{image_angle += vsp*-3}
}

move_hitbox()

depth = -y-(sprite_get_height(sprite_index)/2)

if z > -(sprite_height/2){hurt_player()}