function script_execute_item(arg_item_sprite){
var_string = string_delete(sprite_get_name(arg_item_sprite),1,7)
script_execute(asset_get_index("item_"+string(var_string)))
}

function reference_items(){
item_Heart()
item_SuperMushroom()
item_Move()
item_WeaponSlots()
item_DoubleTap()
item_SpeedCola()
item_BloodBullets()
item_MLGNoScoper()
item_DamageUp()
item_ShotGunner()
item_PoundOfFeathers()
item_WeightedBelt()
item_HandgunHavoc()
item_NoobiniPizzanini()
item_TeddyBear()
item_AmmoCase()
item_Wallnut()
item_MetalDetector()
item_CryptoCoin()
item_ChoccyMilk()
item_PNGExplosion()
}

function item_Heart(){
item_name = "HP Max Up"
cost = 500
description = "Heals 1 HP"
if object_index = Player && new_item != -1{
hp += 1;if hp > hp_max{hp = hp_max}
}
}

function item_SuperMushroom(){
item_sprite = s_item_SuperMushroom
item_name = "SuperMushroom"
cost = 500
description = "Max HP +1 and Heals 1 HP"
if object_index = GM{
array_push(item_list,item_sprite)
exit}
if object_index = Player && new_item != -1{
hp_max += 1;hp += 1
}
}

function item_Move(){
item_sprite = s_item_Move
item_name = "Move Up"
cost = 400
description = "Increases move spd by a bit"
if object_index = GM{
array_push(item_list,item_sprite)
exit}
if object_index = Player && new_item != -1{
mov_spd += 1
}
}

function item_WeaponSlots(){
item_sprite = s_item_WeaponSlots
item_name = "Weapon Slots Up"
cost = 4000
description = "Carry an extra gun"
if object_index = GM{
array_push(item_list,item_sprite)
exit}
if object_index = Player && new_item != -1{
weapon_slots += 1
}
}

function item_DoubleTap(){
item_sprite = s_item_DoubleTap
item_name = "Double tap"
cost = 2000
description = "Weapons shoot one more bullet at a time"
if object_index = GM{
array_push(item_list,item_sprite)
exit}
if object_index = Player && new_item != -1{
shoot_amount_increase += 1
}
}

function item_SpeedCola(){
item_sprite = s_item_SpeedCola
item_name = "Speed Cola"
cost = 3000
description = "Increased players reload speed"
if object_index = GM{
array_push(item_list,item_sprite)
exit}
if object_index = Player && new_item != -1{
reload_speed += 1
}
}

function item_ShotGunner(){
item_sprite = s_item_ShotGunner
item_name = "Shot Gunner"
cost = 2500
description = "Shotguns bullets shoot more pellets but have a larger spread"
if object_index = GM{
array_push(item_list,item_sprite)
exit}
if object_index = Player && new_item != -1{
shotgun_bullet_mult += 0.5
shotgun_spread_mult += 0.5
}
}

function item_DamageUp(){
item_sprite = s_item_DamageUp
item_name = "Damage Up"
cost = 1200
description = "All weapons do 10% more damage"
if object_index = Player && new_item != -1{
damage_mult += 0.1
}
}

function item_BloodBullets(){
item_sprite = s_item_BloodBullets
item_name = "Blood Bullets"
cost = 1200
description = "Get some extra ammo when hurt"
if object_index = GM{
array_push(item_list,item_sprite)
exit}
if object_index = Player && new_item != -1{
ammo_recived_when_hurt += 0.2
}
}

function item_MLGNoScoper(){
item_sprite = s_item_MLGNoScoper
item_name = "MLG No Scoper"
cost = 2000
description = "Increases Sniper damage by 42.0% but decreases sniper accuracy"
if object_index = GM{
array_push(item_list,item_sprite)
exit}
if object_index = Player && new_item != -1{
sniper_damage_mult += 0.42
sniper_spread_increase += 15
}
}

