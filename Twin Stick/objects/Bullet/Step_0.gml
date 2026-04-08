

if image_xscale = 0{spawn_penetration = penetration}
damage = damage/(spawn_penetration/penetration)

if GM.game_paused = true{speed = 0;exit}

direction = image_angle
speed = bullet_speed

repeat(100){
if sprite_index = s_Bullet{
if image_xscale < 1{image_xscale += 0.01;speed = 1}
else{speed = 1
x += hspeed
y += vspeed}
}
else{image_xscale = 1}

 

if hurts_player = true && place_meeting(x,y,Player){
var_player = instance_nearest(x,y,Player)
if var_player.hit_stun = 0 && var_player.hp > 0{
var_player.hp -= 1;destroy_bullet = true;exit}
}

if hurts_enemy && place_meeting(x,y,Enemy){
with instance_nearest(x+(hspeed*(image_xscale*100)),y+(vspeed*(image_yscale*100)),Enemy){
enemy_damage_check()
}
}

if x < 0 or x > room_width or y < 0 or y > room_height or collision_present(x,y) or penetration <= 0{
if explosive = true{
var_explosion = instance_create_depth(x,y,depth-1000,PNGExplosion)
	var_explosion.creator = creator
	var_explosion.damage = explosion_damage}
destroy_bullet = true;exit}

if sprite_index != s_Bullet{exit}
}