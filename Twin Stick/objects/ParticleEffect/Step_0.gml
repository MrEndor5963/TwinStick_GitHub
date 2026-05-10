if zsp = 0 or GM.game_paused = true{exit}

//depth = -y+z

//image_angle += spin_speed

if collision_present(x+hsp,floor_y)
{
	while !collision_present(x+sign(hsp)*1,floor_y){x += sign(hsp)*1}
	hsp = 0
	hit_wall = true
}

x += hsp

if collision_present(x,floor_y+vsp)
{
	while !collision_present(x,floor_y+sign(vsp)*1){floor_y += sign(vsp)*1}
	vsp = 0
	
	hit_wall = true
}

floor_y += vsp

zsp += grv

z += zsp

if z >= 0{
z = 0
hsp = 0;vsp = 0
;hit_wall = true;hit_floor = true
depth = layer_get_depth("Walls")
instance_destroy()
}

y = floor_y+z

if z >= 0{depth = 399}