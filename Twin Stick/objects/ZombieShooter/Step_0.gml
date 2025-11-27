if GM.game_paused = true{exit}

node_x = x div 48
node_y = y div 48
if spawn_timer > 0{
spawn_timer -= 1;exit
}

depth = -y
if hit_stun > 0{hit_stun -= 1}

get_move_directions()

move_timer -= 1
if move_timer = 0{move_timer = 50
hsp = move_direction_h*3;vsp = move_direction_v*3
}

shoot_timer -= 1
if shoot_timer = 0{
_bullet = instance_create_depth(x,y,depth-1,Bullet)
_bullet.sprite_index = s_EnemyBullet
_bullet.hurts_player = true
_bullet.hurts_enemy = false
_bullet.image_angle = point_direction(x,y,Player.x,Player.y)
_bullet.bullet_speed = 8
_bullet.creator = id
shoot_timer = 90
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

hsp *= 0.95
vsp *= 0.95

move_hitbox()