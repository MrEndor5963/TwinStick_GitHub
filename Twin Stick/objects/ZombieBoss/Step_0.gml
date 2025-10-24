shoot_timer -=1
if shoot_timer = 0{
shoot_timer = shoot_delay
_bullet = instance_create_depth(x,y,depth-1,Bullet)
_bullet.bullet_speed = 10
_bullet.image_angle = point_direction(x,y,Player.x,Player.y)
_bullet.sprite_index = s_EnemyBullet
_bullet.hurts_player = true
_bullet.hurts_enemy = false
}

depth = -y
if hit_stun > 0{hit_stun -= 1}

if hitbox.hp <= 0{instance_destroy(hitbox);instance_destroy();Player.kills += 1;

repeat(32){
particle = instance_create_depth(x,y,depth-1,ParticleEffect)
while particle.hsp > -1 && particle.hsp < 1{particle.hsp = random_range(-12,12)}
particle.vsp = random_range(-24,-4)
particle.timer += 10
}
}

move_timer -= 1
if move_timer = 0{move_timer = 50
	
find_player_target()
mp_grid_path(global.grid,path,x,y,target.x,target.y,true)
path_start(path,6,path_action_stop,false)}


if path_speed != 0{path_speed *=0.95};if path_speed < 0.1{path_speed = 0}
path_add()
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