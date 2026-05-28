if GM.game_paused = true or GM.game_over = true{exit}

set_nodes()
if spawn_timer > 0{
spawn_timer -= 1;exit
}

if hit_stun > 0{hit_stun -= 1}


if sprite_index = s_AcidWalker{
attack_timer -= 1
move_timer -= 1}

if attack_timer = 0 && sprite_index = s_AcidWalker{
sprite_index = s_AcidWalkerSpit
image_index = 0
hsp = 0
vsp = 0
}

if sprite_index = s_AcidWalkerSpit && image_index >= image_number-1.5{
get_move_directions()
_bullet = instance_create_depth(x,y-64,depth-1,AcidWalkerProjectile)
_bullet.hsp = (Player.x-x)/60
_bullet.vsp = (Player.y-y)/60
_bullet.zsp = distance_to_object(Player)/-60
_bullet.floor_y = y
_bullet.z = -64
_bullet.spin_speed = sign(_bullet.hsp)*-10

sprite_index = s_AcidWalker
attack_timer = irandom_range(120,240)
move_timer = 20}

sprite_set_bbox(sprite_index,60,140,163,223)

if move_timer <= 0{move_timer = irandom_range(50,100)

get_move_directions()
hsp = move_direction_h*10;vsp = move_direction_v*10

}

if move_timer <= 25{hsp = 0;vsp = 0
move_direction_h = 0
move_direction_v = 0
}

corner_cutting()


if hsp_knockback != 0{hsp_knockback *=0.9};if hsp_knockback < 0.1 && hsp_knockback > -0.1{hsp_knockback = 0}
if vsp_knockback != 0{vsp_knockback *=0.9};if vsp_knockback < 0.1 && vsp_knockback > -0.1{vsp_knockback = 0}

if collision_present(x+hsp+hsp_knockback,y)
{
	while !collision_present(x+sign(hsp+hsp_knockback)*1,y){x += sign(hsp+hsp_knockback)*1}
	hsp = -hsp
	hsp_knockback = 0
}

x += hsp+hsp_knockback

if collision_present(x,y+vsp+vsp_knockback)
{
	while !collision_present(x,y+sign(vsp+vsp_knockback)*1){y += sign(vsp+vsp_knockback)*1}
	vsp = -vsp
	vsp_knockback = 0
}

y += vsp+vsp_knockback

if move_direction_h != 0 or move_direction_v != 0 or sprite_index = s_AcidWalkerSpit{
image_speed = 1
if hsp != 0{image_xscale = sign(move_direction_h)}

//if vsp > 0{sprite_index = s_Crawler}
//if vsp < 0{sprite_index = s_Crawler2}
}
else{
image_speed = 0}

move_hitbox()

hurt_player()
sprite_set_bbox(sprite_index,60,22,163,223)

depth = -y-(sprite_get_height(sprite_index)/2)