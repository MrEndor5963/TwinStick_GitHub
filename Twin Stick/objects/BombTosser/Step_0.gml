if GM.game_paused = true or GM.game_over = true{exit}

set_nodes()
if spawn_timer > 0{
spawn_timer -= 1;exit
}

depth = -y
if hit_stun > 0{hit_stun -= 1}



move_timer -= 1
get_move_directions()



if collision_line(x,y,player_target.x,player_target.y,[Collision,tiles],false,false) = noone{
if abs(hsp) < 0.8 && abs(vsp) < 0.8{hsp = move_direction_h*5;vsp = move_direction_v*5}
if abs(Player.x-x) < 200{hsp = -move_direction_h*6}
if abs(Player.x-x) < 200 && distance_to_object(Player) < 100{
if x < room_width/3{hsp = 6}
if x > (room_width/3)*2{hsp = -6}
}
if abs(Player.y-y) < 200{vsp = -move_direction_v*6}
if abs(Player.y-y) < 200 && distance_to_object(Player) < 100{
if y < room_height/3{vsp = 6}
if y > (room_height/3)*2{vsp = -6}
}
if !instance_exists(bomb){
bomb = instance_create_depth(x,y,depth-10,BombTosserBomb)
bomb.creator = id
bomb.hsp = move_direction_h*80
bomb.vsp = move_direction_v*80}
hsp *= 0.98
vsp *= 0.98
}
else{
hsp = move_direction_h*3;vsp = move_direction_v*3
}







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