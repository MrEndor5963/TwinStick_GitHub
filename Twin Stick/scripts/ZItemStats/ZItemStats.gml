function script_execute_item(arg_item_sprite){
consumable = false
var_string = string_delete(sprite_get_name(arg_item_sprite),1,7)
script_execute(asset_get_index("item_"+string(var_string)))
}


function reference_items(){
item_Heart()
item_AmmoRefill()

item_SuperMushroom()
item_Move()
item_WeaponSlots()
item_FastFire()
item_SpeedCola()
item_BloodBullets()
item_MLGNoScoper()
item_DamageUp()
item_ShotGunner()
//item_PoundOfFeathers()
//item_WeightedBelt()
item_HandgunHavoc()
item_NoobiniPizzanini()
item_TeddyBear()
item_AmmoCase()
item_Wallnut()
item_MetalDetector()
item_CryptoCoin()
item_ChoccyMilk()
item_PNGExplosion()
item_DinoChickenNuggies()
item_CoolLookingS()
item_CowboyHat()
item_RageSpell()
item_HammerAndSickle()
item_DozenEggs()
item_PetTurtle()
item_LoanFish()
}

function item_Heart(){
item_name = "Medkit"
cost = 500
description = "Heals all HP"
if GM.player_amount > 1{description = "Heals HP of all players"}
consumable = true
if object_index = Player && new_item != -1{
i = 0
repeat(GM.player_amount){
with GM.player_list[i]{hp = hp_max}

i += 1}
}
}

function item_AmmoRefill(){
item_name = "Ammo Refill"
cost = 500
description = "Refills ammo reserve"
rebuyable = true
consumable = true
if object_index = Player && new_item != -1{
ammo_reserve = ammo_reserve_max
}
}

function item_SuperMushroom(){
item_sprite = s_item_SuperMushroom
item_name = "Super Mushroom"
cost = 500
description = "Max HP +1 and Heals 1 HP"
if object_index = GM{
array_push(item_list,item_sprite)
exit}
if object_index = Player && new_item != -1{
hp_max += 1;hp += 1
}
}

function item_WeaponSlots(){
item_sprite = s_item_WeaponSlots
item_name = "Weapon Slots Up"
cost = 5000
description = "Carry an extra gun"
if object_index = GM{
array_push(item_list,item_sprite)
exit}
if object_index = Player && new_item != -1{
weapon_slots += 1
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

function item_FastFire(){
item_sprite = s_item_FastFire
item_name = "Fast fire"
cost = 2000
description = "Increases the fire rate of all smg's"
if object_index = GM{
array_push(item_list,item_sprite)
exit}
if object_index = Player && new_item != -1{
smg_shot_delay_decrease += 2
}
}

function item_SpeedCola(){
item_sprite = s_item_SpeedCola
item_name = "Speed Soda"
cost = 3000
description = "Increased reload speed on all guns by 100%"
if object_index = GM{
array_push(item_list,item_sprite)
exit}
if object_index = Player && new_item != -1{
player_reload_mult += 1
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
player_damage_mult += 0.1
}
}

function item_BloodBullets(){
item_sprite = s_item_BloodBullets
item_name = "Blood Bullets"
cost = 1200
description = "Refill 20% of your max ammo reserve when getting hurt"
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
sniper_spread_increase += 25
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
cost = 500
description = "Max HP +2"
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
cost = 1400
description = "+1 speed, +10% reload speed, and +2 hp"
if object_index = GM{
array_push(item_list,item_sprite)
exit}
if object_index = Player && new_item != -1{
mov_spd += 1
player_reload_mult += 0.1
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

function item_DinoChickenNuggies(){
item_sprite = s_item_DinoChickenNuggies
item_name = "Dino Chicken Nuggies"
cost = 1000
description = "+5% damage, +5% move speed, +5% reload speed"
if object_index = GM{
array_push(item_list,item_sprite)
exit}
if object_index = Player && new_item != -1{
damage_mult += 0.05;mov_mult += 0.05;player_reload_mult += 0.05
}
}

function item_CoolLookingS(){
item_sprite = s_item_CoolLookingS
item_name = "Cool Looking S"
cost = 1900
description = "Guns with names that start with S get -19% recoil, -19% knockback, -19% weight, +19% max reserve ammo, and +19% reload speed"
if object_index = GM{
array_push(item_list,item_sprite)
exit}
if object_index = Player && new_item != -1{
cool_s_mult += 0.19
}
}

function item_CowboyHat(){
item_sprite = s_item_CowboyHat
item_name = "Cowboy Hat"
cost = 1800
description = "All revolvers draw and shoot twice as fast and get +100% reload speed"
if object_index = GM{
array_push(item_list,item_sprite)
exit}
if object_index = Player && new_item != -1{
revolver_deploy_time_divider *= 2;revolver_hammer_time_divider *= 2
;revolver_reload_mult += 1
}
}

function item_RageSpell(){
item_sprite = s_item_RageSpell
item_name = "Rage Spell"
cost = 850
description = "Move at 2x speed for 4.5 seconds after entering a new room"
if object_index = GM{
array_push(item_list,item_sprite)
exit}
if object_index = Player && new_item != -1{
rage_spell_time += 270
}
}

function item_HammerAndSickle(){
item_sprite = s_item_HammerAndSickle
item_name = "Hammer & Sickle"
cost = 1922
description = "All Soviet invented weaponry gets +50% max reserve ammo and a full ammo refill at the start of each floor but give no shot or kill reward"
if object_index = GM{
array_push(item_list,item_sprite)
exit}
if object_index = Player && new_item != -1{
soviet_ammo_mult += 0.50
}
}

function item_DozenEggs(){
item_sprite = s_item_DozenEggs
item_name = "A dozen eggs"
cost = 1200
description = "All guns with 12 in their name get +12 max reserve ammo"
if object_index = GM{
array_push(item_list,item_sprite)
exit}
if object_index = Player && new_item != -1{
twelve_bonus_ammo += 12
}
}

function item_PetTurtle(){
item_sprite = s_item_PetTurtle
item_name = "Pet Tortoise"
cost = 1600
description = "+4 HP and Max HP but -60% move speed while enemies are in the room"
if object_index = GM{
array_push(item_list,item_sprite)
exit}
if object_index = Player && new_item != -1{
hp += 4;hp_max += 4;turtle_mov_mult += 0.5
}
}

function item_LoanFish(){
item_sprite = s_item_LoanFish
item_name = "Loan Fish"
cost = 2500
description = "Go an extra -15000$ in debt but for every 50 seconds in debt, lose 1 or more HP (HP loss multiplies by 2 every additional 50 seconds in debt)"
if object_index = GM{
array_push(item_list,item_sprite)
exit}
if object_index = Player && new_item != -1{
debt_limit += 10000
loan_fish += 1
}
}

/*
function item_FutbolBall(){
item_sprite = s_item_FutbolBall
item_name = "Fútbol Ball"
cost = 2000

description = "Spawns a Fútbol Ball you can kick to damage enemies, with power depending on how good your character is at Fútbol"
Player.money += 1
if object_index = GM{
array_push(item_list,item_sprite)
exit}
if object_index = Player && new_item != -1{

}
}

/*
//I should wait until I can do something unique for this one
function item_CursedIdol(){
item_sprite = s_item_CursedIdol
item_name = "Cursed Idol"
cost = 5000
description = "+25000$ but tougher enemies become more common"
if object_index = GM{
array_push(item_list,item_sprite)
exit}
if object_index = Player && new_item != -1{
hp += 4;hp_max += 4;turtle_mov_mult += 0.5
}
}*/
