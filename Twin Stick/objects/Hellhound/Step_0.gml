node_x = x div 48
node_y = y div 48
if spawn_timer > 0{
spawn_timer -= 1;exit
}

depth = -y
if hit_stun > 0{hit_stun -= 1}

if hitbox.hp <= 0{instance_destroy(hitbox);instance_destroy();Player.kills += 1;

blood_splatter()
exit
}


get_move_directions()


hsp = move_direction_h*4;vsp = move_direction_v*4


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

move_hitbox()