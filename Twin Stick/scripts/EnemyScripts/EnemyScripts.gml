function create_enemy(){
hit_stun = 0
hitbox = instance_create_depth(x,y,depth+1,Enemy)
hitbox.sprite_index = sprite_index
hitbox.enemy_id = id
set_tileset_collision()
spawn_timer = 60
//enemy_weight = 1.00

hsp_knockback = 0;vsp_knockback = 0
hsp = 0;vsp = 0
move_direction_h = 0
move_direction_v = 0
hurt_by_id = -1
pathfinding_grid = -1
set_nodes()
}

function draw_enemy(){
//floor_y = y+(sprite_get_height(sprite_index)/2)
//shadow_width = sprite_get_width(sprite_index)/50
//draw_sprite_ext(s_Shadow,image_index,x,floor_y-4,shadow_width,1,image_angle,c_black,image_alpha)
depth = -y-(sprite_get_height(sprite_index)/2)
if hit_stun > 0{
shader_set(sh_HitFlash)}
draw_self()
shader_reset()

if hp <= 0{
blood_splatter()
play_sfx(sfx_EnemyDeath)
instance_destroy(hitbox)

corpse = instance_create_depth(x,y,depth,PersistentVFX)
corpse.hsp = hsp_knockback*random_range(2,3)
corpse.vsp = vsp_knockback*random_range(2,3)
corpse.zsp = random_range(-8,-6)
corpse.image_angle = point_direction(x,y,x+hsp_knockback,y+vsp_knockback)+180
corpse.image_yscale = image_xscale
corpse.z = -1
corpse.floor_y = y
corpse.grv = 0.5
corpse_sprite = asset_get_index("s_"+object_get_name(object_index)+"Dead")
if corpse_sprite != -1{corpse.sprite_index = corpse_sprite}
else{corpse.sprite_index = s_0}

instance_destroy()


}
	
//debug grid
//draw_set_colour(c_red)
//draw_text(x,y,"hsp+vsp:"+string(hsp)+"|"+string(vsp))
//draw_text(x,y+30,"movdirh+v:"+string(move_direction_h)+"|"+string(move_direction_v))
//draw_text(x,y+60,"node_x+y:"+string(node_x)+"|"+string(node_y))
//if pathfinding_grid != -1{
//draw_set_aligns(fa_right,fa_center)
//draw_text(x,y+40,"pathfinding value"+string(ds_grid_get(pathfinding_grid,node_x,node_y)))}
}

function blood_splatter(){
repeat(32){
particle = instance_create_depth(x,y,depth-1,ParticleEffect)
while particle.hsp > -1 && particle.hsp < 1{particle.hsp = random_range(-8,8)}
particle.vsp = random_range(-8,8)
particle.timer += 10
particle.draw_color = blood_color
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

function corner_cutting(){
/*	
corner_cut = false;i = 0
if collision_present(x+hsp,y+vsp){
repeat (1){i += 1

if vsp < 0{
if !collision_present(x-i,y-1){y-=1;corner_cut = true;break}
if !collision_present(x+i,y-1){y-=1;corner_cut = true;break}
}

if vsp > 0{
if !collision_present(x-i,y+1){y+=1;corner_cut = true;break}
if !collision_present(x+i,y+1){y+=1;corner_cut = true;break}
}

if hsp > 0{
if !collision_present(x+1,y-i){x+=1;corner_cut = true;break}
if !collision_present(x+1,y+i){x+=1;corner_cut = true;break}
}													  													
if hsp < 0{
if !collision_present(x-1,y-i){x -= 1;corner_cut = true;break}
if !collision_present(x-1,y+i){x -= 1;corner_cut = true;break}
}
}
}
*/
}
	
function pop_out_of_collision(){if collision_present(x,y){
if !collision_present(x-1,y){while collision_present(x,y){x -= 0.2};exit}
if !collision_present(x+1,y){while collision_present(x,y){x += 0.2};exit}
if !collision_present(x,y-1){while collision_present(x,y){y -= 0.2};exit}
if !collision_present(x,y+1){while collision_present(x,y){y += 0.2};exit}
}
}

function hurt_player(){
if place_meeting(x,y,Player){
with instance_nearest(x,y,Player){
hurt_by_id = other.id
if hit_stun = 0 {take_damage = true}}
}
}
	
function enemy_damage_check(){
hit_stun = 2

if hurt_by_id.object_index = Bullet{
particle_spawn_x = hurt_by_id.x + ((hurt_by_id.hspeed/hurt_by_id.speed)*(hurt_by_id.image_xscale*100))
particle_spawn_y = hurt_by_id.y + ((hurt_by_id.vspeed/hurt_by_id.speed)*(hurt_by_id.image_yscale*100))
hurt_by_x = particle_spawn_x
hurt_by_y = particle_spawn_y
hurt_by_id.penetration -= 1
var_damage_number = instance_create_depth(hurt_by_x,hurt_by_y,depth-1,DamageNumber)
var_damage_number.text_string = hurt_by_id.damage
}else{
particle_spawn_x = x
particle_spawn_y = y
hurt_by_x = hurt_by_id.x
hurt_by_y = hurt_by_id.y
}

repeat(4){
particle = instance_create_depth(particle_spawn_x,particle_spawn_y,depth-100,ParticleEffect)
particle.hsp = random_range(-8,8)
particle.vsp = random_range(-8,8)
particle.draw_color = blood_color}


if hurt_by_id.object_index = Bullet{direction = hurt_by_id.direction+180}
else{direction = point_direction(x,y,hurt_by_x,hurt_by_y)}
speed = 1;
hsp_knockback -= hspeed*hurt_by_id.knockback
vsp_knockback -= vspeed*hurt_by_id.knockback
speed = 0

hp -= hurt_by_id.damage

if hurt_by_id.player_id != -1{
var_hit_reward = hurt_by_id.hit_reward
with hurt_by_id.player_id{player_point_change(other.var_hit_reward)}
if hp <= 0{
var_kill_reward = hurt_by_id.kill_reward
with hurt_by_id.player_id{player_point_change(other.var_kill_reward)}
}

}

}