if GM.game_paused = true or GM.game_over = true{exit}

if spawn_timer > 0{
spawn_timer -= 1;exit
}

if hit_stun > 0{hit_stun -= 1}

var_width = sprite_get_width(sprite_index)
var_height = sprite_get_height(sprite_index)
sprite_set_bbox(sprite_index,10,var_height*0.75,var_width-10-1,var_height)

get_move_directions()

if shoot_timer > 0// && player_target != -1 && collision_line(x,y,player_target.x,player_target.y,[Collision,tiles],false,false) = false
{shoot_timer -= 1;}

if move_direction_h != 0{image_xscale = sign(move_direction_h)}

hand_x = 20*move_direction_h
hand_y = 20*move_direction_v

if shoot_timer = 30{
do{
x = irandom_range(64,room_width-64)
y = irandom_range(64,room_height-64)}
until(!place_meeting(x,y,Collision) && distance_to_object(Player) > 100)

}

if shoot_timer = 0{
_bullet = instance_create_depth(x+hand_x,y+hand_y,depth-1,EnemyBullet)
_bullet.image_angle = point_direction(x,y,Player.x,Player.y)
_bullet.bullet_speed = 8
_bullet.creator = id
shoot_timer = 60
}

var_width = sprite_get_width(sprite_index)
var_height = sprite_get_height(sprite_index)

sprite_set_bbox(sprite_index,10,var_height*0.75,var_width-10-1,var_height)

if hsp_knockback != 0{hsp_knockback *=0.9};if abs(hsp_knockback) < 0.1{hsp_knockback = 0}
if vsp_knockback != 0{vsp_knockback *=0.9};if abs(vsp_knockback) < 0.1{vsp_knockback = 0}

if collision_present(x+hsp+hsp_knockback,y)
{
	while !collision_present(x,y){x += sign(hsp+hsp_knockback)*1};
	hsp = 0
	hsp_knockback = 0
}

x += hsp+hsp_knockback

pop_out_of_collision()

if collision_present(x,y+vsp+vsp_knockback)
{
	while !collision_present(x,y){y += sign(vsp+vsp_knockback)*1};

	vsp = 0
	vsp_knockback = 0
}

y += vsp+vsp_knockback
pop_out_of_collision()

set_nodes()


hsp *= 0.94
vsp *= 0.94

move_hitbox()

hurt_player()
sprite_set_bbox(sprite_index,47,15,96,126)

depth = -y-(sprite_get_height(sprite_index)/2)