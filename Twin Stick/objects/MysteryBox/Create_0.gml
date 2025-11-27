home_x = GM.map_x
home_y = GM.map_y
if array_contains(GM.map_visited,x_plus_y(home_x,home_y)){
instance_destroy();exit
}

box_list = GM.box_list
display_text = false
box_open = false
box_timer = 0
box_toggle_timer = 0
box_toggle_length = 0
box_timer_take_weapon = 0
activate_box = false
block = -23
jam_chance = 0
jam_timer = 0
jam_time = 60
trigger_delay = 0
trigger_delay_timer = 0

damage_mult = 1
knockback_mult = 1
shoot_amount = 1
reload_speed = 1
handgun_damage_mult = 1
handgun_recoil_mult = 1
handgun_knockback_mult = 1
shotgun_spread_mult = 1
shotgun_bullet_mult = 1
sniper_damage_mult = 1
sniper_spread_increaser = 0
ammo_recived_when_hurt = 0