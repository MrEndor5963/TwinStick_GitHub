depth = -y
if hit_stun > 0{hit_stun -= 1}

if hitbox.hp <= 0{instance_destroy(hitbox);instance_destroy();Player.kills += 1;

blood_splatter()
}

find_player_target()
mp_grid_path(global.grid,path,x,y,target.x,target.y,true)
path_start(path,8,path_action_stop,false)

move_hitbox()
/*
speed = 3
direction = point_direction(x,y,Player.x,Player.y)
hsp = hspeed;hspeed = 0
vsp = vspeed;vspeed = 0


if hsp != 0{hsp *=0.9};if hsp < 0.1 && hsp > -0.1{hsp = 0}
if vsp != 0{vsp *=0.9};if vsp < 0.1 && vsp > -0.1{vsp = 0}


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