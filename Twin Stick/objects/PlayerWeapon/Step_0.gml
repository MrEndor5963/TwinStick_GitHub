if GM.game_paused = true or room = r_FloorTransition{exit}
weapon_id = player_id.weapons_held[player_id.weapon_equipped]
script_execute_wpn(weapon_id)
sprite_index = weapon_id
sprite_set_offset(sprite_index,weapon_xoffset,weapon_yoffset)

if abs(recoil) > 10{recoil *= 0.92}else{recoil *= 0.9}
if recoil < 0.5 && recoil > -0.5{recoil = 0}

key_shoot = player_id.key_shoot
key_shoot_pressed = player_id.key_shoot_pressed
key_reload = player_id.key_reload
key_melee_pressed = player_id.key_melee_pressed
key_throw_pressed = player_id.key_throw_pressed

ammo_inmag = player_id.ammo_inmag
ammo_reserve = player_id.ammo_reserve

if ammo_inmag <= 0 or key_reload && ammo_inmag != ammo_inmag_max{
if ammo_reserve > 0 && reload_timer = -1{
reload_timer = 0
play_sfx(reload_sfx)
}}

if reload_timer >= 0{
reload_timer += player_id.reload_speed
if reload_timer >= reload_time{
if magazine_reload = true{ammo_inmag = ammo_inmag_max}
else{ammo_inmag += 1}
ammo_reserve -= 1
player_id.glitch_int_mag = 1
player_id.glitch_int_reserve = 1
reload_timer = -1
}

}

if key_shoot{trigger_delay_timer += 1}else{trigger_delay_timer = 0;trigger_needs_reset = false}
shoot_timer -= 1;if shoot_timer < 0{shoot_timer = 0}

if key_shoot_pressed && ammo_inmag = 0 && ammo_reserve = 0{key_melee_pressed = true}

if ammo_inmag > 0 && shoot_timer = 0 && reload_timer = -1 && trigger_delay_timer >= trigger_delay{
if key_shoot && auto = true or key_shoot_pressed && auto = false or key_shoot && trigger_needs_reset = false{
shoot_timer = shoot_delay
ammo_inmag -= 1;
if auto = false{trigger_delay_timer = 0;trigger_needs_reset = true}
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
_bullet.spawn_penetration = penetration
_bullet.bullet_speed = bullet_speed
_bullet.knockback = bullet_knockback
_bullet.sprite_index = bullet_sprite
_bullet.player_id = player_id
_bullet.hit_reward = hit_reward
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
}}
	
player_id.ammo_inmag = ammo_inmag
player_id.ammo_reserve = ammo_reserve


x = player_id.x
y = player_id.y
aim_direction = player_id.aim_direction
image_angle = aim_direction+recoil
depth = player_id.depth-1
if player_id.aim_string = "U"{depth += 2}
if aim_direction > 90 && aim_direction < 270{image_yscale = -1}else{image_yscale = 1}

hurtbox_active = false

if key_melee_pressed = true{melee_attack = true}
if melee_attack = false{
angleoff *= 0.8
xoff*=0.8
yoff*=0.8
contact_list = []
}

if melee_attack = true{

knockback = melee_knockback
damage = melee_damage

hurtbox_active = true

if attack_timer = -1{attack_timer = 12;play_sfx(sfx_KnifeSwing)}
angleoff = (-25*(3-attack_timer))*image_yscale

direction = image_angle+angleoff
speed = 7
xoff = hspeed*(12-attack_timer)
yoff = vspeed*(12-attack_timer)
speed = 0
if attack_timer = 0{melee_attack = false}

if attack_timer > -1{attack_timer -= 1}
}

image_angle = image_angle+angleoff
x = x+xoff
y = y+yoff

if melee_attack = true{
center_sprite_offset(sprite_index)

list_temp = ds_list_create()
instance_place_list(x,y,Enemy,list_temp,false)
var_repeat = 0
repeat(ds_list_size(list_temp)){
var enemy_hit = ds_list_find_value(list_temp,var_repeat)
enemy_hit = enemy_hit.enemy_id
if !array_contains(contact_list,enemy_hit){
array_push(contact_list,enemy_hit)
enemy_hit.hurt_by_id = id
with enemy_hit{enemy_damage_check()}
}
var_repeat += 1
}
ds_list_destroy(list_temp)
}

if key_throw_pressed = true{
_thrown = instance_create_depth(x,y,depth,ThrownWeapon)
_thrown.weapon_id = weapon_id
_thrown.image_angle = image_angle
_thrown.image_yscale = image_yscale
direction = image_angle;speed = 25
_thrown.hsp = hspeed
_thrown.vsp = vspeed
speed = 0
}