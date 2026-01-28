function create_enemy(){
hit_stun = 0
hitbox = instance_create_depth(x,y,depth+1,Enemy)
hitbox.sprite_index = sprite_index
hitbox.hp = hp
hitbox.creator = id
hitbox.spawn_enemy = false
set_tileset_collision()
spawn_timer = 60

hsp_knockback = 0;vsp_knockback = 0
hsp = 0;vsp = 0
}

function blood_splatter(){
repeat(32){
particle = instance_create_depth(x,y,depth-1,ParticleEffect)
while particle.hsp > -1 && particle.hsp < 1{particle.hsp = random_range(-12,12)}
particle.vsp = random_range(-24,-4)
particle.timer += 10
}
}

function enemy_damage_check(){
list_temp = ds_list_create() 
instance_place_list(x,y,[Bullet,MeleeWeapon,PNGExplosion],list_temp,false)
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
	bullet_reward = var_bullet.shot_reward
	with var_player{player_point_change(other.bullet_reward)}

	hp -= var_bullet.damage
	direction = var_bullet.direction
	speed = 1;
	creator.hsp_knockback = hspeed*var_bullet.knockback
	creator.vsp_knockback = vspeed*var_bullet.knockback
	speed = 0
	if var_bullet.object_index != PNGExplosion && var_bullet.explosive = true{
	var_explosion = instance_create_depth(var_bullet.x,var_bullet.y,var_bullet.depth-1000,PNGExplosion)
	var_explosion.creator = var_bullet.creator
	var_explosion.damage = var_bullet.explosion_damage
	}
	
	if hp <= 0 or x < 0 or x> room_width or y < 0 or y > room_height{
	repeat(var_bullet.png_explosion_checks){
	if irandom_range(1,4) = 1{
	var_explosion = instance_create_depth(var_bullet.x,var_bullet.y,var_bullet.depth-1000,PNGExplosion)
	var_explosion.creator = var_bullet.creator
	}
	}
	instance_destroy(creator);
	instance_destroy();
	ds_list_destroy(list_temp)
	var_player.kills += 1
	with var_player{player_point_change(100)}
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
}

function move_hitbox(){
hitbox.x = x
hitbox.y = y
hitbox.sprite_index = sprite_index
hitbox.image_xscale = image_xscale
hitbox.image_yscale = image_yscale
hitbox.image_angle = image_angle
hitbox.depth = depth+1	
}

function get_move_directions(){
if instance_exists(Player) && GM.game_over = false{
	
i = 0;lowest_value = 1000
repeat(array_length(GM.player_list)){
var_player = GM.player_list[i]
var_grid = var_player.pathfinding_grid
value = ds_grid_get(var_grid,node_x,node_y) 
if value < lowest_value && var_player.hp > 0{lowest_value = value;player_target = GM.player_list[i]}
i += 1
}
if collision_line(x,y,player_target.x,player_target.y,tiles,false,false) = noone or object_index = SpikeFly{
direction = point_direction(x,y,player_target.x,player_target.y)
speed = 1
move_direction_h = hspeed
move_direction_v = vspeed
speed = 0
}
else{
var_grid = player_target.pathfinding_grid

move_direction_h = 0;move_direction_v = 0
lowest_value = ds_grid_get(var_grid,node_x,node_y)

value = ds_grid_get(var_grid,node_x-1,node_y)
if value < lowest_value{move_direction_h = -1;move_direction_v = 0;}

value = ds_grid_get(var_grid,node_x+1,node_y)
if value < lowest_value{move_direction_h = 1;move_direction_v = 0;}

value = ds_grid_get(var_grid,node_x,node_y-1)
if value < lowest_value{move_direction_h = 0;move_direction_v = -1;}

value = ds_grid_get(var_grid,node_x,node_y+1)
if value < lowest_value{move_direction_h = 0;move_direction_v = 1;}

value = ds_grid_get(var_grid,node_x-1,node_y-1)
if value < lowest_value{move_direction_h = -1;move_direction_v = -1;}

value = ds_grid_get(var_grid,node_x+1,node_y-1)
if value < lowest_value{move_direction_h = 1;move_direction_v = -1;}

value = ds_grid_get(var_grid,node_x-1,node_y+1)
if value < lowest_value{move_direction_h = -1;move_direction_v = +1;}

value = ds_grid_get(var_grid,node_x+1,node_y+1)
if value < lowest_value{move_direction_h = 1;move_direction_v = 1;}
}
}
else{
move_direction_h = 0;move_direction_v = 0
}
}

function corner_cutting(){
	
corner_cut = false;i = 0
if collision_present(x+sign(move_direction_h),y+sign(move_direction_v)){
repeat (24){i += 2

if vsp < 0{
if !collision_present(x-i,y-1){y-=1;while collision_present(x,y){x-=1};corner_cut = true;break}
if !collision_present(x+i,y-1){y-=1;while collision_present(x,y){x+=1};corner_cut = true;break}
}

if vsp > 0{
if !collision_present(x-i,y+1){y+=1;while collision_present(x,y){x-=1};corner_cut = true;break}
if !collision_present(x+i,y+1){y+=1;while collision_present(x,y){x+=1};corner_cut = true;break}
}

if hsp > 0{
if !collision_present(x+1,y-i){x+=1;while collision_present(x,y){y-= 1};corner_cut = true;break}
if !collision_present(x+1,y+i){x+=1;while collision_present(x,y){y+= 1};corner_cut = true;break}
}													  													
if hsp < 0{
if !collision_present(x-1,y-i){x-=i;while collision_present(x,y){y-= 1};corner_cut = true;break}
if !collision_present(x-1,y+i){x-=i;while collision_present(x,y){y+=1};corner_cut = true;break}
}
}
}

}