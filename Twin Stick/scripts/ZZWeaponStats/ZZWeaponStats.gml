//Note - lengths and weight are measured in inches and pounds/lbs

#region Weapon stat setting functions
function set_slide_distance(arg_slide_distance){
slide_sprite = asset_get_index(sprite_get_name(weapon_id)+"Slide")
slide_distance = arg_slide_distance}
	
function set_mag_sprite(arg_mag_sprite,arg_mag_xoff,arg_mag_yoff){
mag_sprite = arg_mag_sprite
mag_xoff = arg_mag_xoff
mag_yoff = arg_mag_yoff
mag_xoff = mag_xoff;mag_yoff = mag_yoff
}

function set_weapon_offset(arg_xoffset,arg_yoffset){
weapon_xoffset = arg_xoffset
weapon_yoffset = arg_yoffset
}

function set_animation(arg_animation){
if arg_animation = "Pistol Clip"{
set_mag_sprite(s_m1911Mag,9,28)
reload_time = 15
}

//if arg_animation = "Mag Bottom"{reload_time = 15}

if arg_animation = "Pump Action"{
reload_time = 30
}

if arg_animation = "Revolver"{
reload_time = 30
}

if arg_animation = "None"{
reload_time = 60
}

animation = arg_animation

//if arg_animation != "Pistol Clip" && arg_animation != "Pump Action" && arg_animation != "None"{
//throw("script read error, Reload animation not found")}
}

function set_melee_attack(arg_melee_damage,arg_melee_knockback){
melee_damage = arg_melee_damage
melee_knockback = arg_melee_knockback
}

function set_gun_ammo(arg_ammo_inmag_max,arg_ammo_reserve_max,arg_magazine_reload){
ammo_inmag_max = arg_ammo_inmag_max
ammo_reserve_max = arg_ammo_reserve_max
magazine_reload = arg_magazine_reload
}

function set_gun_handling(arg_gun_recoil,arg_gun_knockback,arg_gun_weight){
if arg_gun_recoil < 0{
gun_recoil = arg_gun_recoil*choose(-1,1)}
else{gun_recoil = arg_gun_recoil}
knockback = arg_gun_knockback
weapon_weight = arg_gun_weight}

function set_deploy_stats(arg_deploy_time,arg_deploy_direction){
deploy_time = arg_deploy_time
deploy_direction = arg_deploy_direction;deploy_direction = arg_deploy_direction
}

function set_ejection_point(arg_ejection_x,arg_ejection_y){
ejection_x = arg_ejection_x;ejection_x = ejection_x
ejection_y = arg_ejection_y;ejection_y = ejection_y
}

function set_caliber_stats(arg_damge,arg_knockback,arg_penetration,arg_weight,arg_price,arg_name){
bullet_damage = arg_damge
bullet_knockback = arg_knockback
penetration = arg_penetration
bullet_weight = arg_weight;bullet_weight = arg_weight
bullet_price = arg_price*3;
caliber_name = arg_name;caliber_name = caliber_name
///*temporary damage calculation until I get a better grip on stuff*/bullet_damage = bullet_weight*500

}

function set_bullet_power(arg_caliber,arg_barrel_length){
caliber = arg_caliber
barrel_length = arg_barrel_length
switch (caliber) {
case s_22LR: set_caliber_stats(40+(10*barrel_length),1,0.5,0.006,3,".22LR") break;
case s_32ACP: set_caliber_stats(60+(7*barrel_length),1.5,1,0.026,4,".32 ACP") break;
//9x18mm makarov is 30+8?
case s_9x19mmParabellum: set_caliber_stats(75+(8*barrel_length),2.5,1,0.028,1,"9x19mm Parabellum") break;
case s_57x28mm: set_caliber_stats(65+(12*barrel_length),1.5,1.5,0.013,3,"5.7x28mm") break;
case s_762x25mmTokarev: set_caliber_stats(75+(15*barrel_length),1.5,1.5,0.022,5,"7.62x25mm Tokarev") break;
case s_45ACP: set_caliber_stats(100+(6*barrel_length),5,1,0.05,1.2,".45 ACP") break;
case s_357Magnum: set_caliber_stats(110+(25*barrel_length),5,2.1,0.04,8.5,".357 Magnum") break;
case s_50AE: set_caliber_stats(180+(35*barrel_length),8,1.6,0.075,18,".50 AE") break;
case s_500SAWMagnum: set_caliber_stats(350+(60*barrel_length),10,3.3,0.01,38,".500 S&W Magnum") break;
case s_545x39mm: set_caliber_stats(180+(20*barrel_length),1.5,1,0.022,4,"5.45x39mm") break;
case s_556X45mmNATO: set_caliber_stats(220+(25*barrel_length),1.5,1,0.027,5.5,"5.56x45mm NATO") break;
case s_762x39mm: set_caliber_stats(300+(18*barrel_length),1.5,1,0.036,6,"7.62x39mm") break;
case s_762x51NATO: set_caliber_stats(450+(30*barrel_length),1.5,1,0.058,9.5,"7.62x51mm NATO") break;
case s_308WinchesterMagnum: set_caliber_stats(600+(40*barrel_length),2,4.5,0.07,22,".308 Winchester Magnum") break;
case s_762x54R: set_caliber_stats(500+(28*barrel_length),1.5,1,0.05,7.5,"7.62x54R") break;
case s_79257mmMauser: set_caliber_stats(550+(30*barrel_length),1.5,1,0.06,12,"7.92x57mm Mauser") break;
case s_303British: set_caliber_stats(460+(25*barrel_length),1.5,3.3,0.06,16,".303 British") break;
case s_50BMG: set_caliber_stats(1800+(70*barrel_length),1.5,9,0.26,40,".50 BMG") break;
case s_410Bore: set_caliber_stats((400/9)+(1.5*barrel_length),1.5,1,0.1,8,".410 Bore") break;
case s_12GadgeBuckshot: set_caliber_stats((450/9)+(1.5*barrel_length),1.5,1,0.1,10,"12 Gadge Buckshot") break;
case s_23mm: set_caliber_stats((1200/32)+(1.1*barrel_length),1.5,1,0.4,500,"23mm") break;
}
bullet_damage = round(bullet_damage)
}
	
#endregion Weapon stat setting functions
	
