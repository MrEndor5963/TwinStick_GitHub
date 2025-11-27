if GM.game_paused = true{exit}

if hit_stun != 0{creator.hit_stun = hit_stun;hit_stun = 0}

if spawn_enemy = true{
enemy_list = GM.enemy_list
enemy_id = enemy_list[irandom_range(0,array_length(enemy_list)-1)]
instance_create_depth(x,y,depth,enemy_id)
instance_destroy();exit
}

list_temp = ds_list_create() 
instance_place_list(x,y,[Bullet,MeleeWeapon],list_temp,false)
var_repeat = 0
repeat(ds_list_size(list_temp)){
var_bullet = ds_list_find_value(list_temp,var_repeat)
if array_contains(contact_list,var_bullet) = false && var_bullet.hurts_enemy = true && var_bullet.object_index != MeleeWeapon or
var_bullet.object_index = MeleeWeapon && var_bullet.attacking = true && array_contains(var_bullet.contact_list,id) = false
{

	repeat(4){
	if var_bullet.object_index = MeleeWeapon{particle = instance_create_depth(x,y,depth-100,ParticleEffect)}
	else{particle = instance_create_depth(var_bullet.x,var_bullet.y,depth-100,ParticleEffect)}
	particle.hsp = random_range(-12,12)
	particle.vsp = random_range(-18,4)}

	hit_stun = 2
	var_player = var_bullet.creator
	with var_player{player_point_change(10)}

	hp -= var_bullet.damage
	direction = var_bullet.direction
	speed = 1;
	creator.hsp_knockback = hspeed*var_bullet.knockback
	creator.vsp_knockback = vspeed*var_bullet.knockback
	speed = 0
	if hp <= 0{
	instance_destroy(creator);
	instance_destroy();
	ds_list_destroy(list_temp)
	var_player.kills += 1
	with var_player{player_point_change(50)}
	var_bullet.penetration -= 1
	if var_bullet.penetration <= 0{instance_destroy(var_bullet)}
	blood_splatter()
	play_sfx(sfx_EnemyDeath)
	exit
	}

		if var_bullet.object_index = MeleeWeapon{array_push(var_bullet.contact_list,id)}
	var_bullet.penetration -= 1
	if var_bullet.penetration <= 0{instance_destroy(var_bullet)}
	else{array_insert(contact_list,0,var_bullet)}
}

var_repeat += 1
}

ds_list_destroy(list_temp)

while array_length(contact_list) > 100{array_pop(contact_list)}