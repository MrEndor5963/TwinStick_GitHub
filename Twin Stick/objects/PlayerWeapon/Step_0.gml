if GM.game_paused = true or room = r_FloorTransition{exit}

if abs(recoil) > 10{recoil *= 0.92}else{recoil *= 0.9}
if recoil < 0.5 && recoil > -0.5{recoil = 0}

key_shoot = player_id.key_shoot
key_shoot_pressed = player_id.key_shoot_pressed

//if shoot_timer <= 0 && ammo_inmag > 0 && reload_timer < 0 && melee_equipped = false && jam_timer = 0 && trigger_delay_timer >= trigger_delay && deploy_timer = 0{
if key_shoot && auto = true or key_shoot_pressed && auto = false{
// or key_shoot && auto = false && trigger_delay_timer = trigger_delay && trigger_needs_reset = false
shoot_timer = shoot_delay
//ammo_inmag -= 1;
if auto = false{
trigger_delay_timer = 0
trigger_needs_reset = true
}

player_id.glitch_int_mag = 0.8

direction = aim_direction+recoil
var_x = sprite_get_xoffset(sprite_index)
speed = sprite_get_width(sprite_index)-var_x-5
var_x = x+(hspeed)
var_y = y+(vspeed)
speed = 0
flash = instance_create_depth(var_x,var_y,depth-2,MuzzleFlash)
flash.image_angle = aim_direction+recoil
repeat(round(bullet_amount)){
_bullet = instance_create_depth(var_x,var_y,depth-1,Bullet)
var_spread = bullet_spread+clamp(recoil/5,0,5)
_bullet.image_angle = aim_direction+recoil+irandom_range(-var_spread,var_spread)
_bullet.damage = weapon_damage
_bullet.penetration = penetration
_bullet.bullet_speed = bullet_speed
_bullet.knockback = bullet_knockback
_bullet.sprite_index = bullet_sprite
_bullet.player_id = player_id
_bullet.shot_reward = shot_reward
_bullet.kill_reward = kill_reward
_bullet.explosive = explosive
_bullet.explosion_damage = explosion_damage
_bullet.png_explosion_checks = png_explosions
}

direction = aim_direction+recoil+180
speed = knockback/player_id.weight
player_id.hsp_knockback += hspeed
player_id.vsp_knockback += vspeed
GM.cam_shake_x += hspeed*4
GM.cam_shake_y += vspeed*4
speed = 0
recoil += gun_recoil*image_yscale
current_shoot_sfx = play_sfx(shoot_sfx)
audio_sound_pitch(current_shoot_sfx,audio_sound_get_pitch(current_shoot_sfx)+random_range(-0.045,0.045))
//if jam_chance != 0 && random_range(0,100) <= jam_chance{jam_timer += 1}
}