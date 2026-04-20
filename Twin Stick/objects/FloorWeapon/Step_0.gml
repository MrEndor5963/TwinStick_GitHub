if GM.map_x != home_x or GM.map_y != home_y{
x = -3000
exit
}
else{x_saved = x}


if spawned = false{
script_execute_wpn(weapon_id)
damage = 20
direction = player_id.aim_direction
speed = 1
hsp = hspeed*15
vsp = vspeed*15
speed = 0
zsp = -10
spin_speed = 30*-image_yscale
grv = 0.5
spawned = true
}


sprite_index = weapon_sprite
depth = -y+z

image_angle += spin_speed

if collision_present(x+hsp,floor_y)
{
	while !collision_present(x+sign(hsp)*1,floor_y){x += sign(hsp)*1}
	hsp = -hsp/2
	hit_wall = true
}

x += hsp

if collision_present(x,floor_y+vsp)
{
	while !collision_present(x,floor_y+sign(vsp)*1){floor_y += sign(vsp)*1}
	vsp = -vsp/2
	
	hit_wall = true
}

floor_y += vsp

zsp += grv

z += zsp

if z >= 0{
z = 0
zsp = -zsp/3
hsp /= 3
vsp /= 3
spin_speed = spin_speed*random_range(-1.2,1.2)

if hit_floor = false{
var_sound = irandom_range(1,7)
var_sound = asset_get_index("sfx_BulletCasing"+string(var_sound))
var_sound = audio_play_sound(var_sound,2,false)
audio_sound_pitch(var_sound,random_range(0.9,1.1))
audio_sound_gain(var_sound,GM.sfx_gain_saved/2,0)
}
;hit_wall = true;hit_floor = true
}

y = floor_y+z

if z >= 0{depth = 399}

if place_meeting(x,y,Enemy) && hit_floor = false && hit_wall = false && hit_enemy = false{
list_temp = ds_list_create()
instance_place_list(x,y,Enemy,list_temp,false)
var_repeat = 0
repeat(ds_list_size(list_temp)){
var enemy_hit = ds_list_find_value(list_temp,var_repeat)
enemy_hit = enemy_hit.enemy_id
if !array_contains(contact_list,enemy_hit){
array_push(contact_list,enemy_hit)
enemy_hit.hurt_by_id = id
with enemy_hit{enemy_damage_check()}
}
var_repeat += 1
}
ds_list_destroy(list_temp)
hit_enemy = true

if abs(hsp) > abs(vsp){hsp = hsp/-3}
else{vsp = vsp/-3}

}