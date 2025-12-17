next_room = 0
player_name = "Hazel"
array_push(GM.player_list,id)
input_number = 0
hsp = 0;vsp = 0
hsp_knockback = 0;vsp_knockback = 0
mov_spd = 10
hp = 6;hp_max = 6
hit_stun = 0
money = 500
kills = 0
recoil = 0
weapon_yscale = 1

aim_direction = 0;aim_x = 0;aim_y = 0
stick_aim_x = 0;stick_aim_y = 0
ammo_inmag = 30
reload_timer = 0
//current_reload_sfx = -1
current_shoot_sfx = -1
revive_time = 180
revive_timer = 0
strength = 2

refresh_grid = 60

aim_object = 0//instance_create_depth(x,y,depth,PlayerAim)
melee = instance_create_depth(x,y,depth-1,MeleeWeapon)
melee.creator = id
melee_equipped = false

trigger_delay_timer = 0
//Default stats
give_all_weapons = true
//give_all_weapons = false
can_control = true


weapon_slots = 2

shoot_timer = 0

weapon_number = 0
spawned = false

node_x = x div 48
node_y = y div 48
deploy_time = 15
deploy_timer = 0
deploying = false
previous_deployed_weapon = 0
next_deployed_weapon = 0
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
item_list = []
new_item = -1
item_draw_y = 0

jam_chance = 0
jam_timer = 0
jam_time = 60
trigger_delay = 0
trigger_delay_timer = 0

damage_mult = 1
knockback_mult = 1
shoot_amount = 1
reload_speed = 1
shoot_amount_increase = 0
handgun_damage_mult = 0
handgun_recoil_mult = 0
handgun_knockback_mult = 0
shotgun_spread_mult = 0
shotgun_bullet_mult = 0
sniper_damage_mult = 0
sniper_spread_increase = 0
ammo_recived_when_hurt = 0
wall_ammo_multiplier = 1
bullets_per_new_room = 0

shot_reward = 10
shot_reward_increase = 0
floor_mystery_box_rolls = 0
total_mystery_box_rolls = 0
free_mystery_box_rolls_per_floor = 0
cryptocoin = 0
png_explosions = 0

if give_all_weapons = true{
vrp = 0
repeat(array_length(GM.weapon_list)){
weapon[vrp] = GM.weapon_list[vrp]
weapon_sprite = weapon[vrp]
script_execute_wpn(weapon_sprite)
saved_ammo_inmag[vrp] = ammo_inmag_max
saved_ammo_reserve[vrp] = ammo_reserve_max
vrp += 1
}
}