function script_execute_wpn(arg_weapon_id){
weapon_id = arg_weapon_id

set_melee_attack(30,7)
set_gun_ammo(-1,-1,true)
set_bullet_power(s_9x19mmParabellum,4)
set_gun_handling(0,0,0)
set_weapon_offset(0,0)
shoot_amount = 1
shoot_delay = 1;
set_animation("None")
set_ejection_point(-111,-111)
bullet_speed = 30;bullet_sprite = s_Bullet
bullet_amount = 1;bullet_spread = 1
//load_direction = 1
jam_chance = 0.08;jam_time = 150
trigger_delay = 0
reload_sfx = sfx_m1911Reload;shoot_sfx = sfx_m1911Shoot
hit_reward = 10;kill_reward = 100
explosive = false;explosion_damage = 0
weapon_draw_sprite = s_0;mag_sprite = s_0;slide_sprite = s_0;hammer_sprite = s_0;pump_sprite = s_0
held_angle_offset = 0
set_mag_sprite(s_0,9,28)
//asset_get_index(sprite_get_name(arg_weapon_id)+"Mag")
description = ""
var_string = string_delete(sprite_get_name(arg_weapon_id),1,2)
primary_action = "Shoot"

script_execute(asset_get_index("wpn_"+string(var_string)))

if object_index = PlayerWeapon{
	
	if mag_sprite != s_0{mag_dropped_sprite = asset_get_index(sprite_get_name(mag_sprite)+"Dropped")}
	shoot_amount = 1
	spread_increase = 0
	spread_mult = 1
	damage_mult = player_id.damage_mult
	recoil_mult = player_id.recoil_mult
	knockback_mult = 1
	bullet_mult = 1
	weight_mult = 1
	reload_speed_mult = player_id.reload_speed_mult
	if string_starts_with(weapon_name,"S") or string_starts_with(weapon_name,"s"){
	ammo_reserve_max += round(ammo_reserve_max*player_id.cool_s_mult)
	reload_speed_mult += player_id.cool_s_mult
	recoil_mult -= player_id.cool_s_mult
	knockback_mult -= player_id.cool_s_mult
	weight_mult -= player_id.cool_s_mult
	}
	//if string_digits(weapon_name) = "12" or string_digits(weapon_name) = "1216"{
	//ammo_reserve_max += twelve_bonus_ammo;}
	
	if array_contains(GM.handgun_list,weapon_id){
	damage_mult += player_id.handgun_damage_mult
	recoil_mult += player_id.handgun_recoil_mult
	knockback_mult += player_id.handgun_knockback_mult
	}
	if array_contains(GM.revolver_list,weapon_id){
	trigger_delay /= player_id.revolver_hammer_time_divider;trigger_delay = round(trigger_delay)
	deploy_time /= player_id.revolver_hammer_time_divider;deploy_time = round(deploy_time)
	reload_speed_mult += player_id.revolver_reload_speed_mult
	}
	
	if array_contains(GM.smg_list,weapon_id){
	shoot_delay -= player_id.smg_shot_delay_decrease;if shoot_delay < 1{shoot_delay = 1}
	}
	
	if array_contains(GM.shotgun_list,weapon_id){
	spread_mult += player_id.shotgun_spread_mult
	bullet_mult += player_id.shotgun_bullet_mult
	}
	if array_contains(GM.sniper_list,weapon_id){
	spread_increase += player_id.sniper_spread_increase
	damage_mult += player_id.sniper_damage_mult
	}
	
	bullet_damage = round(bullet_damage*damage_mult)
	melee_damage = round(melee_damage*damage_mult)
	knockback = knockback*knockback_mult
	gun_recoil = gun_recoil*recoil_mult
	weapon_weight = weapon_weight*weight_mult;if weapon_weight < 0{weapon_weight = 0}
	bullet_spread = (bullet_spread*spread_mult)+spread_increase
	shoot_amount += player_id.shoot_amount_increase
	hit_reward += player_id.hit_reward_additional

	reload_speed = reload_speed_mult;if reload_speed < 0.1{reload_speed = 0.1}
	if array_contains(GM.soviet_list,weapon_id) && player_id.hammer_and_sickles > 0{
	hit_reward = 0
	kill_reward = 0}
	}

}

function referece_weapons(){
//Ordered by tier -> gun class -> gun power
//Pistol, Revolvers, Machine pistol, smg, Assault rifle, LMG's, Shotguns, Sniper Rifles

//Non gun weapon ideas
//Brass knuckles
//Sickle
//Spoon
//Fork
//Wrench
//Sythe
//Sword
//Nunchucksgyghh.lll;lll
//Brick
//Fire extinguisher
//Screwdriver
//Metel pipe
//Lead pole
//Floor Tile
//Grenade
//C4
//Sticky grenade
//Baseball bat
//Machete
//Katana
//Hammer
//Broom
//Broom Handle
//Mop
//Mop Handle
//Bone Saw
//Chainsaw
//Sissors
//Scapel
//Human Bone
//Alien Bone
//Alien Claw
//Thermostat
//Glass bottle
//Broken Bottle
//Crowbar
//Piece of glass
//Baseball
//Walke talke
//Cellphone
//Telephone
//Mug
//Chair
//Potted Plant
//Potato
//Iron cuffs
//Watering can
//Monitor
//Moltov
//Incediary grenade
//Acid grenade
//Canned drinks
//Fire Axe
//Garbage can
//Chain whip
//Nunchucks
//Pen
//Laser Sword
//Laser Knife
	//Cafeteria stuff
	//Frying pan
	//Pot
	//Serving tray
//Desklamp
weapon_id = s_Unarmed;wpn_Unarmed()
weapon_id = s_Knife;wpn_Knife()
weapon_id = s_FireAxe;wpn_FireAxe()

weapon_id = s_Taurus92;wpn_Taurus92()
weapon_id = s_m1911;wpn_m1911()
weapon_id = s_P320;wpn_P320()
//Beretta 92
weapon_id = s_Glock18;wpn_Glock18()
weapon_id = s_Alien;wpn_Alien()
weapon_id = s_FiveSeven;wpn_FiveSeven()
weapon_id = s_DEagle;wpn_DEagle()
weapon_id = s_Python;wpn_Python()
weapon_id = s_RagingJudge;wpn_RagingJudge()
weapon_id = s_CZ75Auto;wpn_CZ75Auto()
weapon_id = s_SnW500;wpn_SnW500()
weapon_id = s_Luty;wpn_Luty()
weapon_id = s_VzSkorpion;wpn_VzSkorpion()
weapon_id = s_Uzi;wpn_Uzi()
weapon_id = s_mp5;wpn_mp5()
weapon_id = s_PPBison;wpn_PPBison()
weapon_id = s_MP40;wpn_MP40()
weapon_id = s_Olympia;wpn_Olympia()
weapon_id = s_Ithaca;wpn_Ithaca()
weapon_id = s_Spaz12;wpn_Spaz12()
//Tier B, Tier 3
weapon_id = s_Thompson;wpn_Thompson()
weapon_id = s_KrissVector;wpn_KrissVector()
weapon_id = s_PPSh41;wpn_PPSh41()
weapon_id = s_AK47;wpn_AK47()
weapon_id = s_Galil;wpn_Galil()
weapon_id = s_Remi870;wpn_Remi870()
weapon_id = s_Winchester1897;wpn_Winchester1897()
weapon_id = s_Karabiner98k;wpn_Karabiner98k()
weapon_id = s_MosinNagat;wpn_MosinNagat()
weapon_id = s_SSG08;wpn_SSG08()
//Tier A, Tier 4
weapon_id = s_Zip22;wpn_Zip22()
weapon_id = s_M14;wpn_M14()
weapon_id = s_AN94;wpn_AN94()
weapon_id = s_Xiuhcoatl;wpn_Xiuhcoatl()
weapon_id = s_ScarH;wpn_ScarH()
weapon_id = s_RPD;wpn_RPD()
weapon_id = s_AWP;wpn_AWP()
//Tier S, Tier 5
weapon_id = s_spectre;wpn_spectre()
weapon_id = s_M60;wpn_M60()
weapon_id = s_Lewis;wpn_Lewis()
weapon_id = s_MG42;wpn_MG42()
weapon_id = s_DSR50;wpn_DSR50()
weapon_id = s_GM6Lynx;wpn_GM6Lynx()
weapon_id = s_KS23;wpn_KS23()
weapon_id = s_AA12;wpn_AA12()
weapon_id = s_M79;wpn_M79()
weapon_id = s_RPG7;wpn_RPG7()
weapon_id = s_SquareGun;wpn_SquareGun()
//Explosive
//wpn_M79()
//wpn_RPG7()
//Other
//wpn_SquareGun()
//Note - weapons are organized by tier
}

