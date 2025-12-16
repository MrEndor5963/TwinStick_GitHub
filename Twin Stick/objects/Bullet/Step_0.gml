if GM.game_paused = true{speed = 0;exit}

direction = image_angle
speed = bullet_speed

if hurts_player = true && place_meeting(x,y,Player){
var_player = instance_nearest(x,y,Player)
if var_player.hit_stun = 0 && var_player.hp > 0{
var_player.hp -= 1;instance_destroy();exit}
}

if x < 0 or x > room_width or y < 0 or y > room_height or collision_present(x,y){
if explosive = true{
var_explosion = instance_create_depth(x,y,depth-1000,PNGExplosion)
	var_explosion.creator = creator
	var_explosion.damage = explosion_damage}
instance_destroy()}