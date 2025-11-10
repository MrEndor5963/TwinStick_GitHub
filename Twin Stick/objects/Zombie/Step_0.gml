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



corner_cutting()


if collision_present(x+hsp,y)
{
	while !collision_present(x+sign(hsp)*1,y){x += sign(hsp)*1}
	hsp = 0
}

x += hsp

if collision_present(x,y+vsp)
{
	while !collision_present(x,y+sign(vsp)*1){y += sign(vsp)*1}
	vsp = 0
}

y += vsp

hsp *= 0.95
vsp *= 0.95

move_hitbox()