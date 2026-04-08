hsp *= 0.8
vsp *= 0.8
if collision_present(x+hsp,y)
{
	while !collision_present(x+sign(hsp),y){x += sign(hsp)}
	hsp = 0
}

x += hsp

if collision_present(x,y+vsp)
{
	while !collision_present(x,y+sign(vsp)){y += sign(vsp)}
	vsp = 0
}

y += vsp

timer -= 1
if timer = 0{instance_destroy()
var1 = instance_create_depth(x,y,depth-10,PNGExplosion)
var1.hurts_player = true
var1.creator = creator
}