function wpn_Unarmed(){
weapon_name = "Unarmed"
cost = 0
if object_index = GM && add_to_list = true{
//array_push(weapon_list,weapon_id)
array_push(melee_list,weapon_id)
exit}
auto = false
set_gun_ammo(0,0,false)
primary_action = "Melee"
bullet_damage = 0
penetration = 1
gun_recoil = 0
shoot_delay = 0
knockback = 0
reload_time = 0
weapon_weight = 0
}

function wpn_Knife(){
weapon_name = "Knife"
cost = 200
if object_index = GM && add_to_list = true{
array_push(weapon_list,weapon_id)
array_push(melee_list,weapon_id)
exit}
set_gun_ammo(0,0,false)
set_weapon_offset(-15,25)
set_melee_attack(150,2)
primary_action = "Melee"
auto = false
weapon_weight = 3
held_angle_offset = 70
}

function wpn_FireAxe(){
weapon_name = "Fire Axe"
cost = 200
if object_index = GM && add_to_list = true{
array_push(weapon_list,weapon_id)
array_push(melee_list,weapon_id)
exit}
set_gun_ammo(0,0,false)
set_weapon_offset(80,45)
set_melee_attack(600,2)
held_angle_offset = 0
primary_action = "Melee"
auto = false
weapon_weight = 10
held_angle_offset = 150
}

//function wpn_Beretta92(){
//weapon_name = "Beretta 92"
//cost = 950
//if object_index = GM && add_to_list = true{
//array_push(weapon_list,weapon_id)
//array_push(handgun_list,weapon_id)
//exit}
//auto = false
//set_gun_ammo(15,75)
//set_bullet_power(21,4,1)
//set_gun_handling(8,2.4,1)
//set_deploy_stats(7,-1)
//shoot_delay = 4
//reload_time = 90
//reload_sfx = sfx_m1911Reload
//shoot_sfx = sfx_m1911Shoot
//description = ""
//}

// E Tier, Tier 0
function wpn_m1911(){
set_weapon_offset(-20,13)
set_ejection_point(23,12)
weapon_draw_sprite = s_m1911Base
set_slide_distance(-8)
weapon_name = "m1911"
cost = 200
if object_index = GM && add_to_list = true{
array_push(tier_0_gun_list,weapon_id)
array_push(weapon_list,weapon_id)
array_push(wallbuy_list,weapon_id)
array_push(box_list,weapon_id)
array_push(handgun_list,weapon_id)
exit}
auto = false
set_gun_ammo(8,6,true)
set_bullet_power(s_45ACP,5)
set_gun_handling(16,2,2.4)
set_deploy_stats(8,-1)
shoot_delay = 8
action_type = s_SemiAuto
set_animation("Pistol Clip")
reload_sfx = sfx_m1911Reload
shoot_sfx = sfx_m1911Shoot
description = "Iconic, reliable, and accurate WW1 pistol still manufactured today"
}

function wpn_Taurus92(){
set_weapon_offset(-25,32)
weapon_name = "Taurus 92"
cost = 350
if object_index = GM && add_to_list = true{
array_push(tier_0_gun_list,weapon_id)
array_push(weapon_list,weapon_id)
array_push(handgun_list,weapon_id)
exit}
auto = false
set_gun_ammo(17,3,true)
set_bullet_power(s_9x19mmParabellum,4.9)
set_gun_handling(24,2.5,2.1)
set_deploy_stats(7,-1)
shoot_delay = 4
action_type = s_SemiAuto
set_animation("Pistol Clip")
reload_sfx = sfx_m1911Reload
shoot_sfx = sfx_m1911Shoot
description = "Effective sidearm based on the Berretta 92, mostly used by the Brazilian police and military"
}

function wpn_P320(){
set_weapon_offset(-2,31)
weapon_name = "P320"
cost = 320
if object_index = GM && add_to_list = true{
array_push(tier_0_gun_list,weapon_id)
array_push(weapon_list,weapon_id)
array_push(handgun_list,weapon_id)
exit}
auto = false
set_gun_ammo(17,3,true)
set_bullet_power(s_9x19mmParabellum,4.7)
set_gun_handling(20,2.5,2.1)
set_deploy_stats(7,-1)
shoot_delay = 4
action_type = s_SemiAuto
set_animation("Pistol Clip")
reload_sfx = sfx_m1911Reload
shoot_sfx = sfx_m1911Shoot
description = ""
if irandom_range(1,20000) = 1 && object_index = PlayerWeapon{
player_id.key_shoot_pressed = true
key_shoot_pressed = true}
}

function wpn_Glock18(){
set_weapon_offset(-25,18)
weapon_name = "Glock 18"
cost = 300
if object_index = GM && add_to_list = true{
array_push(tier_1_gun_list,weapon_id)
array_push(weapon_list,weapon_id)
array_push(handgun_list,weapon_id)
array_push(wallbuy_list,weapon_id)
exit}
auto = false
set_gun_ammo(19,3,true)
set_bullet_power(s_9x19mmParabellum,4.49)
set_gun_handling(22,1.5,1.3)
set_deploy_stats(6,-1)
shoot_delay = 4
action_type = s_SemiAuto
set_animation("Pistol Clip")
weapon_draw_sprite = s_Glock18Base
set_slide_distance(-8)
reload_sfx = sfx_m1911Reload
shoot_sfx = sfx_m1911Shoot
description = ""
}
	
function wpn_Alien(){
set_weapon_offset(-27,26)
weapon_name = "Alien"
cost = 7500
if object_index = GM && add_to_list = true{
array_push(tier_1_gun_list,weapon_id)
array_push(weapon_list,weapon_id)
array_push(handgun_list,weapon_id)
exit}
auto = false
set_gun_ammo(17,5,true)
set_bullet_power(s_9x19mmParabellum,4.8)
set_gun_handling(5,2.5,2.47)
set_deploy_stats(6,-1)
bullet_spread = 0
shoot_delay = 3
action_type = s_SemiAuto
set_animation("Pistol Clip")
reload_sfx = sfx_m1911Reload
shoot_sfx = sfx_m1911Shoot
description = ""
}

function wpn_FiveSeven(){
set_weapon_offset(-5,31)
weapon_name = "Five Seven"
cost = 800
if object_index = GM && add_to_list = true{
array_push(tier_2_gun_list,weapon_id)
array_push(weapon_list,weapon_id)
array_push(wallbuy_list,weapon_id)
array_push(handgun_list,weapon_id)
exit}
auto = false
set_gun_ammo(20,3,true)
set_bullet_power(s_57x28mm,4.8)
set_gun_handling(15,3,1.6)
set_deploy_stats(7,-1)
shoot_delay = 5
action_type = s_SemiAuto
set_animation("Pistol Clip")
reload_sfx = sfx_m1911Reload
shoot_sfx = sfx_m1911Shoot
description = ""
}
	
