if GM.game_paused = true{exit}

depth = -y
if hp <= 0{
if GM.player_amount = 1{
game_restart()}
sprite_index = asset_get_index("s_"+string(player_name)+"Dead")
melee_equipped = false
melee.sprite_index = s_0
reload_timer = 0
}
else{
if can_control = true{
if input_number = "Keyboard"{
key_left = keyboard_check(vk_left) or keyboard_check(ord("A"))
key_right = keyboard_check(vk_right) or keyboard_check(ord("D"))
key_up = keyboard_check(vk_up) or keyboard_check(ord("W"))
key_down = keyboard_check(vk_down) or keyboard_check(ord("S"))
key_shoot = mouse_check_button(mb_left)
key_shoot_pressed = mouse_check_button_pressed(mb_left)
key_interact = keyboard_check(ord("E"))
key_interact_pressed = keyboard_check_pressed(ord("E"))
key_reload = keyboard_check_pressed(ord("R"))
key_map = keyboard_check(vk_tab)
key_weapon_toggle_back = mouse_wheel_up()
key_weapon_toggle_forward = mouse_wheel_down()
key_knife_pressed = mouse_check_button_pressed(mb_middle)
aim_direction = point_direction(x, y, mouse_x,mouse_y)
}
else{//Controller Controls
key_left = 0;key_right = 0;key_up = 0;key_down = 0
key_left = -gamepad_axis_value(input_number,gp_axislh);if key_left < 0.2{key_left = 0}
key_right = gamepad_axis_value(input_number,gp_axislh);if key_right < 0.2{key_right = 0}
key_up = -gamepad_axis_value(input_number,gp_axislv);if key_up < 0.2{key_up = 0}
key_down = gamepad_axis_value(input_number,gp_axislv);if key_down < 0.2{key_down = 0}
key_shoot = gamepad_button_check(input_number,gp_shoulderrb)
key_shoot_pressed = gamepad_button_check_pressed(input_number,gp_shoulderrb)
key_interact = gamepad_button_check(input_number,gp_face1)
key_interact_pressed = gamepad_button_check_pressed(input_number,gp_face1)
key_reload = gamepad_button_check_pressed(input_number,gp_face3)
key_map = gamepad_button_check(input_number,gp_select)
key_weapon_toggle_back = gamepad_button_check_pressed(input_number,gp_shoulderl)
key_weapon_toggle_forward = gamepad_button_check_pressed(input_number,gp_shoulderr) or gamepad_button_check_pressed(input_number,gp_face4)
key_knife_pressed = gamepad_button_check_pressed(input_number,gp_face2) or gamepad_button_check_pressed(input_number,gp_stickr)
if abs(gamepad_axis_value(input_number,gp_axisrh)) > 0.1 or abs(gamepad_axis_value(input_number,gp_axisrv)) > 0.1{
aim_x = ((gamepad_axis_value(input_number,gp_axisrh)*10) div 1)
aim_y = ((gamepad_axis_value(input_number,gp_axisrv)*10) div 1)}
stick_aim_x = gamepad_axis_value(input_number,gp_axisrh)
stick_aim_y = gamepad_axis_value(input_number,gp_axisrv)
aim_direction = point_direction(0, 0, aim_x,aim_y)
}
}
else{
key_left = -1;key_right = -1;key_up = -1;key_down = -1
key_shoot = -1;key_shoot_pressed = -1
key_interact = -1;key_interact_pressed = -1;
key_reload = -1
key_weapon_toggle_back = -1;key_weapon_toggle_forward = -1
key_knife_pressed = -1
}
//var_diff = angle_difference(aim_direction,gun_angle)
//gun_angle += var_diff * aim_speed;


if key_weapon_toggle_back or key_weapon_toggle_forward{
if deploying = false{
previous_deployed_weapon = weapon_number
deploying = true}
reload_timer = 0
if key_weapon_toggle_back{weapon_number -= 1;if weapon_number < 0{weapon_number = array_length(weapon)-1}}
if key_weapon_toggle_forward{weapon_number += 1;if weapon_number = array_length(weapon){weapon_number = 0}}

next_deployed_weapon = weapon_number

if previous_deployed_weapon = next_deployed_weapon{deploying = false}


melee_equipped = false
}

if deploy_timer >= deploy_time{
	deploying = false;
	saved_ammo_inmag[previous_deployed_weapon] = ammo_inmag
	saved_ammo_reserve[previous_deployed_weapon] = ammo_reserve
	weapon_number = next_deployed_weapon
	ammo_inmag = saved_ammo_inmag[weapon_number]
	ammo_reserve = saved_ammo_reserve[weapon_number]
	weapon_sprite = weapon[weapon_number]
	script_execute_wpn(weapon_sprite)
	deploy_timer = deploy_time
}

if deploying = false{if deploy_timer > 0{deploy_timer -= 1}}else{if deploy_timer < deploy_time{deploy_timer += 1}}
if deploy_timer < 0{deploy_timer = 0}



if key_knife_pressed{melee_equipped = true}


	script_execute_wpn(weapon_sprite)
	shoot_amount = 1
	spread_increase = 0
	spread_mult = 1
	damage_mult = 1
	recoil_mult = 1
	knockback_mult = 1
	bullet_mult = 1
	shot_reward += shot_reward_increase
	if array_contains(GM.handgun_list,weapon_sprite){
	damage_mult += handgun_damage_mult
	recoil_mult += handgun_recoil_mult
	knockback_mult += handgun_knockback_mult
	}
	if array_contains(GM.shotgun_list,weapon_sprite){
	spread_mult += shotgun_spread_mult
	bullet_mult += shotgun_bullet_mult
	}
	if array_contains(GM.sniper_list,weapon_sprite){
	spread_increase += sniper_spread_increase
	damage_mult += sniper_damage_mult
	}

	weapon_damage = round(weapon_damage*damage_mult)
	knockback = knockback*knockback_mult
	gun_recoil = gun_recoil*recoil_mult
	bullet_spread = (bullet_spread*spread_mult)+spread_increase
	shoot_amount = shoot_amount+shoot_amount_increase
	
if reload_timer = 0{if audio_exists(reload_sfx){audio_stop_sound(reload_sfx)}}
if reload_timer > 0{
	
if reload_bullet_time != 0{
if reload_timer >= reload_startup+((reload_bullet_time*reload_amount)-((ammo_inmag_max-ammo_inmag-1)*reload_bullet_time)) && reload_timer <= reload_time-reload_endlag+reload_speed
{ammo_inmag += 1;ammo_reserve -= 1}
}

if reload_timer >= reload_time{
reload_size = ammo_inmag_max-ammo_inmag
if reload_size > ammo_reserve{reload_size = ammo_reserve}
ammo_inmag += reload_size
ammo_reserve -= reload_size
reload_timer = -reload_speed
trigger_delay_timer = 0
}
reload_timer += reload_speed
}

if jam_timer > 0{jam_timer += reload_speed;if jam_timer >= jam_time{jam_timer = 0;trigger_delay_timer = 0}}


if ammo_inmag <= 0 && ammo_reserve > 0 && reload_timer = 0 or key_reload && ammo_reserve > 0 && ammo_inmag < ammo_inmag_max && reload_timer = 0
{
reload_timer = 1
play_sfx(reload_sfx)
}



if shoot_timer > 0{shoot_timer -= 1}

if abs(recoil) > 10{recoil *= 0.92}else{
recoil *= 0.9}
if recoil < 0.5 && recoil > -0.5{recoil = 0}

if key_shoot && ammo_inmag = 0 && ammo_reserve = 0{
//gun_toogle
}

if key_shoot{trigger_delay_timer += 1}else{trigger_delay_timer = 0}

if shoot_timer <= 0 && ammo_inmag > 0 && reload_timer = 0 && melee_equipped = false && jam_timer = 0 && trigger_delay_timer >= trigger_delay && deploy_timer = 0{
	
	if key_shoot && auto = true or key_shoot_pressed && auto = false or key_shoot && auto = false && trigger_delay_timer = trigger_delay{
	animate_slide = true
	shoot_timer = shoot_delay
	ammo_inmag -= 1
	direction = aim_direction+recoil
	var_x = sprite_get_xoffset(weapon_sprite)
	speed = sprite_get_width(weapon_sprite)-var_x-5
	var_x = x+(hspeed)
	var_y = y+(vspeed)
	speed = 0
	repeat(round(bullet_amount)){
	_bullet = instance_create_depth(var_x,var_y,depth+1,Bullet)
	_bullet.image_angle = aim_direction+recoil+irandom_range(-bullet_spread,bullet_spread)
	_bullet.damage = weapon_damage
	_bullet.penetration = penetration
	_bullet.bullet_speed = bullet_speed
	_bullet.knockback = bullet_knockback
	_bullet.sprite_index = bullet_sprite
	_bullet.creator = id
	_bullet.shot_reward = shot_reward
	_bullet.explosive = explosive
	_bullet.explosion_damage = explosion_damage
	_bullet.png_explosion_checks = png_explosions
	}

	if knockback < 0{knockback = 0}
	direction = aim_direction+recoil+180
	speed = knockback
	hsp_knockback = hspeed
	vsp_knockback = vspeed
	speed = 0
	recoil += gun_recoil*weapon_yscale
	current_shoot_sfx = play_sfx(shoot_sfx)
	audio_sound_pitch(current_shoot_sfx,audio_sound_get_pitch(current_shoot_sfx)+random_range(-0.045,0.0045))
	if jam_chance != 0 && irandom_range(1,jam_chance) = 1{jam_timer += 1}
	}
	
	
}


if melee_equipped = true{
if key_knife_pressed or key_shoot_pressed{
if melee.attacking = false{melee.attacking = true}
}
}
else{melee.sprite_index = s_0}

if place_meeting(x,y,Enemy) && hit_stun = 0{
hp -= 1;hit_stun = 60;
ammo_reserve += round(ammo_reserve_max*ammo_recived_when_hurt)
blood_splatter()
play_sfx(sfx_PlayerHurt)
}
if hit_stun > 0{hit_stun -= 1}

if hsp_knockback != 0{hsp_knockback *=0.9};if hsp_knockback < 0.1 && hsp_knockback > -0.1{hsp_knockback = 0}
if vsp_knockback != 0{vsp_knockback *=0.9};if vsp_knockback < 0.1 && vsp_knockback > -0.1{vsp_knockback = 0}



var_move = clamp(mov_spd-clamp((weapon_weight/strength),0,100),0,100)

hsp = (key_right-key_left)*var_move
hsp += hsp_knockback
vsp = (key_down-key_up)*var_move
vsp += vsp_knockback

if collision_present(x+hsp,y)
{
	while !collision_present(x+sign(hsp)*1,y){x += sign(hsp)*1}
	hsp = 0
}

x += hsp

if collision_present(x,y+vsp)
{
	while !collision_present(x,y+sign(vsp)*1){y += sign(vsp)*1}
	vsp = 0
}

 y += vsp
 
node_x = x div 48
node_y = y div 48
refresh_grid -= 1
if refresh_grid = 0{refresh_grid = 60}
if refresh_grid % GM.player_amount = 0{set_player_grid()}

if aim_direction  > 45 or aim_direction  < 135{aim_string = "U"}
if aim_direction  >= 135 && aim_direction  <= 225{aim_string = "L"}
if aim_direction  > 225 && aim_direction  < 315{aim_string = "D"}
if aim_direction  >= 315 or aim_direction  <= 45{aim_string = "R"}

sprite_string = "s_"+string(player_name)+string(aim_string)
sprite_index = asset_get_index(sprite_string)

if aim_object != 0{
aim_object.x = x;aim_object.y = y;aim_object.image_angle = aim_direction}
sprite_set_bbox(sprite_index,(sprite_width/2)-20,(sprite_height/2)-20,(sprite_width/2)+20,sprite_height)

if key_map{GM.draw_map = true}
#region Revive players
list_temp = ds_list_create()
instance_place_list(x,y,Player,list_temp,false)
var_repeat = 0
repeat(ds_list_size(list_temp)){
var_player = ds_list_find_value(list_temp,var_repeat)

if var_player.hp <= 0 && key_interact{
var_player.revive_timer += 1}

var_repeat += 1
}
ds_list_destroy(list_temp)
#endregion

#region Buyable Stuff
image_xscale = 1.2
image_yscale = 1.2
if place_meeting(x,y,MysteryBox){
var_object = instance_nearest(x,y,MysteryBox)
var_object.display_text = true
if key_interact_pressed && money >= 950 && var_object.box_open = false{
player_point_change(-950)
if free_mystery_box_rolls_per_floor > floor_mystery_box_rolls{player_point_change(950)}
var_object.activate_box = true
play_sfx(sfx_Buy)
floor_mystery_box_rolls += 1
total_mystery_box_rolls += 1
}

if key_interact_pressed && var_object.box_open = true && var_object.box_timer = 0{
var_object.box_open = false
if array_length(weapon) < weapon_slots{
saved_ammo_inmag[weapon_number] = ammo_inmag
saved_ammo_reserve[weapon_number] = ammo_reserve
weapon_number = array_length(weapon)}
weapon[weapon_number] = var_object.weapon_sprite
script_execute_wpn(weapon[weapon_number])
saved_ammo_inmag[weapon_number] = ammo_inmag_max
saved_ammo_reserve[weapon_number] = ammo_reserve_max
ammo_inmag = saved_ammo_inmag[weapon_number]
ammo_reserve = saved_ammo_reserve[weapon_number]
}
}
	
if place_meeting(x,y,WallBuy){
var_object = instance_nearest(x,y,WallBuy)
var_object.display_text = true
if key_interact_pressed && money >= var_object.cost{
player_point_change(-var_object.cost)
if array_length(weapon) < weapon_slots{
saved_ammo_inmag[weapon_number] = ammo_inmag
saved_ammo_reserve[weapon_number] = ammo_reserve
weapon_number = array_length(weapon)}
weapon[weapon_number] = var_object.weapon_sprite
script_execute_wpn(weapon[weapon_number])
saved_ammo_inmag[weapon_number] = ammo_inmag_max
saved_ammo_reserve[weapon_number] = round(ammo_reserve_max*wall_ammo_multiplier)
ammo_inmag = saved_ammo_inmag[weapon_number]
ammo_reserve = saved_ammo_reserve[weapon_number]
play_sfx(sfx_Buy)
}

}

if place_meeting(x,y,Item){
var_object = instance_nearest(x,y,Item)
var_object.display_text = true
if key_interact_pressed && money >= var_object.cost{
if var_object.item_is_free = false{player_point_change(-var_object.cost)}
new_item = var_object.sprite_index
array_push(GM.items_bought,var_object.sprite_index)
play_sfx(sfx_Buy)
}

}

if place_meeting(x,y,Teleporter) && key_interact{
Teleporter.teleport_timer += 1
}

image_xscale = 1;image_yscale = 1
#endregion End Of Buyable Stuff

//end of alive code
}


if place_meeting(x,y,RoomChange){
var_object = instance_place(x,y,RoomChange)
GM.next_room = var_object.next_room
}


#region Record Data
for(var i = record_size-1; i > 0; i--){
record_x[i] = record_x[i-1];record_x[0] = x
record_y[i] = record_y[i-1];record_y[0] = y
}
#endregion End Of Record Data

//Item data
if new_item != -1{
script_execute_item(new_item)
array_push(item_list,new_item)
new_item = -1
}