next_room = 0
player_name = "Hazel"
array_push(GM.player_list,id)
player_number = GM.player_amount
GM.player_amount += 1
hsp = 0;vsp = 0
hsp_knockback = 0;vsp_knockback = 0
mov_spd = 8
hp = 4;hp_max = 4
hit_stun = 0
money = 5000
kills = 0
//money = 0

aim_direction = 0;aim_x = 0;aim_y = 0
stick_aim_x = 0;stick_aim_y = 0
ammo_inmag = 30
reload_timer = 0


aim_object = 0//instance_create_depth(x,y,depth,PlayerAim)

//Default stats
give_all_weapons = false
box_list = GM.box_list 

//weapon_slots_max = 3

recoil_cooldown = 0
shoot_timer = 0

weapon_number = 1
spawned = false