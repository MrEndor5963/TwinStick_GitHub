if GM.game_paused = true{speed = 0;exit}

direction = image_angle
speed = bullet_speed

if sprite_index = s_BulletTracer{
if image_xscale < 1{image_xscale += 0.5;speed = 5}
else{speed = bullet_speed*2}
}
else{image_xscale = 1}

 

if hurts_player = true && place_meeting(x,y,Player){
var_player = instance_nearest(x,y,Player)
if var_player.hit_stun = 0 && var_player.hp > 0{
var_player.hp -= 1;instance_destroy();exit}
}

