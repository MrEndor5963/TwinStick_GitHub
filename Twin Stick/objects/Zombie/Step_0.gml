depth = -y
if hit_stun > 0{hit_stun -= 1}

if hitbox.hp <= 0{instance_destroy(hitbox);instance_destroy();Player.kills += 1;

blood_splatter()
exit
}

move_timer -= 1
if move_timer = 0{move_timer = 50
	
find_player_target()
mp_grid_path(global.grid,path,x,y,target.x,target.y,true)
path_start(path,5,path_action_stop,false)}


if path_speed != 0{path_speed *=0.95};if path_speed < 0.1{path_speed = 0}
path_add()

move_hitbox()
/*
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