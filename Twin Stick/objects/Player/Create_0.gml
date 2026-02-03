//Object will be created by CharacterSelect
spawned = false
array_push(GM.player_list,id)
set_tileset_collision()

//Gameplay Variables
input_number = 0//Input number set by CharacterSelect
hsp = 0;vsp = 0
hsp_knockback = 0;vsp_knockback = 0
hit_stun = 0
kills = 0
recoil = 0
aim_direction = 0;aim_x = 0;aim_y = 0
stick_aim_x = 0;stick_aim_y = 0
weapon_yscale = 1

//Player stats
player_name = ""
money = 500
mov_spd = 10
hp = 6;hp_max = 6
weapon_slots = 2
strength = 2
reload_speed = 1

//Weapon variables
ammo_inmag = 30
ammo_reserve = 30
reload_timer = -1
current_shoot_sfx = -1
revive_time = 180
revive_timer = 0
jam_chance = 0
jam_timer = 0
jam_time = 60
trigger_delay = 0
trigger_delay_timer = 0


//
refresh_grid = 60

slide_offset = 0

aim_object = 0//instance_create_depth(x,y,depth,PlayerAim)
melee = instance_create_depth(x,y,depth-1,MeleeWeapon)
melee.creator = id
melee_equipped = false

trigger_delay_timer = 0
can_control = true

shoot_timer = 0

weapon_number = 0
weapon = []

deploy_time = 15
deploy_timer = 0
deploying = false
gun_angle = 0
//aim_speed = 0.5

point_que = []
point_draw_dir_x = []
point_draw_dir_y = []
point_draw_timer = []

record_size = 200
for(var i = record_size-1; i >= 0; i--){
record_x[i] = x;record_y[i] = y}

pathfinding_grid = ds_grid_create(27,15)
//set_player_grid()

//Item variables
item_list = []
new_item = -1
item_draw_y = 0

damage_mult = 1
knockback_mult = 1

handgun_damage_mult = 0
handgun_recoil_mult = 0
handgun_knockback_mult = 0
shotgun_spread_mult = 0
shotgun_bullet_mult = 0
sniper_damage_mult = 0
sniper_spread_increase = 0

shoot_amount = 1
shoot_amount_increase = 0

ammo_recived_when_hurt = 0
wall_ammo_multiplier = 0
bullets_per_new_room = 0

shot_reward = 10
shot_reward_increase = 0
floor_mystery_box_rolls = 0
total_mystery_box_rolls = 0
free_mystery_box_rolls_per_floor = 0
cryptocoin = 0
png_explosions = 0

glitch_int_gun_sprite = 0.0
glitch_int_reserve = 0.0
glitch_int_mag = 0.0
glitch_int_gun_name = 0.0
glitch_int_portrait = 0.0
glitch_int_points = 0.0
glitch_int_item = [] 


function glitch_sprite(arg_sprite,arg_x,arg_y){
_width = sprite_get_width(arg_sprite)
_height = sprite_get_height(arg_sprite)
_x = arg_x-(_width/2)
_y = arg_y-(_height/2)
draw_surface_part(application_surface,_x,_y,_width,_height,_x,_y)}

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
if array_length(weapon) < weapon_slots{
saved_ammo_inmag[weapon_number] = ammo_inmag
saved_ammo_reserve[weapon_number] = ammo_reserve
weapon_number = array_length(weapon)}
weapon[weapon_number] = arg_weapon
weapon_sprite = arg_weapon
script_execute_wpn(arg_weapon)
saved_ammo_inmag[weapon_number] = ammo_inmag_max
saved_ammo_reserve[weapon_number] = ammo_reserve_max
glitch_int_mag = 1;glitch_int_reserve = 1
glitch_int_gun_name = 1;glitch_int_gun_sprite = 1
}

function switch_to_weapon(arg_weapon_number){
weapon_number = arg_weapon_number
script_execute_wpn(weapon[weapon_number])
ammo_inmag = saved_ammo_inmag[weapon_number]
ammo_reserve = saved_ammo_reserve[weapon_number]
glitch_int_mag = 1;glitch_int_reserve = 1
glitch_int_gun_name = 1;glitch_int_gun_sprite = 1
}


weapon = []
script_execute_wpn(s_m1911)
give_all_weapons = false
//give_all_weapons = true
if give_all_weapons = true{
weapon = []
weapon_slots = array_length(GM.weapon_list)
vrp = 0
repeat(weapon_slots){
get_new_weapon(GM.weapon_list[vrp])
switch_to_weapon(vrp)
vrp += 1
}
}