depth = -y
set_tileset_collision()
if hp <= 0{game_restart()}


if can_control = true{
key_left = keyboard_check(vk_left) or keyboard_check(ord("A"))
//key_left_pressed = keyboard_check_pressed(vk_left) or keyboard_check_pressed(ord("A"))
key_right = keyboard_check(vk_right) or keyboard_check(ord("D"))
//key_right_pressed = keyboard_check_pressed(vk_right) or keyboard_check_pressed(ord("D"))
key_up = keyboard_check(vk_up) or keyboard_check(ord("W"))
//key_up_pressed = keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W"))
key_down = keyboard_check(vk_down) or keyboard_check(ord("S"))
//key_down_pressed = keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S"))
key_shoot = mouse_check_button(mb_left) or gamepad_button_check(input_number,gp_shoulderrb)
key_shoot_pressed = mouse_check_button_pressed(mb_left) or gamepad_button_check_pressed(input_number,gp_shoulderrb)
key_interact = keyboard_check_pressed(ord("E")) or gamepad_button_check_pressed(input_number,gp_face1)
key_reload = keyboard_check_pressed(ord("R")) or gamepad_button_check_pressed(input_number,gp_face3)

key_weapon_toggle_back = gamepad_button_check_pressed(input_number,gp_shoulderl) or mouse_wheel_up()
key_weapon_toggle_forward = gamepad_button_check_pressed(input_number,gp_shoulderr) or mouse_wheel_down()
}
else{
key_left = -1;key_right = -1;key_up = -1;key_down = -1
key_shoot = -1;key_shoot_pressed = -1
key_interact = -1;key_reload = -1
key_weapon_toggle_back = -1;key_weapon_toggle_forward = -1
}


if key_weapon_toggle_back or key_weapon_toggle_forward{
if give_all_weapons = false{
reload_timer = 0
weapon_ammo_inmag[weapon_number] = ammo_inmag
weapon_ammo_reserve[weapon_number] = ammo_reserve
if key_weapon_toggle_back{weapon_number -= 1;if weapon_number < 0{weapon_number = array_length(weapon)-1}}
if key_weapon_toggle_forward{weapon_number += 1;if weapon_number = array_length(weapon){weapon_number = 0}}
ammo_inmag = weapon_ammo_inmag[weapon_number]
ammo_reserve = weapon_ammo_reserve[weapon_number]
}
else{
if key_weapon_toggle_back{weapon_number -= 1;if weapon_number < 0{weapon_number = array_length(box_list)-1}}
if key_weapon_toggle_forward{weapon_number += 1;if weapon_number = array_length(box_list){weapon_number = 0}}
weapon_sprite = array_get(box_list,weapon_number)}
}

if give_all_weapons = false{weapon_sprite = array_get(weapon,weapon_number)}

weapon_damage = 1
penetration = 1
base_recoil = 0.5
shoot_delay = 12
knockback = 2
bullet_speed = 60
bullet_sprite = s_Bullet
reload_time = 60
weapon_weight = 0
bullet_amount = 1
bullet_spread = 0

script_execute_wpn(weapon_sprite)

if abs(gamepad_axis_value(input_number,gp_axisrh)) > 0.1 or abs(gamepad_axis_value(input_number,gp_axisrv)) > 0.1{
aim_x = ((gamepad_axis_value(input_number,gp_axisrh)*10) div 1)
aim_y = ((gamepad_axis_value(input_number,gp_axisrv)*10) div 1)}

stick_aim_x = gamepad_axis_value(input_number,gp_axisrh)
stick_aim_y = gamepad_axis_value(input_number,gp_axisrv)

aim_direction = point_direction(0, 0, aim_x,aim_y)
//aim_direction = point_direction(x, y, mouse_x,mouse_y)

if hsp_knockback != 0{hsp_knockback *=0.9};if hsp_knockback < 0.1 && hsp_knockback > -0.1{hsp_knockback = 0}
if vsp_knockback != 0{vsp_knockback *=0.9};if vsp_knockback < 0.1 && vsp_knockback > -0.1{vsp_knockback = 0}


var_move = clamp(mov_spd-clamp(weapon_weight-strength,0,100),0,100)
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

if shoot_timer > 0{shoot_timer -= 1}
if recoil_cooldown > 0 && shoot_timer = 0{recoil_cooldown -= 1}
if reload_timer > 0{reload_timer -= 1
if reload_timer = 0{
var_reload = ammo_inmag_max-ammo_inmag
if var_reload > ammo_reserve{var_reload = ammo_reserve}
ammo_inmag += var_reload
ammo_reserve -= var_reload
}}


recoil = 0
if ammo_inmag = 0 && ammo_reserve > 0 && reload_timer = 0 or key_reload && ammo_reserve > 0 && ammo_inmag < ammo_inmag_max && reload_timer = 0
{reload_timer = reload_time}

if shoot_timer <= 0 && ammo_inmag > 0 && reload_timer = 0{
if key_shoot && auto = true or key_shoot_pressed && auto = false{
shoot_timer = shoot_delay
ammo_inmag -= 1
direction = aim_direction
speed = 1
var_x = x+(hspeed*5)
var_y = y+(vspeed*5)
speed = 0
repeat(bullet_amount){
_bullet = instance_create_depth(var_x,var_y,depth+1,Bullet)
recoil = random_range(-recoil_cooldown,recoil_cooldown)
if recoil_cooldown > 0{_bullet.image_angle = aim_direction+recoil+random_range(-bullet_spread,bullet_spread)}
else{_bullet.image_angle = aim_direction+bullet_spread}
recoil_cooldown = base_recoil*2
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
}
}

if place_meeting(x,y,Enemy) && hit_stun = 0{hp -= 1;hit_stun = 30;blood_splatter()}
if hit_stun > 0{hit_stun -= 1}

if aim_direction  > 45 or aim_direction  < 135{aim_string = "U"}
if aim_direction  >= 135 && aim_direction  <= 225{aim_string = "L"}
if aim_direction  > 225 && aim_direction  < 315{aim_string = "D"}
if aim_direction  >= 315 or aim_direction  <= 45{aim_string = "R"}

sprite_string = "s_"+string(player_name)+string(aim_string)
sprite_index = asset_get_index(sprite_string)

if aim_object != 0{
aim_object.x = x;aim_object.y = y;aim_object.image_angle = aim_direction}
sprite_set_bbox(sprite_index,(sprite_width/2)-20,(sprite_height/2)-20,(sprite_width/2)+20,sprite_height)

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



#region Buyable Stuff
image_xscale = 1.2
image_yscale = 1.2
if place_meeting(x,y,MysteryBox){
var_object = instance_nearest(x,y,MysteryBox)
var_object.display_text = true
if key_interact && money >= 950 && var_object.box_open = false{
money -= 950
var_object.activate_box = true
}

if key_interact && var_object.box_open = true && var_object.box_timer = 0{
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

image_xscale = 1;image_yscale = 1
#endregion End Of Buyable Stuff