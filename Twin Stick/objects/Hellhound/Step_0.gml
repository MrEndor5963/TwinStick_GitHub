depth = -y
if hit_stun > 0{hit_stun -= 1}

if hitbox.hp <= 0{instance_destroy(hitbox);instance_destroy();Player.kills += 1;

repeat(32){
particle = instance_create_depth(x,y,depth-1,ParticleEffect)
while particle.hsp > -1 && particle.hsp < 1{particle.hsp = random_range(-6,6)}
particle.vsp = random_range(-12,-2)
particle.timer += 10
}
}


path_delete(path)
path = path_add()
mp_grid_path(global.grid,path,x,y,Player.x,Player.y,true)
path_start(path,3,path_action_stop,false)


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