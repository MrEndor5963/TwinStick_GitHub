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
key_left = keyboard_check(vk_left) or keyboard_check(ord("A"))
//key_left_pressed = keyboard_check_pressed(vk_left) or keyboard_check_pressed(ord("A"))
key_right = keyboard_check(vk_right) or keyboard_check(ord("D"))
//key_right_pressed = keyboard_check_pressed(vk_right) or keyboard_check_pressed(ord("D"))
key_up = keyboard_check(vk_up) or keyboard_check(ord("W"))
//key_up_pressed = keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W"))
key_down = keyboard_check(vk_down) or keyboard_check(ord("S"))
//key_down_pressed = keyboard_check_pressed(vk_d+wn) or keyboard_check_pressed(ord("S"))
key_shoot = mouse_check_button(mb_left) or gamepad_button_check(input_number,gp_shoulderrb)
key_shoot_pressed = mouse_check_button_pressed(mb_left) or gamepad_button_check_pressed(input_number,gp_shoulderrb)
key_interact = keyboard_check(ord("E")) or gamepad_button_check(input_number,gp_face1)
key_interact_pressed = keyboard_check_pressed(ord("E")) or gamepad_button_check_pressed(input_number,gp_face1)
key_reload = keyboard_check_pressed(ord("R")) or gamepad_button_check_pressed(input_number,gp_face3)
key_map = keyboard_check(vk_tab) or gamepad_button_check(input_number,gp_select)

key_weapon_toggle_back = gamepad_button_check_pressed(input_number,gp_shoulderl) or mouse_wheel_up()
key_weapon_toggle_forward = gamepad_button_check_pressed(input_number,gp_shoulderr) or mouse_wheel_down()
key_knife_pressed = gamepad_button_check_pressed(input_number,gp_face2) or gamepad_button_check_pressed(input_number,gp_stickr)
}
else{
key_left = -1;key_right = -1;key_up = -1;key_down = -1
key_shoot = -1;key_shoot_pressed = -1
key_interact = -1;key_interact_pressed = -1;
key_reload = -1
key_weapon_toggle_back = -1;key_weapon_toggle_forward = -1
key_knife_pressed = -1
}

if key_weapon_toggle_back or key_weapon_toggle_forward{
	
reload_timer = 0
if give_all_weapons = false{
weapon_ammo_inmag[weapon_number] = ammo_inmag
weapon_ammo_reserve[weapon_number] = ammo_reserve
if key_weapon_toggle_back{weapon_number -= 1;if weapon_number < 0{weapon_number = array_length(weapon)-1}}
if key_weapon_toggle_forward{weapon_number += 1;if weapon_number = array_length(weapon){weapon_number = 0}}
ammo_inmag = weapon_ammo_inmag[weapon_number]
ammo_reserve = weapon_ammo_reserve[weapon_number]
}
else{ammo_reserve = 1000
if key_weapon_toggle_back{weapon_number -= 1;if weapon_number < 0{weapon_number = array_length(box_list)-1}}
if key_weapon_toggle_forward{weapon_number += 1;if weapon_number = array_length(box_list){weapon_number = 0}}
weapon_sprite = array_get(box_list,weapon_number)}
melee_equipped = false
}

if give_all_weapons = false && melee_equipped = false{weapon_sprite = array_get(weapon,weapon_number)}

weapon_damage = 10
penetration = 1
base_recoil = 0.5
shoot_delay = 12
knockback = 2
bullet_speed = 60
bullet_sprite = s_Bullet
reload_time = 60
weapon_weight = 0.5
bullet_amount = 1
bullet_spread = 0
reload_sfx = sfx_m1911Reload
shoot_sfx = sfx_m1911Shoot
//bullet_xoff = 0
//bullet_yoff = 0

if key_knife_pressed{melee_equipped = true}

if melee_equipped = false{
script_execute_wpn(weapon_sprite)}

if abs(gamepad_axis_value(input_number,gp_axisrh)) > 0.1 or abs(gamepad_axis_value(input_number,gp_axisrv)) > 0.1{
aim_x = ((gamepad_axis_value(input_number,gp_axisrh)*10) div 1)
aim_y = ((gamepad_axis_value(input_number,gp_axisrv)*10) div 1)}

stick_aim_x = gamepad_axis_value(input_number,gp_axisrh)
stick_aim_y = gamepad_axis_value(input_number,gp_axisrv)

aim_direction = point_direction(0, 0, aim_x,aim_y)
//aim_direction = point_direction(x, y, mouse_x,mouse_y)

if shoot_timer > 0{shoot_timer -= 1}
if abs(recoil) > 10{recoil *= 0.92}else{
recoil *= 0.9}
if recoil < 0.5 && recoil > -0.5{recoil = 0}
if reload_timer = 0{if audio_exists(reload_sfx){audio_stop_sound(reload_sfx)}}
if reload_timer > 0{
if reload_timer = reload_time{
reload_size = ammo_inmag_max-ammo_inmag
if reload_size > ammo_reserve{reload_size = ammo_reserve}
ammo_inmag += reload_size
ammo_reserve -= reload_size
reload_timer = -1
}
reload_timer += 1
}