function item_PoundOfFeathers(){
item_sprite = s_item_PoundOfFeathers
item_name = "Pound Of Feathers"
cost = 1400
description = "Increases move_spd by alot but increases gun knockback by 100%"
if object_index = GM{
array_push(item_list,item_sprite)
exit}
if object_index = Player && new_item != -1{
mov_spd += 3
knockback_mult += 1
}
}

function item_WeightedBelt(){
item_sprite = s_item_WeightedBelt
item_name = "Weighted Belt"
cost = 900
description = "Decrease gun knockback by 75% but decrease mov_spd"
if object_index = GM{
array_push(item_list,item_sprite)
exit}
if object_index = Player && new_item != -1{
mov_spd -= 1
knockback_mult -= 0.75
}
}

function item_HandgunHavoc(){
item_sprite = s_item_HandgunHavoc
item_name = "Hand Gun Havoc"
cost = 2200
description = "Increaes the damgage, recoil, and knockback of all handguns by 100%"
if object_index = GM{
array_push(item_list,item_sprite)
exit}
if object_index = Player && new_item != -1{
handgun_damage_mult += 1
handgun_recoil_mult += 1
handgun_knockback_mult += 1
}
}

//noobini pizzanini
function item_NoobiniPizzanini(){
item_sprite = s_item_NoobiniPizzanini
item_name = "Noobini Pizzanini"
cost = 500
description = "Earn an extra $1 per bullet hit enemy"
if object_index = GM{
array_push(item_list,item_sprite)
exit}
if object_index = Player && new_item != -1{
shot_reward_increase += 1
}
}

function item_TeddyBear(){
item_sprite = s_item_TeddyBear
item_name = "Teddy Bear"
cost = 1500
description = "Once per floor, get your money back after using the mystery box"
if object_index = GM{
array_push(item_list,item_sprite)
exit}
if object_index = Player && new_item != -1{
free_mystery_box_rolls_per_floor += 1
}
}

function item_AmmoCase(){
item_sprite = s_item_AmmoCase
item_name = "Ammo Case"
cost = 2100
description = "All wall guns come with an extra 50% reserve ammo upon purchase"
if object_index = GM{
array_push(item_list,item_sprite)
exit}
if object_index = Player && new_item != -1{
wall_ammo_multiplier += 0.5
}
}

function item_Wallnut(){
item_sprite = s_item_Wallnut
item_name = "Wallnut"
cost = 1600
description = "Max HP +3"
if object_index = GM{
array_push(item_list,item_sprite)
exit}
if object_index = Player && new_item != -1{
hp_max += 3
}
}

function item_MetalDetector(){
item_sprite = s_item_MetalDetector
item_name = "Metal Detector"
cost = 1200
description = "Find 1 bullet when entering a new room. Doesn't apply to energy based ammo"
if object_index = GM{
array_push(item_list,item_sprite)
exit}
if object_index = Player && new_item != -1{
bullets_per_new_room += 1
}
}

function item_CryptoCoin(){
item_sprite = s_item_CryptoCoin
item_name = "Crypto Coin"
cost = 1000
description = "Gain or lose $1-$10000 at the start of every floor"
if object_index = GM{
array_push(item_list,item_sprite)
exit}
if object_index = Player && new_item != -1{
cryptocoin += 1
}
}

function item_ChoccyMilk(){
item_sprite = s_item_ChoccyMilk
item_name = "Choccy Milk"
cost = 1500
description = "+1 speed, +10% reload speed, and +2 hp"
if object_index = GM{
array_push(item_list,item_sprite)
exit}
if object_index = Player && new_item != -1{
mov_spd += 1
reload_speed += 0.1
hp += 2;if hp > hp_max{hp = hp_max}
}
}

function item_PNGExplosion(){
item_sprite = s_item_PNGExplosion
item_name = "png explosion gif"
cost = 2000
description = "1 in 4 chance to cause png explosion gifs when killing enemies, dealing additional explosion damage"
if object_index = GM{
array_push(item_list,item_sprite)
exit}
if object_index = Player && new_item != -1{
png_explosions += 1
}
}