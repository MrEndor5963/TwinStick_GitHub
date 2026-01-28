if x < 0 or x > room_width or y < 0 or y > room_height or collision_present(x,y){
if explosive = true{
var_explosion = instance_create_depth(x,y,depth-1000,PNGExplosion)
	var_explosion.creator = creator
	var_explosion.damage = explosion_damage}
instance_destroy()}