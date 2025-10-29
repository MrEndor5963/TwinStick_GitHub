function create_enemy(){
hit_stun = 0
hitbox = instance_create_depth(x,y,depth+1,Enemy)
hitbox.sprite_index = sprite_index
hitbox.hp = hp
hitbox.creator = id
set_tileset_collision()
}

function find_player_target(){
if path_exists(path){path_delete(path)}
path = path_add()
var_repeat = 0;distance = infinity;new_distance =  0
repeat(array_length(GM.player_list)){
temp_target = GM.player_list[var_repeat]
mp_grid_path(global.grid,path,x,y,temp_target.x,temp_target.y,true)
new_distance = path_get_length(path)
if new_distance < distance{target = GM.player_list[var_repeat];distance = new_distance}
var_repeat += 1
}
}

function blood_splatter(){
repeat(32){
particle = instance_create_depth(x,y,depth-1,ParticleEffect)
while particle.hsp > -1 && particle.hsp < 1{particle.hsp = random_range(-12,12)}
particle.vsp = random_range(-24,-4)
particle.timer += 10
}
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