function wpn_DEagle(){
set_weapon_offset(-4,31)
weapon_name = "DEagle"
cost = 900
if object_index = GM && add_to_list = true{
array_push(tier_1_gun_list,weapon_id)
array_push(weapon_list,weapon_id)
array_push(wallbuy_list,weapon_id)
array_push(handgun_list,weapon_id)
exit}
auto = false
set_gun_ammo(7,3,true)
set_bullet_power(s_50AE,6)
set_gun_handling(85,9,4.4)
set_deploy_stats(9,-1)
shoot_delay = 5
action_type = s_SemiAuto
set_animation("Pistol Clip")
reload_sfx = sfx_DEagleReload
shoot_sfx = sfx_DEagleShoot
description = "Desert Eagle or Deagle for short, a very powerful yet heavy magnum pistol with high recoil"
}
	
function wpn_Python(){
set_weapon_offset(-15,29)
weapon_draw_sprite = s_PythonBase
hammer_sprite = s_PythonHammer
weapon_name = "Python"
cost = 1700
if object_index = GM && add_to_list = true{
array_push(tier_1_gun_list,weapon_id)
array_push(weapon_list,weapon_id)
array_push(wallbuy_list,weapon_id)
//array_push(box_list,weapon_id)
array_push(handgun_list,weapon_id)
array_push(revolver_list,weapon_id)
exit}
auto = false
set_gun_ammo(6,50,false)
set_bullet_power(s_357Magnum,6)
set_gun_handling(31,10,2.8)
set_deploy_stats(9,-1)
shoot_delay = 2
trigger_delay = 7
set_animation("Revolver")
action_type = s_DoubleAction
reload_sfx = sfx_DEagleReload
shoot_sfx = sfx_DEagleShoot
description = "Colt Python Luxery Revolver, considered by some to be one of the finest revolvers on the market with a refined balance between power, accuracy, and handling"
}

function wpn_RagingJudge(){
set_weapon_offset(-11,28)
//weapon_draw_sprite = s_PythonBase
//hammer_sprite = s_PythonHammer
weapon_name = "Raging Judge"
cost = 1000
if object_index = GM && add_to_list = true{
array_push(tier_1_gun_list,weapon_id)
array_push(weapon_list,weapon_id)
array_push(wallbuy_list,weapon_id)
//array_push(box_list,weapon_id)
array_push(handgun_list,weapon_id)
array_push(revolver_list,weapon_id)
exit}
auto = false
set_gun_ammo(6,25,false)
set_bullet_power(s_410Bore,6.5)
set_gun_handling(35,11,4.5)
set_deploy_stats(12,-1)
shoot_delay = 2
bullet_amount = 5
bullet_spread = 8
trigger_delay = 12
set_animation("Revolver")
action_type = s_DoubleAction
reload_sfx = sfx_DEagleReload
shoot_sfx = sfx_DEagleShoot
description = "shotgun revolver"
}

function wpn_SnW500(){
set_weapon_offset(-14,30)
weapon_name = "S&W500"
cost = 900
if object_index = GM && add_to_list = true{
array_push(tier_3_gun_list,weapon_id)
array_push(weapon_list,weapon_id)
array_push(wallbuy_list,weapon_id)
//array_push(box_list,weapon_id)
array_push(handgun_list,weapon_id)
array_push(revolver_list,weapon_id)
exit}
auto = false
set_gun_ammo(5,20,false)
set_bullet_power(s_500SAWMagnum,8.4)
set_gun_handling(90,40,4.8)
set_deploy_stats(12,-1)
shoot_delay = 2
trigger_delay = 20
set_animation("Revolver")
action_type = s_DoubleAction
reload_sfx = sfx_DEagleReload
shoot_sfx = sfx_DEagleShoot
description = "Immensely powerful magnum revolver that lays down tough enemies with few shots, but has quite intense recoil and knockback"
}

function wpn_Zip22(){
set_weapon_offset(-8,29)
weapon_name = "Zip 22"
cost = 22
if object_index = GM && add_to_list = true{
array_push(tier_4_gun_list,weapon_id)
array_push(weapon_list,weapon_id)
array_push(box_list,weapon_id)
array_push(handgun_list,weapon_id)
exit}
if object_index != Player{exit}
auto = false
set_gun_ammo(25,4,true)
set_bullet_power(s_22LR,4)
set_gun_handling(16,1.5,1)
set_deploy_stats(11,-1)
shoot_delay = 2
action_type = s_SemiAuto
set_animation("None")
reload_sfx = sfx_m1911Reload
shoot_sfx = sfx_m1911Shoot
bullet_spread = 4
trigger_delay = 5
jam_chance = 40
if jam_timer = 0{jam_time = irandom_range(30,122)}
description = ""
}
	
function wpn_CZ75Auto(){
set_weapon_offset(-8,30)
weapon_name = "CZ75 Auto"
cost = 400
if object_index = GM && add_to_list = true{
array_push(tier_1_gun_list,weapon_id)
array_push(weapon_list,weapon_id)
array_push(box_list,weapon_id)
array_push(handgun_list,weapon_id)
array_push(machine_pistol_list,weapon_id)
exit}
auto = true
set_gun_ammo(16,3,true)
set_bullet_power(s_9x19mmParabellum,4.7)
set_gun_handling(-18,0.8,2.4)
set_deploy_stats(7,-1)
shoot_delay = 4
action_type = s_FullAuto
set_animation("None")
reload_sfx = sfx_m1911Reload
shoot_sfx = sfx_m1911Shoot
description = ""
}
	
function wpn_Olympia(){
set_weapon_offset(53,38)
weapon_name = "Olympia 72"
cost = 2000
if object_index = GM && add_to_list = true{
array_push(tier_1_gun_list,weapon_id)
array_push(weapon_list,weapon_id)
array_push(wallbuy_list,weapon_id)
array_push(shotgun_list,weapon_id)
exit}
auto = false
set_gun_ammo(2,10,false)
set_bullet_power(s_12GadgeBuckshot,19)
set_gun_handling(14,5,9.7)
set_deploy_stats(12,-1)
shoot_delay = 1
action_type = s_DoubleBarrel
set_animation("None")
bullet_spread = 6
bullet_amount = 9
shoot_sfx = sfx_ShotGunShoot
hit_reward = 5
description = "A finely made skeet shooting double barrel shotgun. Although reloading will be frequent and it lacks firepower compared to other shotguns, it's excellent handling and accuracy makes it a favorite for some"
}
	
function wpn_Ithaca(){
set_weapon_offset(19,27)
weapon_name = "Ithaca 37"
weapon_draw_sprite = s_IthacaBase
pump_sprite = s_IthacaPump
pump_distance = 20
cost = 900
if object_index = GM && add_to_list = true{
array_push(tier_2_gun_list,weapon_id)
array_push(weapon_list,weapon_id)
array_push(wallbuy_list,weapon_id)
//array_push(box_list,weapon_id)
array_push(shotgun_list,weapon_id)
exit}
auto = true
set_gun_ammo(7,10,false)
set_bullet_power(s_12GadgeBuckshot,22)
set_gun_handling(40,18,7)
set_deploy_stats(15,-1)
shoot_delay = 11
action_type = s_PumpAction
set_animation("Pump Action")
bullet_spread = 22
bullet_amount = 9
shoot_sfx = sfx_ShotGunShoot
hit_reward = 5
}

function wpn_Spaz12(){
set_weapon_offset(12,23)
weapon_name = "Spas 12"
cost = 1200
if object_index = GM && add_to_list = true{
array_push(tier_2_gun_list,weapon_id)
array_push(weapon_list,weapon_id)
array_push(box_list,weapon_id)
array_push(shotgun_list,weapon_id)
exit}
auto = false
set_gun_ammo(8,10,false)
set_bullet_power(s_12GadgeBuckshot,15.7)
set_gun_handling(95,20,9.7)
set_deploy_stats(15,-1)
shoot_delay = 5
action_type = s_SemiAuto
set_animation("None")
reload_time = 25
bullet_spread = 20
bullet_amount = 9
shoot_sfx = sfx_ShotGunShoot
jam_chance = 3
jam_time = 130
hit_reward = 5
}

