if GM.game_paused = true{exit}

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
zsp = -zsp/1.5
hsp /= 1.5
vsp /= 1.5
spin_speed = spin_speed*random_range(-1.2,1.2)

if hit_floor = false{
if sprite_index = s_12GadgeBuckshot{
var_sound = irandom_range(1,3)
var_sound = asset_get_index("sfx_BulletCasingShell"+string(var_sound))}
else{
var_sound = irandom_range(1,7)
var_sound = asset_get_index("sfx_BulletCasing"+string(var_sound))}
var_sound = play_sfx(var_sound)
audio_sound_pitch(var_sound,random_range(0.9,1.1))
audio_sound_gain(var_sound,GM.sfx_gain_saved/2,0)
}
;hit_wall = true;hit_floor = true
}

y = floor_y+z

if z >= 0{depth = 399}