if ammo_inmag = 0 && ammo_reserve > 0 && reload_timer = 0 or key_reload && ammo_reserve > 0 && ammo_inmag < ammo_inmag_max && reload_timer = 0
{
reload_timer = 1
play_sfx(reload_sfx)
}

if key_shoot && ammo_inmag = 0 && ammo_reserve = 0{

}

if shoot_timer <= 0 && ammo_inmag > 0 && reload_timer = 0 && melee_equipped = false{
if key_shoot && auto = true or key_shoot_pressed && auto = false{
shoot_timer = shoot_delay
ammo_inmag -= 1
direction = aim_direction+recoil
var_x = sprite_get_xoffset(weapon_sprite)
speed = sprite_get_width(weapon_sprite)-var_x-5
var_x = x+(hspeed)
var_y = y+(vspeed)
speed = 0
repeat(bullet_amount){
_bullet = instance_create_depth(var_x,var_y,depth-1,Bullet)
_bullet.image_angle = aim_direction+recoil+irandom_range(-bullet_spread,bullet_spread)
_bullet.damage = weapon_damage
_bullet.penetration = penetration
_bullet.bullet_speed = bullet_speed
_bullet.sprite_index = bullet_sprite
_bullet.creator = id
}

direction = aim_direction+recoil+180
speed = knockback
hsp_knockback = hspeed
vsp_knockback = vspeed
speed = 0
recoil += base_recoil*weapon_yscale
current_shoot_sfx = play_sfx(shoot_sfx)
audio_sound_pitch(current_shoot_sfx,audio_sound_get_pitch(current_shoot_sfx)+random_range(-0.045,0.0045))
}
}

	
if melee_equipped = true{
if key_knife_pressed or key_shoot_pressed{
if melee.attacking = false{melee.attacking = true}
}
}
else{melee.sprite_index = s_0}

if place_meeting(x,y,Enemy) && hit_stun = 0{hp -= 1;hit_stun = 30+(GM.player_amount*5);blood_splatter()}
if hit_stun > 0{hit_stun -= 1}

if hsp_knockback != 0{hsp_knockback *=0.9};if hsp_knockback < 0.1 && hsp_knockback > -0.1{hsp_knockback = 0}
if vsp_knockback != 0{vsp_knockback *=0.9};if vsp_knockback < 0.1 && vsp_knockback > -0.1{vsp_knockback = 0}



var_move = clamp(mov_spd-clamp((weapon_weight/strength),0,100),0,100)

hsp = (key_right-key_left)*var_move
if abs(gamepad_axis_value(input_number,gp_axislh)) > 0.2{hsp = gamepad_axis_value(input_number,gp_axislh)*var_move}
hsp += hsp_knockback
vsp = (key_down-key_up)*var_move
if abs(gamepad_axis_value(input_number,gp_axislv)) > 0.2{vsp = gamepad_axis_value(input_number,gp_axislv)*var_move}
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
var_object.activate_box = true
}

if key_interact_pressed && var_object.box_open = true && var_object.box_timer = 0{
var_object.box_open = false
if array_length(weapon) < weapon_slots{
weapon_ammo_inmag[weapon_number] = ammo_inmag
weapon_ammo_reserve[weapon_number] = ammo_reserve
weapon_number = array_length(weapon)}
weapon[weapon_number] = var_object.weapon_sprite
script_execute_wpn(weapon[weapon_number])
weapon_ammo_inmag[weapon_number] = ammo_inmag_max
weapon_ammo_reserve[weapon_number] = ammo_reserve_max
ammo_inmag = weapon_ammo_inmag[weapon_number]
ammo_reserve = weapon_ammo_reserve[weapon_number]
}
}
	
if place_meeting(x,y,WallBuy){
var_object = instance_nearest(x,y,WallBuy)
var_object.display_text = true
if key_interact_pressed && money >= var_object.cost{
player_point_change(-var_object.cost)
if array_length(weapon) < weapon_slots{
weapon_ammo_inmag[weapon_number] = ammo_inmag
weapon_ammo_reserve[weapon_number] = ammo_reserve
weapon_number = array_length(weapon)}
weapon[weapon_number] = var_object.weapon_sprite
script_execute_wpn(weapon[weapon_number])
weapon_ammo_inmag[weapon_number] = ammo_inmag_max
weapon_ammo_reserve[weapon_number] = ammo_reserve_max
ammo_inmag = weapon_ammo_inmag[weapon_number]
ammo_reserve = weapon_ammo_reserve[weapon_number]
}

}

if place_meeting(x,y,ShopItem){
var_object = instance_nearest(x,y,ShopItem)
var_object.display_text = true
if key_interact_pressed && money >= var_object.cost{
player_point_change(-var_object.cost)
new_item = var_object.sprite_index
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