function wpn_Remi870(){
set_weapon_offset(50,6)
weapon_name = "Remi 870 Marine"
cost = 2500
pump_sprite = s_Remi870Pump;pump_distance = 20
weapon_draw_sprite = s_Remi870Base
if object_index = GM && add_to_list = true{
array_push(tier_3_gun_list,weapon_id)
array_push(weapon_list,weapon_id)
array_push(wallbuy_list,weapon_id)
array_push(box_list,weapon_id)
array_push(shotgun_list,weapon_id)
exit}
auto = false
set_gun_ammo(7,10,false)
set_bullet_power(s_12GadgeBuckshot,28)
set_gun_handling(70,20,8)
set_deploy_stats(25,1)
shoot_delay = 14
action_type = s_PumpAction
set_animation("Pump Action")
bullet_spread = 25
bullet_amount = 9
shoot_sfx = sfx_ShotGunShoot
hit_reward = 5
}

function wpn_Winchester1897(){
set_weapon_offset(50,16)
weapon_name = "1897 Trench Gun"
cost = 1150
if object_index = GM && add_to_list = true{
array_push(tier_3_gun_list,weapon_id)
array_push(weapon_list,weapon_id)
array_push(wallbuy_list,weapon_id)
array_push(box_list,weapon_id)
array_push(shotgun_list,weapon_id)
exit}
auto = true
set_gun_ammo(6,10,false)
set_bullet_power(s_12GadgeBuckshot,30)
set_gun_handling(25,42,8.4)
set_deploy_stats(14,-1)
shoot_delay = 35
action_type = s_PumpAction
set_animation("Pump Action")
bullet_spread = 30
bullet_amount = 9
shoot_sfx = sfx_ShotGunShoot
hit_reward = 5
description = "What used to be a missionary of firearms design is now an antique overshadowed by more modern shotguns. However should the trench gun need to come out of retirement it can get the job done, though it may be uncomfortable to shoot."
}
	
function wpn_KS23(){
set_weapon_offset(54,22)
weapon_name = "KS23"
cost = 2300
pump_sprite = s_KS23Pump;pump_distance = 30
weapon_draw_sprite = s_KS23Base
if object_index = GM && add_to_list = true{
array_push(tier_5_gun_list,weapon_id)
array_push(weapon_list,weapon_id)
array_push(wallbuy_list,weapon_id)
array_push(box_list,weapon_id)
array_push(shotgun_list,weapon_id)
array_push(soviet_list,weapon_id)
exit}
auto = false
set_gun_ammo(4,12,false)
set_bullet_power(s_23mm,15.7)
set_gun_handling(25,36,8.5)
set_deploy_stats(14,-1)
shoot_delay = 45
action_type = s_PumpAction
set_animation("Pump Action")
reload_time = 55
bullet_spread = 30
bullet_amount = 40
shoot_sfx = sfx_ShotGunShoot
hit_reward = 4
description = "4 gadge shotgun made out of old aircrafts and whatever spare parts the soviets had laying around"
}

function wpn_AA12(){
set_weapon_offset(39,19)
weapon_name = "AA12"
cost = 3120
if object_index = GM && add_to_list = true{
array_push(tier_5_gun_list,weapon_id)
array_push(weapon_list,weapon_id)
array_push(box_list,weapon_id)
array_push(shotgun_list,weapon_id)
exit}
auto = true
set_gun_ammo(20,1,true)
set_bullet_power(s_12GadgeBuckshot,18.5)
set_gun_handling(15,5,11.5)
set_deploy_stats(12,-1)
shoot_delay = 12
action_type = s_FullAuto
set_animation("None")
bullet_spread = 20
bullet_amount = 9
shoot_sfx = sfx_ShotGunShoot
hit_reward = 5
}

function wpn_MP40(){
set_weapon_offset(10,29)
weapon_name = "MP40"
cost = 1440
if object_index = GM && add_to_list = true{
array_push(tier_1_gun_list,weapon_id)
array_push(weapon_list,weapon_id)
array_push(wallbuy_list,weapon_id)
array_push(box_list,weapon_id)
array_push(smg_list,weapon_id)
array_push(nazi_list,weapon_id)
exit}
auto = true
set_gun_ammo(32,4,true)
set_bullet_power(s_9x19mmParabellum,12)
set_gun_handling(-5,3,8.9)
set_deploy_stats(11,1)
shoot_delay = 7
action_type = s_FullAuto
set_animation("None")
bullet_spread = 3
shoot_sfx = sfx_m1911Shoot
description = "Homemade firearm made by Phillip A. Luty in response to UK anti gun legislation in the 1990's. Although the Luty has many, many flaws, it's still a quite cheaply made lethal weapon using only parts from a hardware store"
}

function wpn_Luty(){
set_weapon_offset(-1,29)
weapon_name = "Luty"
cost = 80
if object_index = GM && add_to_list = true{
array_push(tier_2_gun_list,weapon_id)
array_push(weapon_list,weapon_id)
array_push(wallbuy_list,weapon_id)
array_push(box_list,weapon_id)
array_push(smg_list,weapon_id)
exit}
auto = true
set_gun_ammo(18,7,true)
set_bullet_power(s_9x19mmParabellum,12)
set_gun_handling(-25,1,6.6)
set_deploy_stats(11,1)
shoot_delay = 4
action_type = s_FullAuto
set_animation("None")
bullet_spread = 12
trigger_delay = 15
jam_chance = 2
jam_time = 160
shoot_sfx = sfx_m1911Shoot
description = "Homemade firearm made by Phillip A. Luty in response to UK anti gun legislation in the 1990's. Although the Luty has many, many flaws, it's still a quite cheaply made lethal weapon using only parts from a hardware store"
}

function wpn_VzSkorpion(){
set_weapon_offset(-12,16)
weapon_name = "Vz Škorpion"
cost = 700
if object_index = GM && add_to_list = true{
array_push(tier_2_gun_list,weapon_id)
array_push(weapon_list,weapon_id)
//array_push(box_list,weapon_id)
array_push(smg_list,weapon_id)
exit}
auto = true
set_gun_ammo(20,5,true)
set_bullet_power(s_32ACP,5.9)
set_gun_handling(-3,1.5,2.9)
set_deploy_stats(8,-1)
shoot_delay = 3
action_type = s_FullAuto
set_animation("Pistol Clip")
set_mag_sprite(s_VzSkorpionMag,40,34)
shoot_sfx = sfx_mp5Shoot
description = "Compact and light SMG with great handling"
weapon_draw_sprite = s_VzSkorpionBase
mag_sprite = s_VzSkorpionMag

}

function wpn_Uzi(){
set_weapon_offset(9,28)
weapon_name = "Uzi"
cost = 800
if object_index = GM && add_to_list = true{
array_push(tier_2_gun_list,weapon_id)
array_push(weapon_list,weapon_id)
array_push(wallbuy_list,weapon_id)
array_push(smg_list,weapon_id)
exit}
auto = true
set_gun_ammo(25,4,true)
set_bullet_power(s_9x19mmParabellum,10.5)
set_gun_handling(-12,3,7.7)
set_deploy_stats(11,-1)
shoot_delay = 6
action_type = s_FullAuto
set_animation("None")
shoot_sfx = sfx_mp5Shoot
description = ""
}

