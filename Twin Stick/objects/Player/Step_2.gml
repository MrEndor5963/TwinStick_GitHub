camera_box = instance_place(x,y,CameraBox)
if camera_box != noone{
GM.clamp_x1 = camera_box.clamp_x1;
GM.clamp_x2 = camera_box.clamp_x2
GM.clamp_y1 = camera_box.clamp_y1
GM.clamp_y2 = camera_box.clamp_y2
}

//Buyable Stuff
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
weapon_slot[weapon_number] = var_object.weapon_sprite
script_execute_wpn(weapon_slot[weapon_number])
weapon_slot_ammo_inmag[weapon_number] = ammo_inmag_max
weapon_slot_ammo_reserve[weapon_number] = ammo_reserve_max
ammo_inmag = ammo_inmag_max;ammo_reserve = ammo_reserve_max
}
}

image_xscale = 1;image_yscale = 1