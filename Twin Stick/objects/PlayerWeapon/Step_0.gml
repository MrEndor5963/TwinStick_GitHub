if GM.game_paused = true or room = r_FloorTransition{exit}
weapon_id = player_id.weapons_held[player_id.weapon_equipped]
script_execute_wpn(weapon_id)
sprite_index = weapon_id


if abs(recoil) > 10{recoil *= 0.92}else{recoil *= 0.9}
if recoil < 0.5 && recoil > -0.5{recoil = 0}

key_shoot = player_id.key_shoot
key_shoot_pressed = player_id.key_shoot_pressed
key_reload = player_id.key_reload
key_melee_pressed = player_id.key_melee_pressed
key_throw_pressed = player_id.key_throw_pressed

ammo_inmag = player_id.ammo_inmag
ammo_reserve = player_id.ammo_reserve
bullet_chambered = player_id.bullet_chambered
mag_loaded = player_id.mag_loaded
case_ejects_needed = player_id.case_ejects_needed

if ammo_inmag <= 0 or key_reload && ammo_inmag != ammo_inmag_max{
if ammo_reserve > 0 && reload_progress = -1{
reload_progress = 0
}}

if key_shoot{trigger_delay_timer += 1}else{trigger_delay_timer = 0;trigger_needs_reset = false}
shoot_timer -= 1;if shoot_timer < 0{shoot_timer = 0}

if key_shoot_pressed && ammo_inmag = 0 && ammo_reserve = 0{key_melee_pressed = true}

if slide_sprite != s_0{
if ammo_inmag = 0{shoot_timer = shoot_delay}
slide_offset = slide_distance/(shoot_delay/shoot_timer)
if slide_offset = 0{bullet_chambered = true}
}

if pump_sprite != s_0{
if pump_offset = 0 && case_ejects_needed = 0{bullet_chambered = true}
}

#region Shooting the gun
	
	
	can_shoot = true
	
	if ammo_inmag = 0 or shoot_timer != 0 or reload_progress != -1 or trigger_delay_timer < trigger_delay or bullet_chambered = false
	{can_shoot = false}
	
	
	if can_shoot = true{
	if key_shoot && auto = true or key_shoot_pressed && auto = false or key_shoot && trigger_needs_reset = false{
	shoot_timer = shoot_delay
	ammo_inmag -= 1;
	case_ejects_needed += 1
	bullet_chambered = false
	if auto = false{trigger_delay_timer = 0;trigger_needs_reset = true}
	player_id.glitch_int_mag = 0.8
	
	
	if action_type = s_SemiAuto or action_type = s_FullAuto{
	case_ejects_needed -= 1
	direction = aim_direction;speed = 1
	particle = instance_create_depth(x,y,depth-1,PersistentVFX)
	particle.hsp = -hspeed*random_range(4,5)
	particle.vsp = -vspeed*random_range(4,5)
	particle.zsp = random_range(-12,-6)
	particle.spin_speed = image_yscale*random_range(35,40)
	particle.z = player_id.y-player_id.floor_y
	particle.floor_y = player_id.floor_y
	particle.grv = 0.5
	particle.sprite_index = caliber
	}

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

#endregion shooting the gun
	
if reload_progress >= 0{reload_progress += player_id.reload_speed
	
	trigger_delay_timer = 0

	if animation = "Auto Pistol"{
	if mag_loaded = true && ammo_inmag <= ammo_inmag_max && abs(recoil) < 5{
	angle_offset = 100*image_yscale
	mag_loaded = false
	direction = aim_direction;speed = 1
	particle = instance_create_depth(
	x+(mag_xoff-sprite_get_xoffset(sprite_index))+((sprite_get_width(sprite_index)*hspeed)/2),
	y+(mag_yoff-sprite_get_yoffset(sprite_index))+6,
	depth,PersistentVFX)
	particle.hsp = hspeed*random_range(1,3)
	particle.vsp = vspeed*random_range(1,3)
	particle.zsp = random_range(-6,-3)
	particle.spin_speed = image_yscale*random_range(5,10)
	particle.z = player_id.y-player_id.floor_y
	particle.floor_y = player_id.floor_y
	particle.grv = 0.5
	speed = 0
	}
	
	if mag_loaded = false && abs(angle_offset) <= 1{
	mag_offset = (reload_time-(reload_time/(reload_time/reload_progress)))*20
	
	}else{reload_progress -= player_id.reload_speed}
	
	
	}
	
	if reload_progress >= reload_time{
	if magazine_reload = true{
	if ammo_inmag > 1{ammo_inmag = 1}
	ammo_inmag += ammo_inmag_max
	mag_loaded = true}
	else{ammo_inmag += 1}
	ammo_reserve -= 1
	player_id.glitch_int_mag = 1
	player_id.glitch_int_reserve = 1
	reload_progress = -1
	}
}

player_id.ammo_inmag = ammo_inmag
player_id.ammo_reserve = ammo_reserve
player_id.bullet_chambered = bullet_chambered
player_id.mag_loaded = mag_loaded
player_id.case_ejects_needed = case_ejects_needed

aim_direction = player_id.aim_direction

direction = aim_direction+recoil
speed = 1
position_xoffset = sprite_get_xoffset(sprite_index)-weapon_xoffset
x = player_id.x+(position_xoffset*hspeed)
y = player_id.y+(position_xoffset*vspeed)
speed = 0
image_angle = direction
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

if key_throw_pressed = true && melee_attack = false && weapon_id != s_Unarmed{
_thrown = instance_create_depth(x,y,depth,FloorWeapon)
_thrown.player_id = player_id;
_thrown.image_yscale = image_yscale
_thrown.image_angle = image_angle
_thrown.weapon_id = weapon_id
_thrown.z = player_id.y-player_id.floor_y
_thrown.floor_y = player_id.floor_y
_thrown.ammo_inmag = ammo_inmag
_thrown.ammo_reserve = ammo_reserve
_thrown.bullet_chambered = bullet_chambered
_thrown.mag_loaded = mag_loaded

var_number = player_id.weapon_equipped
array_delete(player_id.weapons_held,var_number,1)
array_delete(player_id.saved_ammo_inmag,var_number,1)
array_delete(player_id.saved_ammo_reserve,var_number,1)
array_delete(player_id.saved_mag_loaded,var_number,1)
array_delete(player_id.saved_bullet_chambered,var_number,1)
with player_id{
if weapon_equipped = array_length(weapons_held) && weapon_equipped > 0{weapon_equipped -= 1}
if array_length(weapons_held) = 0{get_new_weapon(s_Unarmed)}
switch_to_weapon(weapon_equipped)
}

weapon_id = player_id.weapons_held[player_id.weapon_equipped]
script_execute_wpn(weapon_id)
sprite_index = weapon_id
}