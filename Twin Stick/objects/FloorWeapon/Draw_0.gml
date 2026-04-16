depth = -y
if hit_something = true{depth = 401}

if spawned = false{
script_execute_wpn(weapon_id)

//hsp_arc = 0;
vsp_arc = 0
if abs(hsp) > abs(vsp){vsp_arc = -8}
//else{hsp_arc = 4*image_xscale}
spawned = true

grv = weapon_weight/3
spawned = true
}

if vsp_arc > 8{
hsp /= 2
vsp_arc = -vsp_arc/1.5
hit_something = true
}



sprite_index = weapon_sprite
center_sprite_offset(sprite_index)

image_angle += (abs(hsp)+abs(vsp))*-image_yscale

if collision_present(x+hsp,y)
{
	while !collision_present(x+sign(hsp)*1,y){x += sign(hsp)*1}
	hsp = -hsp/1.5
	hit_something = true
}

x += hsp//+hsp_arc

if collision_present(x,y+vsp+vsp_arc)
{
	while !collision_present(x,y+sign(vsp+vsp_arc)*1){y += sign(vsp_arc)*1}
	vsp = -vsp/1.5;vsp_arc = -vsp_arc/1.5
	hit_something = true
}

y += vsp+vsp_arc

if hit_something = false{
hsp *= 0.98
vsp *= 0.98
}
else{
hsp*= 0.9
vsp *= 0.9

}

vsp_arc += grv
if hit_something = true && vsp_arc > 0{vsp_arc *= 0.98}
if abs(vsp_arc) < grv{vsp_arc = 0}
draw_self()