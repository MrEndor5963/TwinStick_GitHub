if GM.game_paused = true{speed = 0;exit}

direction = image_angle
speed = bullet_speed

if x < 0 or x > room_width or y < 0 or y > room_height or collision_present(x,y){
if explosive = true{
var_explosion = instance_create_depth(x,y,depth-1000,Explosion)
var_explosion.player_id = player_id
var_explosion.damage = explosion_damage}
destroy_bullet = true;exit}
