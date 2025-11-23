next_room = 0
player_name = "Hazel"
array_push(GM.player_list,id)
input_number = 0
hsp = 0;vsp = 0
hsp_knockback = 0;vsp_knockback = 0
mov_spd = 10
hp = 6;hp_max = 6
hit_stun = 0
money = 1000
kills = 0
//money = 0
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
//Default stats
give_all_weapons = true
give_all_weapons = false
box_list = GM.box_list
can_control = true


weapon_slots = 2

shoot_timer = 0

weapon_number = 0
spawned = false

node_x = x div 48
node_y = y div 48

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