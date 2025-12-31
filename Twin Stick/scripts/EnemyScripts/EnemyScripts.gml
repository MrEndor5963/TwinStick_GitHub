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