function wpn_PPBison(){
set_weapon_offset(45,26)
weapon_name = "PP Bison"
cost = 2350
if object_index = GM && add_to_list = true{
array_push(tier_2_gun_list,weapon_id)
array_push(weapon_list,weapon_id)
array_push(box_list,weapon_id)
array_push(smg_list,weapon_id)
exit}
auto = true
set_gun_ammo(64,1,true)
set_bullet_power(s_9x19mmParabellum,6.7)
set_gun_handling(-5,2,4.6)
set_deploy_stats(14,-1)
shoot_delay = 5
action_type = s_FullAuto
set_animation("Pistol Clip")
reload_time += 5
weapon_draw_sprite = s_PPBisonBase
mag_sprite = s_PPBisonMag
shoot_sfx = sfx_mp5Shoot
description = "Light SMG with a spiral magazine allowing for a weapon with good handling and lots of bullets"
}
	
function wpn_mp5(){
set_weapon_offset(21,13)
weapon_name = "mp5"
cost = 2000
if object_index = GM && add_to_list = true{
array_push(tier_2_gun_list,weapon_id)
array_push(weapon_list,weapon_id)
array_push(wallbuy_list,weapon_id)
array_push(smg_list,weapon_id)
exit}
auto = true
set_gun_ammo(30,3,true)
set_bullet_power(s_9x19mmParabellum,8.9)
set_gun_handling(-3,2,5.5)
set_deploy_stats(12,-1)
shoot_delay = 5
action_type = s_FullAuto
set_animation("Pistol Clip")
shoot_sfx = sfx_mp5Shoot
weapon_draw_sprite = s_mp5Base
mag_sprite = s_mp5Mag
}
	
function wpn_Thompson(){
set_weapon_offset(35,26)
weapon_name = "Thompson"
cost = 3400
if object_index = GM && add_to_list = true{
array_push(tier_3_gun_list,weapon_id)
array_push(weapon_list,weapon_id)
array_push(box_list,weapon_id)
array_push(smg_list,weapon_id)
exit}
auto = true
set_gun_ammo(100,1,true)
set_bullet_power(s_45ACP,12)
set_gun_handling(-6,3,10.8)
set_deploy_stats(20,1)
shoot_delay = 4
action_type = s_FullAuto
set_animation("None")
bullet_spread = 3
shoot_sfx = sfx_mp5Shoot
description = "Oldschool gangster gun with a drum mag. Weighes a lot, and is hard to shoot straight, but lights up enemies like Christmas trees"
}

function wpn_KrissVector(){
set_weapon_offset(35,26)
weapon_name = "Vector 45"
cost = 4800
if object_index = GM && add_to_list = true{
//array_push(tier_3_gun_list,weapon_id)
//array_push(weapon_list,weapon_id)
//array_push(box_list,weapon_id)
//array_push(smg_list,weapon_id)
exit}
auto = true
set_gun_ammo(40,3,true)
//set_bullet_power(18,2,1)
set_gun_handling(-5,3,6)
set_deploy_stats(18,-1)
shoot_delay = 2
action_type = s_FullAuto
set_animation("None")
bullet_spread = 0
shoot_sfx = sfx_mp5Shoot
}
	
function wpn_PPSh41(){
set_weapon_offset(50,30)
weapon_name = "PPSh41"//ППШ-41
cost = 2950
if object_index = GM && add_to_list = true{
array_push(tier_3_gun_list,weapon_id)
array_push(weapon_list,weapon_id)
array_push(box_list,weapon_id)
array_push(smg_list,weapon_id)
array_push(soviet_list,weapon_id)
exit}
auto = true
set_gun_ammo(71,1,true)
set_bullet_power(s_762x25mmTokarev,6.7)
set_gun_handling(-6,2.5,8)
set_deploy_stats(14,1)
shoot_delay = 3
action_type = s_FullAuto
set_animation("None")
bullet_spread = 3
shoot_sfx = sfx_mp5Shoot
jam_chance = 1.2
if object_index = Player && jam_timer = 0{jam_time = irandom_range(120,180)}
description = "Soviet Bullet Hose, typically a reliable weapon but the drum magazine sacrifices a bit of reliability for magazine capacity"
}

function wpn_spectre(){
set_weapon_offset(-1,38)
weapon_name = "spectre"
cost = 850
if object_index = GM && add_to_list = true{
array_push(tier_5_gun_list,weapon_id)
array_push(weapon_list,weapon_id)
array_push(box_list,weapon_id)
array_push(smg_list,weapon_id)
exit}
auto = true
set_gun_ammo(30,4,true)
set_bullet_power(s_45ACP,8.9)
set_gun_handling(-5,1,6.6)
set_deploy_stats(9,-1)
shoot_delay = 4
action_type = s_FullAuto
set_animation("None")
shoot_sfx = sfx_mp5Shoot
description = ""
}

function wpn_AK47(){
set_weapon_offset(42,12)
weapon_name = "AK-47";
cost = 1500
if object_index = GM && add_to_list = true{
array_push(tier_3_gun_list,weapon_id)
array_push(weapon_list,weapon_id)
array_push(wallbuy_list,weapon_id)
array_push(box_list,weapon_id)
array_push(full_ar_list,weapon_id)
array_push(soviet_list,weapon_id)
exit}
auto = true
set_gun_ammo(30,2,true)
set_bullet_power(s_762x39mm,16.3)
set_gun_handling(-30,11,8.4)
set_deploy_stats(20,1)
shoot_delay = 8
action_type = s_FullAuto
set_animation("Pistol Clip")
weapon_draw_sprite = s_AK47Base
mag_sprite = s_AK47Mag
shoot_sfx = sfx_AK47Shoot
description = "Most produced firearm in the world as it's a cheap and simple, yet deadly weapon. High power but known for it's inaccuracy due to subpar recoil control"
}

function wpn_Galil(){
set_weapon_offset(42,12)
weapon_name = "Galil"
cost = 2800
if object_index = GM && add_to_list = true{
array_push(tier_3_gun_list,weapon_id)
array_push(weapon_list,weapon_id)
array_push(box_list,weapon_id)
array_push(full_ar_list,weapon_id)
exit}
auto = true
set_gun_ammo(35,2,true)
set_bullet_power(s_556X45mmNATO,16.3)
set_gun_handling(-5,6,9.5)
set_deploy_stats(18,1)
shoot_delay = 7
action_type = s_FullAuto
set_animation("Pistol Clip")
weapon_draw_sprite = s_GalilBase
mag_sprite = s_GalilMag
shoot_sfx = sfx_AK47Shoot
}

function wpn_AN94(){
set_weapon_offset(43,12)
weapon_name = "AN-94"
cost = 2790
if object_index = GM && add_to_list = true{
array_push(tier_4_gun_list,weapon_id)
array_push(weapon_list,weapon_id)
array_push(box_list,weapon_id)
array_push(full_ar_list,weapon_id)
exit}
auto = true
set_gun_ammo(30,2,true)
set_bullet_power(s_545x39mm,18.3)
set_gun_handling(-6,7,8.6)
set_deploy_stats(16,1)
shoot_delay = 6
action_type = s_FullAuto
set_animation("None")
if object_index != Player{exit}
if trigger_delay_timer < 2 && ammo_inmag > 1{shoot_amount = 2;gun_recoil = 2}else{shoot_amount = 1}
description = "Russian assault rifle with good handling and a unique firing system that allows the first 2 shots after a trigger pull to shoot at a faster rate of fire"
}

