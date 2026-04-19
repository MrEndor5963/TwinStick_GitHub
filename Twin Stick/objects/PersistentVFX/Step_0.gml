if GM.game_paused = true{exit}

depth = -y+z

image_angle += ((abs(hsp)+abs(vsp))*-image_yscale)*3

y = floor_y

if collision_present(x+hsp,y)
{
	while !collision_present(x+sign(hsp)*1,y){x += sign(hsp)*1}
	hsp = -hsp/2
	hit_something = true
}

x += hsp

if collision_present(x,y+vsp)
{
	while !collision_present(x,y+sign(vsp)*1){y += sign(vsp)*1}
	vsp = -vsp/2
	hit_something = true
}

floor_y += vsp

if z > 0{zsp = -zsp/2;hit_something = true}

zsp += grv

if hit_something = true{
hsp *= 0.95
vsp *= 0.95
zsp *= 0.95
}

if abs(zsp) < grv{zsp = 0}

z += zsp

y = floor_y+z