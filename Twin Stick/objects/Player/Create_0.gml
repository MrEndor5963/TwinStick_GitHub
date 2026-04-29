//Object will be created by CharacterSelect
spawned = false
new_floor = false
array_push(GM.player_list,id)
set_tileset_collision()

floor_y = y

//Gameplay Variables
input_number = 0//Input number set by CharacterSelect
hsp = 0;vsp = 0
hsp_knockback = 0;vsp_knockback = 0
hit_stun = 0
kills = 0
recoil = 0
aim_direction = 0;aim_x = 0;aim_y = 0
stick_aim_x = 0;stick_aim_y = 0
blood_color = $FF00FF

//Player stats
player_name = ""
money = 500
mov_spd = 10
hp = 6;hp_max = 6
weapon_slots_max = 2
strength = 2
reload_speed = 1

debt_limit = 0
loan_fish = 0
loan_timer_frames = 0
loan_timer_seconds = 5
//Weapon variables

ammo_inmag = 30
ammo_reserve = 30
bullet_chambered = true
mag_loaded = true
reload_progress = -1
current_shoot_sfx = -1
revive_time = 180
revive_timer = 0
jam_chance = 0
jam_timer = 0
jam_time = 60
trigger_delay = 0
trigger_delay_timer = 0
trigger_needs_reset = false


//
refresh_grid = 60

p_weapon = instance_create_depth(x,y,depth-1,PlayerWeapon)
p_weapon.player_id = id

trigger_delay_timer = 0
can_control = true

shoot_timer = 0

key_aim = false

weapon_equipped = 0
weapons_held = []

deploy_time = 15
deploy_timer = 0
deploying = false
//aim_speed = 0.5

point_que = []
point_draw_dir_x = []
point_draw_dir_y = []
point_draw_timer = []

record_size = 200
for(var i = record_size-1; i >= 0; i--){
record_x[i] = x;record_y[i] = y}

pathfinding_grid = ds_grid_create(20,12)
//set_player_grid()
take_damage = false
//Item variables
item_list = []
new_item = -1
item_draw_y = 0

mov_mult = 1
turtle_mov_mult = 0

weapon_weight = 0
weight_mult = 1

damage_mult = 0
player_reload_mult = 0
knockback_mult = 1

handgun_damage_mult = 0
handgun_recoil_mult = 0
handgun_knockback_mult = 0
revolver_reload_mult = 0
revolver_hammer_time_divider = 1
revolver_deploy_time_divider = 1
smg_shot_delay_decrease = 0
shotgun_spread_mult = 0
shotgun_bullet_mult = 0
twelve_bonus_ammo = 0
sniper_damage_mult = 0
sniper_spread_increase = 0

soviet_ammo_mult = 0

shoot_amount = 1
shoot_amount_increase = 0

ammo_recived_when_hurt = 0
wall_ammo_multiplier = 0
bullets_per_new_room = 0

//player_shot_reward_mult = 1
//player_kill_reward_mult = 1
hit_reward_increase = 0
floor_mystery_box_rolls = 0
total_mystery_box_rolls = 0
free_mystery_box_rolls_per_floor = 0
cryptocoin = 0
png_explosions = 0
rage_spell_time = 0

cool_s_mult = 0

glitch_int_gun_sprite = 0.0
glitch_int_reserve = 0.0
glitch_int_mag = 0.0
glitch_int_gun_name = 0.0
glitch_int_portrait = 0.0
glitch_int_points = 0.0
//glitch_int_item = [] 


function player_destroy_protocol(){
ds_grid_destroy(pathfinding_grid)
instance_destroy(p_weapon)
instance_destroy()
}

function glitch_text(arg_x,arg_y,arg_text){
_width = string_width(arg_text)
_height = string_height(arg_text)
_x = arg_x
if pon_x = -1{_x = arg_x-_width}
_y = arg_y-(_height/2)
draw_surface_part(application_surface,_x,_y,_width,_height,_x,_y)}

function player_point_change(arg_amount){
array_insert(point_que,0,arg_amount)
array_insert(point_draw_timer,0,0)
glitch_int_points = 1
}

function get_new_weapon(arg_weapon){
if array_length(weapons_held) = 0 or weapons_held[0] = s_Unarmed{weapons_held = []}

if array_length(weapons_held) < weapon_slots_max{
if array_length(weapons_held) > 0{
saved_ammo_inmag[weapon_equipped] = ammo_inmag
saved_ammo_reserve[weapon_equipped] = ammo_reserve
saved_bullet_chambered[weapon_equipped] = bullet_chambered
saved_mag_loaded[weapon_equipped] = mag_loaded
saved_case_ejects_needed[weapon_equipped] = case_ejects_needed
}
weapon_equipped = array_length(weapons_held)}
else{
	//toss weapon
	
	_thrown = instance_create_depth(p_weapon.x,p_weapon.y,depth,FloorWeapon)
	_thrown.player_id = id;
	_thrown.image_yscale = p_weapon.image_yscale
	_thrown.image_angle = p_weapon.image_angle
	_thrown.weapon_id = p_weapon.weapon_id
	_thrown.z = y-floor_y
	_thrown.floor_y = floor_y
	_thrown.ammo_inmag = ammo_inmag
	_thrown.ammo_reserve = ammo_reserve
	_thrown.bullet_chambered = bullet_chambered
	_thrown.mag_loaded = mag_loaded
	_thrown.thrown = false
	
}
weapons_held[weapon_equipped] = arg_weapon
weapon_sprite = arg_weapon
script_execute_wpn(arg_weapon)
saved_ammo_inmag[weapon_equipped] = ammo_inmag_max
saved_ammo_reserve[weapon_equipped] = ammo_reserve_max
saved_bullet_chambered[weapon_equipped] = true
saved_mag_loaded[weapon_equipped] = true
saved_case_ejects_needed[weapon_equipped] = 0
glitch_int_mag = 1;glitch_int_reserve = 1
glitch_int_gun_name = 1;glitch_int_gun_sprite = 1
}

function switch_to_weapon(arg_weapon_equipped){
p_weapon.reload_progress= -1
weapon_equipped = arg_weapon_equipped
if array_length(weapons_held) = 0{weapons_held[0] = s_Unarmed}
script_execute_wpn(weapons_held[weapon_equipped])
ammo_inmag = saved_ammo_inmag[weapon_equipped]
ammo_reserve = saved_ammo_reserve[weapon_equipped]
bullet_chambered = saved_bullet_chambered[weapon_equipped]
mag_loaded = saved_mag_loaded[weapon_equipped]
case_ejects_needed = saved_case_ejects_needed[weapon_equipped]
glitch_int_mag = 1;glitch_int_reserve = 1
glitch_int_gun_name = 1;glitch_int_gun_sprite = 1
if action_type = s_SemiAuto or action_type = s_FullAuto{p_weapon.shoot_timer = shoot_delay}
else{if bullet_chambered = false{p_weapon.shoot_timer = 0}else{p_weapon.shoot_timer = shoot_delay}}
}

weapons_held = []
script_execute_wpn(s_m1911)
give_all_weapons = false
//give_all_weapons = true
if give_all_weapons = true{
weapons_held = []
weapon_slots_max = array_length(GM.weapon_list)
vrp = 0
repeat(weapon_slots_max){
get_new_weapon(GM.weapon_list[vrp])
switch_to_weapon(vrp)
vrp += 1
}
}