function wpn_Xiuhcoatl(){
set_weapon_offset(24,15)
weapon_name = "Xiuhcoatl"
cost = 1450
if object_index = GM && add_to_list = true{
array_push(tier_4_gun_list,weapon_id)
array_push(weapon_list,weapon_id)
//array_push(box_list,weapon_id)
array_push(full_ar_list,weapon_id)
exit}
auto = true
set_gun_ammo(30,2,true)
set_bullet_power(s_556X45mmNATO,16.3)
set_gun_handling(-9,8,8.6)
set_deploy_stats(15,1)
shoot_delay = 4
action_type = s_FullAuto
set_animation("None")
shoot_sfx = sfx_AK47Shoot
description = "Mexican produced AR for the Mexican military. Xiuhcoatl translates to Fire Serpant and is named such for it's high fire rate for"
}

function wpn_ScarH(){
set_weapon_offset(44,16)
weapon_name = "Scar H"
cost = 2900
if object_index = GM && add_to_list = true{
array_push(tier_4_gun_list,weapon_id)
array_push(weapon_list,weapon_id)
array_push(box_list,weapon_id)
array_push(full_ar_list,weapon_id)
exit}
auto = true
set_gun_ammo(20,4,true)
set_bullet_power(s_762x51NATO,16)
set_gun_handling(-7,6,8.6)
set_deploy_stats(18,1)
shoot_delay = 6
action_type = s_FullAuto
set_animation("Pistol Clip")
reload_time += 5
weapon_draw_sprite = s_ScarHBase
mag_sprite = s_ScarHMag
shoot_sfx = sfx_AK47Shoot
}

function wpn_M14(){
set_weapon_offset(43,35)
weapon_name = "M14"
cost = 400
if object_index = GM && add_to_list = true{
array_push(tier_4_gun_list,weapon_id)
array_push(weapon_list,weapon_id)
//array_push(wallbuy_list,weapon_id)
array_push(semi_ar_list,weapon_id)
exit}
auto = false
set_gun_ammo(8,4,true)
set_bullet_power(s_762x51NATO,22)
set_gun_handling(4,5,9)
set_deploy_stats(18,1)
shoot_delay = 7
action_type = s_SemiAuto
set_animation("None")
shoot_sfx = sfx_AK47Shoot
}
	
function wpn_RPD(){
set_weapon_offset(41,11)
weapon_name = "RPD"
cost = 2900
if object_index = GM && add_to_list = true{
array_push(tier_4_gun_list,weapon_id)
array_push(weapon_list,weapon_id)
array_push(wallbuy_list,weapon_id)
array_push(box_list,weapon_id)
array_push(lmg_list,weapon_id)
array_push(soviet_list,weapon_id)
exit}
auto = true
set_gun_ammo(100,1,true)
set_bullet_power(s_762x39mm,18)
set_gun_handling(-9,9,16.3)
set_deploy_stats(30,-1)
shoot_delay = 5
action_type = s_FullAuto
set_animation("None")
shoot_sfx = sfx_AK47Shoot
}

function wpn_M60(){
set_weapon_offset(58,18)
weapon_name = "M60 Rambo"
cost = 1500
if object_index = GM && add_to_list = true{
array_push(tier_5_gun_list,weapon_id)
array_push(weapon_list,weapon_id)
array_push(wallbuy_list,weapon_id)
array_push(box_list,weapon_id)
array_push(lmg_list,weapon_id)
exit}
auto = true
set_gun_ammo(100,0,true)
set_bullet_power(s_762x51NATO,22.2)
set_gun_handling(-8,7,19);if object_index = Player{weapon_weight += ((ammo_inmag+ammo_reserve)*0.056)}
set_deploy_stats(30,-1)
shoot_delay = 6
action_type = s_FullAuto
set_animation("None")
shoot_sfx = sfx_AK47Shoot
}

function wpn_Lewis(){
set_weapon_offset(29,19)
weapon_name = "Lewis"
cost = 2150
if object_index = GM && add_to_list = true{
array_push(tier_5_gun_list,weapon_id)
array_push(weapon_list,weapon_id)
array_push(box_list,weapon_id)
array_push(lmg_list,weapon_id)
exit}
auto = true
set_gun_ammo(47,1,true)
set_bullet_power(s_303British,26)
set_gun_handling(-5,3,28)
set_deploy_stats(35,-1)
shoot_delay = 8
action_type = s_FullAuto
set_animation("None")
shoot_sfx = sfx_AK47Shoot
}

function wpn_MG42(){
set_weapon_offset(47,19)
weapon_name = "MG42 Buzzsaw"
cost = 3200
if object_index = GM && add_to_list = true{
array_push(tier_5_gun_list,weapon_id)
array_push(weapon_list,weapon_id)
array_push(wallbuy_list,weapon_id)
array_push(box_list,weapon_id)
array_push(lmg_list,weapon_id)
array_push(nazi_list,weapon_id)
exit}
auto = true
set_gun_ammo(50,1,true)
set_bullet_power(s_79257mmMauser,25.2)
set_gun_handling(-8,7,25.6)
set_deploy_stats(30,-1)
shoot_delay = 3
action_type = s_FullAuto
set_animation("None")
shoot_sfx = sfx_AK47Shoot
}

function wpn_Karabiner98k(){
set_weapon_offset(20,45)
weapon_name = "Karabiner98k"
cost = 1000
if object_index = GM && add_to_list = true{
array_push(tier_3_gun_list,weapon_id)
array_push(weapon_list,weapon_id)
array_push(wallbuy_list,weapon_id)
array_push(box_list,weapon_id)
array_push(sniper_list,weapon_id)
array_push(nazi_list,weapon_id)
exit}
auto = false
set_gun_ammo(5,28,false)
set_bullet_power(s_79257mmMauser,23.6)
set_gun_handling(12,4,9)
set_deploy_stats(10,1)
shoot_delay = 60
action_type = s_BoltAction
set_animation("None")
reload_sfx = sfx_AWPReload
shoot_sfx = sfx_SSG08Shoot
}

function wpn_SSG08(){
set_weapon_offset(43,33)
weapon_name = "SSG-08"
cost = 750
if object_index = GM && add_to_list = true{
array_push(tier_3_gun_list,weapon_id)
array_push(weapon_list,weapon_id)
array_push(box_list,weapon_id)
array_push(sniper_list,weapon_id)
exit}
auto = false
set_gun_ammo(10,3,true)
set_bullet_power(s_762x51NATO,27.9)
set_gun_handling(15,4,13.4)
set_deploy_stats(15,1)
shoot_delay = 60
action_type = s_BoltAction
set_animation("None")
reload_sfx = sfx_AWPReload
shoot_sfx = sfx_SSG08Shoot
}

