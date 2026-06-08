if GM.game_paused = true{speed = 0;exit}

if is_lazer = true{
image_xscale = 0
do {image_xscale += 0.1} until(place_meeting(x,y,Collision))
image_xscale -= 0.1

var _dir = point_direction(x, y, Player.x, Player.y);
var _diff = angle_difference(_dir, image_angle);
image_angle += _diff * 0.1;
x = creator.x;y = creator.y
}
else{
direction = image_angle
speed = bullet_speed
}

if x < 0 or x > room_width or y < 0 or y > room_height or collision_present(x,y) && is_lazer = false{
if explosive = true{
var_explosion = instance_create_depth(x,y,depth-1000,Explosion)
var_explosion.player_id = player_id
var_explosion.damage = explosion_damage}
destroy_bullet = true;exit}

hurt_player()