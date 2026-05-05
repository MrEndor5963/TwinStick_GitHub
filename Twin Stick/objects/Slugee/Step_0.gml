if GM.game_paused = true or GM.game_over = true{exit}

set_nodes()
if spawn_timer > 0{
spawn_timer -= 1;exit
}

depth = -y
if hit_stun > 0{hit_stun -= 1}


if hsp_knockback != 0{hsp_knockback *=0.9};if hsp_knockback < 0.1 && hsp_knockback > -0.1{hsp_knockback = 0}
if vsp_knockback != 0{vsp_knockback *=0.9};if vsp_knockback < 0.1 && vsp_knockback > -0.1{vsp_knockback = 0}

if collision_present(x+hsp+hsp_knockback,y)
{
	while !collision_present(x+sign(hsp+hsp_knockback)*1,y){x += sign(hsp+hsp_knockback)*1}
	hsp = 0
	hsp_knockback = 0
	while vsp = 0{vsp = 1*irandom_range(-1,1)}
	if collision_present(x,y+vsp){vsp = -vsp}
}

x += hsp+hsp_knockback

if collision_present(x,y+vsp+vsp_knockback)
{
	while !collision_present(x,y+sign(vsp+vsp_knockback)*1){y += sign(vsp+vsp_knockback)*1}
	vsp = 0
	vsp_knockback = 0
	while hsp = 0{hsp = 1*irandom_range(-1,1)}
	if collision_present(x+hsp,y){hsp = -hsp}
}

y += vsp+vsp_knockback

if hsp != 0 or vsp != 0{

if abs(hsp) > abs(vsp){
if hsp < 0{var_string = "L"}
if hsp > 0{var_string = "R"}}
else{
if vsp < 0{var_string = "U"}
if vsp > 0{var_string = "D"}
}


sprite_string = "s_"+string(object_get_name(object_index))+string(var_string)
sprite_index = asset_get_index(sprite_string)
}

move_hitbox()

sprite_set_bbox(sprite_index,23,1,71,95)

trail_timer -= 1
if trail_timer = 0{trail_timer = 30
instance_create_depth(x,y,depth+401,SlugeeTrail)
}