function wpn_MosinNagat(){
set_weapon_offset(35,45)
weapon_name = "Mosin Nagat"
cost = 400
if object_index = GM && add_to_list = true{
array_push(tier_4_gun_list,weapon_id)
array_push(weapon_list,weapon_id)
array_push(wallbuy_list,weapon_id)
array_push(box_list,weapon_id)
array_push(sniper_list,weapon_id)
exit}
auto = false
set_gun_ammo(5,25,false)
set_bullet_power(s_762x54R,29)
set_gun_handling(15,4,8.8)
set_deploy_stats(15,1)
shoot_delay = 60
action_type = s_BoltAction
set_animation("None")
reload_sfx = sfx_AWPReload
shoot_sfx = sfx_SSG08Shoot
var_string = current_year-1891
description = "This unassuming broom closet rifle has somehow managed to weasel it's way into any major or minor conflict for the last "+string(var_string)+" years, examples being the russo-japanese war, WW1, Russian Civil, Finnish Civil, Spanish Civil, WW2, 1950's Korean War, Vietnam resistence War against USA, Afgan Civil, Chechen War 1 and 2, Iraq Wars, Ukraine Vs Russia, various African conflicts, and so many other conflicts you and I have never heard of and I bet as I'm typing this there's probably another war starting, god knows where, and some guy is gonna use their grandad's Mosin Nagat that he got from some guy he killed in some other war and... war never changes does it?"
}

function wpn_AWP(){
set_weapon_offset(35,45)
weapon_name = "AWP"
cost = 4750
if object_index = GM && add_to_list = true{
array_push(tier_4_gun_list,weapon_id)
array_push(weapon_list,weapon_id)
array_push(wallbuy_list,weapon_id)
array_push(box_list,weapon_id)
array_push(sniper_list,weapon_id)
exit}
auto = false
set_gun_ammo(5,5,true)
set_bullet_power(s_308WinchesterMagnum,24)
set_gun_handling(30,16,14.3)
set_deploy_stats(20,1)
shoot_delay = 70
action_type = s_BoltAction
set_animation("None")
reload_sfx = sfx_AWPReload
shoot_sfx = sfx_AWPShoot
}

function wpn_DSR50(){
set_weapon_offset(29,37)
weapon_name = "DSR-50"
cost = 5000
if object_index = GM && add_to_list = true{
array_push(tier_5_gun_list,weapon_id)
array_push(weapon_list,weapon_id)
array_push(box_list,weapon_id)
array_push(sniper_list,weapon_id)
exit}
auto = false
set_gun_ammo(4,2,true)
set_bullet_power(s_50BMG,20)
set_gun_handling(60,32,13.9)
set_deploy_stats(28,1)
shoot_delay = 80
action_type = s_BoltAction
set_animation("None")
reload_sfx = sfx_AWPReload
shoot_sfx = sfx_AWPShoot
}

function wpn_GM6Lynx(){
set_weapon_offset(43,33)
weapon_name = "GM6 Lynx"
cost = 14000
auto = false
if object_index = GM && add_to_list = true{
array_push(tier_5_gun_list,weapon_id)
array_push(weapon_list,weapon_id)
array_push(box_list,weapon_id)
array_push(sniper_list,weapon_id)
exit}
set_gun_ammo(5,3,true)
set_bullet_power(s_50BMG,29)
set_gun_handling(135,72,26.5)
set_deploy_stats(36,1)
shoot_delay = 14
action_type = s_SemiAuto
set_animation("None")
if object_index = Player && ammo_inmag = ammo_inmag_max{jam_chance = 49}
else{jam_chance = 1}
jam_time = 720
reload_sfx = sfx_AWPReload
shoot_sfx = sfx_AWPShoot
description = ".50 BMG semi auto rifle that would be an ideal head exploding weapon if it wasn't hindered by it's weight, violent recoil, and unreliability. If (or when) this gun jams, you'll need a screwdriver, knife, or some other kind of tool to get the rounds unstuck"
}

function wpn_M79(){
weapon_id = s_M79
weapon_name = "M79 Thumper"
cost = 3000
auto = false
if object_index = GM && add_to_list = true{
array_push(tier_4_gun_list,weapon_id)
array_push(weapon_list,weapon_id)
array_push(box_list,weapon_id)
exit}
set_gun_ammo(1,8,false)
//set_bullet_power(150,0,1)
set_gun_handling(5,2,6)
set_deploy_stats(10,-1)
shoot_delay = 15
action_type = s_SingleShot
bullet_speed = 45
bullet_sprite = s_SquareGunBullet
reload_time = 170
explosive = true
explosion_damage = 300
description = ""
}

function wpn_RPG7(){
weapon_id = s_RPG7
weapon_name = "RPG-7"
cost = 5500
auto = false
if object_index = GM && add_to_list = true{
array_push(tier_4_gun_list,weapon_id)
array_push(weapon_list,weapon_id)
array_push(wallbuy_list,weapon_id)
array_push(box_list,weapon_id)
array_push(soviet_list,weapon_id)
exit}
set_gun_ammo(1,1,false)
//set_bullet_power(500,0,1)
set_gun_handling(-5,0,15.4)
set_deploy_stats(30,1)
shoot_delay = 15
action_type = s_SingleShot
bullet_speed = 45
bullet_sprite = s_RPG7Rocket
if object_index != Player{exit}
if ammo_inmag > 0{weapon_draw_sprite = s_RPG7}else{weapon_draw_sprite = s_RPG7NoRocket}
set_animation("None")
explosive = true
explosion_damage = 600
description = ""
}

function wpn_SquareGun(){
weapon_id = s_SquareGun
weapon_name = "Quad Lazer"
cost = 6666333325
auto = false
if object_index = GM && add_to_list = true{
array_push(tier_5_gun_list,weapon_id)
array_push(weapon_list,weapon_id)
array_push(box_list,weapon_id)
exit}
set_gun_ammo(4,0,false)
//set_bullet_power(16000,0,4000)
set_gun_handling(0,96,16)
set_deploy_stats(20,-1)
shoot_delay = 1
action_type = s_SemiAuto
bullet_speed = 0.2
bullet_sprite = s_SquareGunBullet
set_animation("None")
description = "Standard issue Lazer Pistol for Mooninite infantry during the Plutonian conflict"}
	/*
function wpn_LR230(){
weapon_id = s_SquareGun
weapon_name = "LR 230C"
cost = 3000
auto = true
if object_index = GM && add_to_list = true{
//array_push(weapon_list,weapon_id)
//array_push(box_list,weapon_id)
exit}
set_gun_ammo(1000,1000)
//set_bullet_power(2,1,1)
set_gun_handling(0,4,15)
set_deploy_stats(30,1)
shoot_delay = 1
action_type = s_FullAuto
bullet_speed = 1
bullet_sprite = s_SquareGunBullet
set_animation("None")
description = "Lazer Ray 230 Celcius, or as the Americans say, 450 Ferenheit is a 2002 inhouse developed lazer rifle designed for bullet varius immune containment subjects. It's interior is lined with inconel and nemonic to allow the rifle the reach the extreme tempertures. It's highly effective against single targets but may not be ideal against multiple enemies"}

function wpn_BFR500(){
weapon_id = s_BFR500
weapon_name = "BFR 500"
cost = 2780
if object_index = GM && add_to_list = true{
//array_push(weapon_list,weapon_id)
//array_push(box_list,weapon_id)
//array_push(revolver_list,weapon_id)
exit}
auto = false
set_gun_ammo(5,5)
set_bullet_power(s_500SAWMagnum,8)
set_gun_handling(180,64,4.2)
set_deploy_stats(20,-1)
shoot_delay = 60
action_type = s_SingleAction
reload_sfx = sfx_DEagleReload
shoot_sfx = sfx_DEagleShoot
//description = "Unnecessarily large revolver with power that questionably compensates it's uncontrollable recoil and knockback"
}