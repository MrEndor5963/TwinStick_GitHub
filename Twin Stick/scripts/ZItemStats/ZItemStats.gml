function script_execute_item(arg_item_sprite){
var_string = string_delete(sprite_get_name(arg_item_sprite),1,5)
script_execute(asset_get_index("item_"+string(var_string)))
}

function reference_items(){reference_items()
item_Heart()
item_HPMax()
item_Move()
item_WeaponSlots()
item_DoubleTap()
item_SpeedCola()
item_BloodBullets()
item_MLGNoScoper()
item_DamageUp()
item_ShotGunner()
}

function item_Heart(){
item_name = "HP Max Up"
cost = 500
description_text = "Heals 1 HP"
if object_index = Player && new_item != -1{
hp += 1;if hp > hp_max{hp = hp_max}
}
}

function item_HPMax(){
item_name = "HP Max Up"
cost = 1000
description_text = "Max HP +1 and Heals 1 HP"
if object_index = Player && new_item != -1{
hp_max += 1;hp += 1
}
}

function item_Move(){
item_name = "Move Up"
cost = 400
description_text = "Increases move spd by a bit"
if object_index = Player && new_item != -1{
mov_spd += 1
}
}

function item_WeaponSlots(){
item_name = "Weapon Slots Up"
cost = 4000
description_text = "Carry an extra gun"
if object_index = Player && new_item != -1{
weapon_slots += 1
}
}

function item_DoubleTap(){
item_name = "Double tap"
cost = 2000
description_text = "Weapons shoot one more bullet at a time"
if object_index = Player && new_item != -1{
shoot_amount += 1
}
}

function item_SpeedCola(){
item_name = "Speed Cola"
cost = 3000
description_text = "Increased players reload speed"
if object_index = Player && new_item != -1{
reload_speed += 1
}
}

function item_ShotGunner(){
item_name = "Shot Gunner"
cost = 1000
description_text = "Shotguns bullets shoot more pellets but have a larger spread"
if object_index = Player && new_item != -1{
shotgun_bullet_mult += 0.5
shotgun_spread_mult += 0.5
}
}

function item_DamageUp(){
item_name = "Damage Up"
cost = 1200
description_text = "All weapons do 10% more damage"
if object_index = Player && new_item != -1{
damage_mult += 0.1
}
}

function item_BloodBullets(){
item_name = "Blood Bullets"
cost = 1000
description_text = "Get some extra ammo when hurt"
if object_index = Player && new_item != -1{
ammo_recived_when_hurt += 0.1
}
}

function item_MLGNoScoper(){
item_name = "MLG No Scoper"
cost = 1400
description_text = "Increases Sniper damage by 42.0% but decreases sniper accuracy"
if object_index = Player && new_item != -1{
sniper_damage_mult += 0.69
sniper_spread_increaser += 15
}
}

function item_PoundOfFeathers(){
item_name = "Pound Of Feathers"
cost = 1400
description_text = "Increases move_spd by alot but increases gun knockback by 100%"
if object_index = Player && new_item != -1{
mov_spd += 4
knockback_mult += 1
}
}

function item_WeightedBelt(){
item_name = "Weighted Belt"
cost = 900
description_text = "Decrease gun knockback by 75% but decrease mov_spd"
if object_index = Player && new_item != -1{
mov_spd -= 2
knockback_mult -= 0.75
}
}

function item_HandgunHavoc(){
item_name = "Hand Gun Havoc"
cost = 2200
description_text = "Increaes the damgage, recoil, and knockback of all handguns by 100%"
if object_index = Player && new_item != -1{
handgun_damage_mult += 1
handgun_recoil_mult += 1
handgun_knockback_mult += 1
}
}