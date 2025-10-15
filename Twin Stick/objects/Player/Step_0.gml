depth = -y
if keyboard_check_pressed(ord("R")) or hp <= 0{game_restart()}

key_left = keyboard_check(vk_left) or keyboard_check(ord("A"))
//key_left_pressed = keyboard_check_pressed(vk_left) or keyboard_check_pressed(ord("A"))
key_right = keyboard_check(vk_right) or keyboard_check(ord("D"))
//key_right_pressed = keyboard_check_pressed(vk_right) or keyboard_check_pressed(ord("D"))
key_up = keyboard_check(vk_up) or keyboard_check(ord("W"))
//key_up_pressed = keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W"))
key_down = keyboard_check(vk_down) or keyboard_check(ord("S"))
//key_down_pressed = keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S"))
key_shoot = mouse_check_button(mb_left) or gamepad_button_check(player_number,gp_shoulderrb)
key_shoot_pressed = mouse_check_button_pressed(mb_left) or gamepad_button_check_pressed(player_number,gp_shoulderrb)

key_weapon_toggle_back = gamepad_button_check_pressed(player_number,gp_shoulderl) or mouse_wheel_up()
key_weapon_toggle_forward = gamepad_button_check_pressed(player_number,gp_shoulderr) or mouse_wheel_down()

if key_weapon_toggle_back{weapon_number -= 1;if weapon_number < 0{weapon_number = array_length(weapon_list)-1}}
if key_weapon_toggle_forward{weapon_number += 1;if weapon_number = array_length(weapon_list){weapon_number = 0}}



if abs(gamepad_axis_value(player_number,gp_axisrh)) > 0.1 or abs(gamepad_axis_value(player_number,gp_axisrv)) > 0.1{
aim_x = ((gamepad_axis_value(player_number,gp_axisrh)*10) div 1)
aim_y = ((gamepad_axis_value(player_number,gp_axisrv)*10) div 1)}

stick_aim_x = gamepad_axis_value(player_number,gp_axisrh)
stick_aim_y = gamepad_axis_value(player_number,gp_axisrv)

aim_direction = point_direction(0, 0, aim_x,aim_y)
//aim_direction = point_direction(x, y, mouse_x,mouse_y)




if hsp_knockback != 0{hsp_knockback *=0.9};if hsp_knockback < 0.1 && hsp_knockback > -0.1{hsp_knockback = 0}
if vsp_knockback != 0{vsp_knockback *=0.9};if vsp_knockback < 0.1 && vsp_knockback > -0.1{vsp_knockback = 0}

hsp = (key_right-key_left)*mov_spd
if abs(gamepad_axis_value(player_number,gp_axislh)) > 0.2{hsp = gamepad_axis_value(player_number,gp_axislh)*mov_spd}
hsp += hsp_knockback
vsp = (key_down-key_up)*mov_spd
if abs(gamepad_axis_value(player_number,gp_axislv)) > 0.2{vsp = gamepad_axis_value(player_number,gp_axislv)*mov_spd}
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

if shoot_timer > 0{shoot_timer -= 1}
if recoil_cooldown > 0{recoil_cooldown -= 1}

recoil = 0
if shoot_timer <= 0 && ammo > 0{
if key_shoot && auto = true or key_shoot_pressed && auto = false{
shoot_timer = shoot_delay
_bullet = instance_create_depth(x,y,depth+1,Bullet)
//ammo -= 1
recoil = random_range(-base_recoil,base_recoil)
if recoil_cooldown > 0{_bullet.image_angle = aim_direction+recoil}
else{_bullet.image_angle = aim_direction}
recoil_cooldown = base_recoil*2
_bullet.damage = weapon_damage
_bullet.penetration = penetration
_bullet.bullet_speed = bullet_speed
_bullet.sprite_index = bullet_sprite

direction = _bullet.image_angle +180
speed = knockback
hsp_knockback = hspeed
vsp_knockback = vspeed
speed = 0
}
}

if place_meeting(x,y,Enemy) && hit_stun = 0{hp -= 1;hit_stun = 30}
if hit_stun > 0{hit_stun -= 1}

if player_number = 0{
if aim_direction  > 45 or aim_direction  < 135{sprite_index = s_HazelU}
if aim_direction  > 135 && aim_direction  < 225{sprite_index = s_HazelL}
if aim_direction  > 225 && aim_direction  < 315{sprite_index = s_HazelD}
if aim_direction  > 315 or aim_direction  < 45{sprite_index = s_HazelR}}

if player_number = 1{
if aim_direction  > 45 or aim_direction  < 135{sprite_index = s_JuneU}
if aim_direction  > 135 && aim_direction  < 225{sprite_index = s_JuneL}
if aim_direction  > 225 && aim_direction  < 315{sprite_index = s_JuneD}
if aim_direction  > 315 or aim_direction  < 45{sprite_index = s_JuneR}}

if aim_object != 0{
aim_object.x = x;aim_object.y = y;aim_object.image_angle = aim_direction}