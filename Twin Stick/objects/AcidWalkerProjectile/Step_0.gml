if zsp = 0 or GM.game_paused = true{exit}

timer -= 1
if timer = 0{instance_destroy()}

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
;hit_wall = true;hit_floor = true
}

y = floor_y+z

if z >= 0{
var1 = instance_create_layer(x,y,"Walls",SlugeeTrail)
var1.sprite_index = s_AcidWalkerTrail
}