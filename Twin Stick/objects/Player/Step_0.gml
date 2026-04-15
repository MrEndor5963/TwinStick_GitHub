if GM.game_paused = true or room = r_FloorTransition{exit}

if new_floor = true{
i = 0
repeat(array_length(weapons_held)){
if array_contains(item_list,s_item_HammerAndSickle) && array_contains(GM.soviet_list,weapons_held[i]){
switch_to_weapon(i)
ammo_inmag = ammo_inmag_max
ammo_reserve = ammo_reserve_max
}
i += 1}
floor_mystery_box_rolls = 0
repeat(cryptocoin){player_point_change(irandom_range(-10000,10000))}
new_floor = false
}

depth = -y
if hp <= 0{
sprite_index = asset_get_index("s_"+string(player_name)+"Dead")
melee_equipped = false
melee.sprite_index = s_0
jam_timer = 0
reload_timer = -1
}
else{
if can_control = true && hit_stun < 60{
if input_number = "Keyboard"{
key_left = keyboard_check(vk_left) or keyboard_check(ord("A"))
key_right = keyboard_check(vk_right) or keyboard_check(ord("D"))
key_up = keyboard_check(vk_up) or keyboard_check(ord("W"))
key_down = keyboard_check(vk_down) or keyboard_check(ord("S"))
key_aim = mouse_check_button(mb_right)
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
key_aim = gamepad_button_check(input_number,gp_shoulderlb)
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
aim_y = ((gamepad_axis_value(input_number,gp_axisrv)*10) div 1)
//aim_x = gamepad_axis_value(input_number,gp_axisrh)
//aim_y = gamepad_axis_value(input_number,gp_axisrv)
}
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
#region weapon toggling
if key_shoot_pressed && ammo_inmag = 0 && ammo_reserve = 0 && deploying = false && melee_equipped = false{
key_weapon_toggle_forward = true}

if array_length(weapons_held) = 1 && melee_equipped = false{
key_weapon_toggle_back = false
key_weapon_toggle_forward = false}


if key_weapon_toggle_back or key_weapon_toggle_forward{
if melee_equipped = true{
melee_equipped = false
key_weapon_toggle_back = false
key_weapon_toggle_forward = false
}
if deploying = false{
next_weapon_equipped = weapon_equipped
deploying = true}
reload_timer = -1
if key_weapon_toggle_back{next_weapon_equipped -= 1;if next_weapon_equipped < 0{next_weapon_equipped = array_length(weapons_held)-1}}
if key_weapon_toggle_forward{next_weapon_equipped += 1;if next_weapon_equipped = array_length(weapons_held){next_weapon_equipped = 0}}
melee_equipped = false
}

if deploying = false{if deploy_timer > 0{deploy_timer -= 1}}
if deploy_timer < 0{deploy_timer = 0}
if deploying = true{
if deploy_timer < deploy_time{deploy_timer += 1}
if next_weapon_equipped = weapon_equipped{deploying = false}}

if deploy_timer >= deploy_time{
	reload_timer = -1
	deploying = false;
	saved_ammo_inmag[weapon_equipped] = ammo_inmag
	saved_ammo_reserve[weapon_equipped] = ammo_reserve
	switch_to_weapon(next_weapon_equipped);
	deploy_timer = deploy_time
}

#endregion End of Weapon toggling

if hsp_knockback != 0{hsp_knockback *=0.9};if hsp_knockback < 0.1 && hsp_knockback > -0.1{hsp_knockback = 0}
if vsp_knockback != 0{vsp_knockback *=0.9};if vsp_knockback < 0.1 && vsp_knockback > -0.1{vsp_knockback = 0}

mov_debuff = 0
if instance_exists(Enemy){mov_debuff = turtle_mov_mult}
var_move = (mov_spd*(mov_mult-mov_debuff))-clamp(weapon_weight/strength,0,100)
if var_move<0{var_move = 0.5}
if var_move > (mov_spd*mov_mult){var_move = mov_spd}

if GM.time_in_room < rage_spell_time{var_move *= 2}

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

refresh_grid -= 1
if refresh_grid = 0{refresh_grid = 60}
if refresh_grid % GM.player_amount = 0{set_player_grid()}

if aim_direction  > 45 or aim_direction  < 135{aim_string = "U"}
if aim_direction  >= 135 && aim_direction  <= 225{aim_string = "L"}
if aim_direction  > 225 && aim_direction  < 315{aim_string = "D"}
if aim_direction  >= 315 or aim_direction  <= 45{aim_string = "R"}

sprite_string = "s_"+string(player_name)+string(aim_string)
sprite_index = asset_get_index(sprite_string)
sprite_set_bbox(sprite_index,30,50,(sprite_width)-30,sprite_height)



if place_meeting(x,y,[Enemy,PNGExplosion,SlugeeTrail]) && hit_stun = 0 or take_damage = true{
if place_meeting(x,y,Enemy) or place_meeting(x,y,PNGExplosion){
if place_meeting(x,y,Enemy){var_thing = instance_nearest(x,y,Enemy)}
if place_meeting(x,y,PNGExplosion){var_thing = instance_nearest(x,y,PNGExplosion)}
direction = point_direction(x,y,var_thing.x,var_thing.y)+180
	speed = 30/weight
	hsp_knockback += hspeed
	vsp_knockback += vspeed
	GM.cam_angle = -hspeed
speed = 0
}
hp -= 1;hit_stun = 90;
GM.glitch_intensity += 1
ammo_reserve += round(ammo_reserve_max*ammo_recived_when_hurt)
blood_splatter()
play_sfx(sfx_PlayerHurt)
//freeze_frame(100)
take_damage = false

}
if hit_stun > 70 && GM.game_paused = false{
audio_sound_pitch(GM.floor_music_id,1-((90-hit_stun)/50))
//room_speed = 60-(hit_stun*0.5)
//change pitch from 0.01 each to 0.02 each
}//else{if room_speed < 60{room_speed += 1}}
if hit_stun > 0{hit_stun -= 1}

if aim_object != 0{
aim_object.x = x;aim_object.y = y;aim_object.image_angle = aim_direction}

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
	set_image_scale(1.5)
	useable_money = money+debt_limit

	if place_meeting(x,y,MysteryBox){
	var_object = instance_nearest(x,y,MysteryBox)
	if key_interact_pressed && useable_money >= 950 && var_object.box_open = false{
	player_point_change(-950)
	if free_mystery_box_rolls_per_floor > floor_mystery_box_rolls{player_point_change(950)}
	var_object.activate_box = true
	play_sfx(sfx_Buy)
	floor_mystery_box_rolls += 1
	total_mystery_box_rolls += 1
	}

	if key_interact_pressed && var_object.box_open = true && var_object.box_timer = 0{
	var_object.box_open = false
	get_new_weapon(var_object.weapon_sprite)
	switch_to_weapon(weapon_equipped)
	}
	}

	useable_money = money+debt_limit
	if place_meeting(x,y-10,WallBuy){
	var_object = instance_nearest(x,y-10,WallBuy)
	if key_interact_pressed && useable_money >= var_object.cost{
	if array_length(weapons_held) = weapon_slots_max{
	floor_gun = instance_create_depth(x,y,depth+10,FloorGun)
	//do - sprite_width/2 and stuff
	floor_gun.weapon_sprite = weapon_sprite
	floor_gun.saved_ammo_inmag = ammo_inmag
	floor_gun.saved_ammo_reserve = ammo_reserve
	floor_gun.floor_y = y+(sprite_height/8)}
	player_point_change(-var_object.cost)
	get_new_weapon(var_object.weapon_sprite)
	saved_ammo_reserve[weapon_equipped] += round(ammo_reserve_max*wall_ammo_multiplier)
	switch_to_weapon(weapon_equipped)
	play_sfx(sfx_Buy)
	with var_object{instance_destroy()}
	}
	}

	useable_money = money+debt_limit
	if place_meeting(x,y,Item){
	var_object = instance_nearest(x,y,Item)
	if key_interact_pressed && useable_money >= var_object.cost{
	if var_object.item_is_free = false{player_point_change(-var_object.cost)}
	new_item = var_object.sprite_index
	if var_object.consumable = false{array_push(GM.items_bought,var_object.sprite_index)}
	if var_object.rebuyable = false{with var_object{instance_destroy()}}
	with var_object{bought = true}
	play_sfx(sfx_Buy)
	}

	}

	if place_meeting(x,y,Teleporter) && key_interact{
	Teleporter.teleport_timer += 1
	}

	set_image_scale(1)
#endregion End Of Buyable Stuff


	if place_meeting(x,y,FloorGun){
	var_object = instance_nearest(x,y,FloorGun)
	if key_interact_pressed && var_object.y >= var_object.floor_y{
	if array_length(weapons_held) = weapon_slots_max{
	floor_gun = instance_create_depth(x,y,depth+10,FloorGun)
	floor_gun.weapon_sprite = weapon_sprite
	floor_gun.saved_ammo_inmag = ammo_inmag
	floor_gun.saved_ammo_reserve = ammo_reserve
	floor_gun.floor_y = var_object.y}
	get_new_weapon(var_object.weapon_sprite)
	saved_ammo_reserve[weapon_equipped] = var_object.ammo_reserve
	ammo_inmag[weapon_equipped] = var_object.ammo_inmag
	switch_to_weapon(weapon_equipped)
	//play_sfx(sfx_Buy)
	with var_object{instance_destroy()}
	}
	}
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

#region
camera_box = instance_place(x,y,CameraBox)
if camera_box != noone{
GM.clamp_x1 = camera_box.clamp_x1;
GM.clamp_x2 = camera_box.clamp_x2
GM.clamp_y1 = camera_box.clamp_y1
GM.clamp_y2 = camera_box.clamp_y2
}
#endregion

//Item data
if new_item != -1{
script_execute_item(new_item)
if consumable = false{array_push(item_list,new_item)}
new_item = -1
}

if loan_fish > 0{
if money >= 0{loan_timer_seconds = 5}else{
loan_timer_frames -= 1
if loan_timer_frames <= 0{loan_timer_frames = 60;loan_timer_seconds -= 1}
if loan_timer_seconds = 0{hp -= 1;loan_timer_seconds = 5}
}
}