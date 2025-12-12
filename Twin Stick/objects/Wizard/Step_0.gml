if GM.game_paused = true{exit}

node_x = x div 48
node_y = y div 48
if spawn_timer > 0{
spawn_timer -= 1;exit
}

depth = -y
if hit_stun > 0{hit_stun -= 1}

get_move_directions()


hsp = move_direction_h*1;vsp = move_direction_v*1


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
}

move_hitbox()

sprite_set_bbox(sprite_index,23,1,71,95)