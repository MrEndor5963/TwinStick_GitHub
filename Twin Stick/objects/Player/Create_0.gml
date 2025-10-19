next_room = 0

array_push(global.player_list,id)
player_number = global.player_amount
global.player_amount += 1
hsp = 0;vsp = 0
hsp_knockback = 0;vsp_knockback = 0
mov_spd = 10
hp = 300000
hit_stun = 0
kills = 0
shoot_timer = 0

aim_direction = 0;aim_x = 0;aim_y = 0
stick_aim_x = 0;stick_aim_y = 0

auto = true;recoil_cooldown = 0

aim_object = 0//instance_create_depth(x,y,depth,PlayerAim)

//Default stats
weapon_sprite = s_m1911

weapon_list = []
array_push(weapon_list,s_m1911)
array_push(weapon_list,s_mp5)
array_push(weapon_list,s_spectre)
array_push(weapon_list,s_AK47cs)
array_push(weapon_list,s_AWP)
array_push(weapon_list,s_DSR50)
array_push(weapon_list,s_SquareGun)
weapon_number = 0
weapon_sprite = array_get(weapon_list,weapon_number)

set_tileset_collision()