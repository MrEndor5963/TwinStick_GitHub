/*
melee_list = []
box_list = []
handgun_list = []
revolver_list = []
machine_pistol_list = []
smg_list = []
semi_ar_list = []
full_ar_list = []
lmg_list = []
shotgun_list = []
sniper_list = []
nazi_list = []
*/
function script_execute_wpn(arg_weapon_sprite){
set_gun_ammo(8,72)
set_bullet_power(18,3,1)
bullet_speed = 60
gun_recoil = 0.5
shoot_delay = 12
knockback = 2
bullet_sprite = s_Bullet
reload_time = 60
weapon_weight = 0.5
bullet_amount = 1
bullet_spread = 1
jam_chance = 0
trigger_delay = 0
reload_sfx = sfx_m1911Reload
shoot_sfx = sfx_m1911Shoot
reload_bullet_time = 0
shoot_amount = 1
//bullet_xoff = 0
//bullet_yoff = 0
//
var_string = string_delete(sprite_get_name(arg_weapon_sprite),1,2)
script_execute(asset_get_index("wpn_"+string(var_string)))
}

function set_gun_ammo(arg_ammo_inmag_max,arg_ammo_reserve_max){
ammo_inmag_max = arg_ammo_inmag_max
ammo_reserve_max = arg_ammo_reserve_max
}

function set_bullet_power(arg_bullet_damage,arg_bullet_knockback,arg_bullet_penetration){
weapon_damage = arg_bullet_damage
bullet_knockback = arg_bullet_knockback
penetration = arg_bullet_penetration
}

function set_variable_reload_time(arg_reload_startup,arg_reload_bullet_time,arg_reload_endlag){
if object_index != Player{exit}
reload_startup = arg_reload_startup
reload_bullet_time = arg_reload_bullet_time
reload_endlag = arg_reload_endlag

if reload_timer = 0{reload_amount = ammo_inmag_max-ammo_inmag}
reload_time = reload_startup+reload_endlag+(reload_bullet_time*(reload_amount))
}

function set_deploy_stats(arg_deploy_time,arg_deploy_direction){
deploy_time = arg_deploy_time
deploy_direction = arg_deploy_direction
}

function referece_weapons(){
//Melee
wpn_Knife()
//Pistols
wpn_m1911()
wpn_Taurus92()
wpn_DEagle()
//Revolvers
wpn_Python()
wpn_SnW500()
wpn_BFR500()
//Machine Pistols
wpn_CZ75Auto()
//SMG's
wpn_Luty()
wpn_VzSkorpion()
wpn_Uzi()
wpn_mp5()
wpn_PPBison()
wpn_spectre()
wpn_MP40()
wpn_Thompson()
wpn_KrissVector()
//Semi Auto AR's
wpn_M14()
//Full Auto AR's
wpn_AK47()
wpn_AN94()
wpn_Xiuhcoatl()
wpn_Galil()
//LMG's
wpn_RPD()
wpn_Lewis()
//Shotguns
wpn_Olympia()
wpn_Ithaca()
wpn_Remi870()
wpn_Spaz12()
wpn_Winchester1897()
//Sniper Rifles
wpn_SSG08()
wpn_AWP()
wpn_DSR50()
wpn_GM6Lynx()
//Other
wpn_SquareGun()
//Note weapons are roughly organized by power
}

function wpn_Knife(){
weapon_sprite = s_Knife
weapon_name = "Knife"
cost = 0
if object_index = GM{
array_push(melee_list,weapon_sprite)
exit}
auto = false
weapon_damage = 25
penetration = 1
gun_recoil = 3
shoot_delay = 30
knockback = 2
bullet_knockback = 5
reload_time = 0
weapon_weight = 0.5
}

function wpn_m1911(){
weapon_sprite = s_m1911
weapon_name = "m1911"
cost = 250
if object_index = GM{
array_push(box_list,weapon_sprite)
array_push(handgun_list,weapon_sprite)
exit}
auto = false
set_gun_ammo(8,72)
set_bullet_power(18,3,1)
set_deploy_stats(7,-1)
gun_recoil = 5
shoot_delay = 1
knockback = 2
weapon_weight = 1
reload_time = 65
reload_sfx = sfx_m1911Reload
shoot_sfx = sfx_m1911Shoot
}
	
function wpn_Taurus92(){
weapon_sprite = s_Taurus92
weapon_name = "Taurus 92"
cost = 350
if object_index = GM{
array_push(box_list,weapon_sprite)
array_push(handgun_list,weapon_sprite)
exit}
auto = false
set_gun_ammo(17,85)
set_bullet_power(22,4,1)
set_deploy_stats(7,-1)
gun_recoil = 8
shoot_delay = 4
knockback = 2.5
reload_time = 90
weapon_weight = 1
reload_sfx = sfx_m1911Reload
shoot_sfx = sfx_m1911Shoot
}
	
function wpn_DEagle(){
weapon_sprite = s_DEagle
weapon_name = "DEagle"
cost = 1250
if object_index = GM{
array_push(box_list,weapon_sprite)
array_push(handgun_list,weapon_sprite)
exit}
auto = false
set_gun_ammo(7,35)
set_bullet_power(60,2,1)
set_deploy_stats(9,-1)
gun_recoil = 70
shoot_delay = 5
knockback = 9
reload_time = 65
weapon_weight = 1.5
reload_sfx = sfx_DEagleReload
shoot_sfx = sfx_DEagleShoot
}

function wpn_Python(){
weapon_sprite = s_Python
weapon_name = "Python"
cost = 1700
if object_index = GM{
array_push(box_list,weapon_sprite)
array_push(handgun_list,weapon_sprite)
array_push(revolver_list,weapon_sprite)
exit}
auto = false
set_gun_ammo(6,36)
set_bullet_power(70,2,2)
set_deploy_stats(9,-1)
gun_recoil = 70
shoot_delay = 8
knockback = 16
set_variable_reload_time(30,45,60)
weapon_weight = 1.5
bullet_spread = 1
reload_sfx = sfx_DEagleReload
shoot_sfx = sfx_DEagleShoot
}

function wpn_SnW500(){
weapon_sprite = s_SnW500
weapon_name = "S&W500"
cost = 2500
if object_index = GM{
array_push(box_list,weapon_sprite)
array_push(handgun_list,weapon_sprite)
array_push(revolver_list,weapon_sprite)
exit}
auto = false
set_gun_ammo(5,15)
set_bullet_power(80,2,3)
set_deploy_stats(10,-1)
gun_recoil = 80
shoot_delay = 8
knockback = 24
set_variable_reload_time(45,45,30)
weapon_weight = 1.5
reload_sfx = sfx_DEagleReload
shoot_sfx = sfx_DEagleShoot
}

function wpn_BFR500(){
weapon_sprite = s_BFR500
weapon_name = "BFR 500"
cost = 2780
if object_index = GM{
array_push(box_list,weapon_sprite)
array_push(revolver_list,weapon_sprite)
exit}
auto = false
set_gun_ammo(5,5)
set_bullet_power(300,20,6)
set_deploy_stats(12,-1)
gun_recoil = 180
shoot_delay = 60
knockback = 50
set_variable_reload_time(45,30,45)
weapon_weight = 1.5
reload_sfx = sfx_DEagleReload
shoot_sfx = sfx_DEagleShoot
}

function wpn_CZ75Auto(){
weapon_sprite = s_CZ75Auto
weapon_name = "CZ75 Auto"
cost = 400
if object_index = GM{
array_push(box_list,weapon_sprite)
array_push(handgun_list,weapon_sprite)
array_push(machine_pistol_list,weapon_sprite)
exit}
auto = true
set_gun_ammo(16,48)
set_bullet_power(17,4,1)
set_deploy_stats(7,-1)
gun_recoil = (7*choose(1,-1))
shoot_delay = 4
knockback = 4
reload_time = 55
weapon_weight = 1
reload_sfx = sfx_m1911Reload
shoot_sfx = sfx_m1911Shoot
}

function wpn_Luty(){
weapon_sprite = s_Luty
weapon_name = "Luty"
cost = 80
if object_index = GM{
array_push(box_list,weapon_sprite)
array_push(smg_list,weapon_sprite)
exit}
auto = true
set_gun_ammo(18,162)
set_bullet_power(12,2,1)
set_deploy_stats(11,1)
gun_recoil = 25*choose(1,-1)
shoot_delay = 4
knockback = 2
reload_time = 75
weapon_weight = 1.5
bullet_spread = 12
trigger_delay = 15
jam_chance = 95
jam_time = 160
shoot_sfx = sfx_m1911Shoot
}

function wpn_VzSkorpion(){
weapon_sprite = s_VzSkorpion
weapon_name = "Vz Škorpion"
cost = 700
if object_index = GM{
array_push(box_list,weapon_sprite)
array_push(smg_list,weapon_sprite)
exit}
auto = true
set_gun_ammo(20,180)
set_bullet_power(12,1,1)
set_deploy_stats(8,-1)
gun_recoil = 4*choose(1,-1)
shoot_delay = 3
knockback = 1.5
reload_time = 80
weapon_weight = 1.5
shoot_sfx = sfx_mp5Shoot
}

	
function wpn_Uzi(){
weapon_sprite = s_Uzi
weapon_name = "Uzi"
cost = 800
if object_index = GM{
array_push(box_list,weapon_sprite)
array_push(smg_list,weapon_sprite)
exit}
auto = true
set_gun_ammo(25,175)
set_bullet_power(14,2,1)
set_deploy_stats(11,-1)
gun_recoil = 12*choose(1,-1)
shoot_delay = 3
knockback = 3
reload_time = 60
weapon_weight = 2.5
shoot_sfx = sfx_mp5Shoot
}

function wpn_spectre(){
weapon_sprite = s_spectre
weapon_name = "spectre"
cost = 850
if object_index = GM{
array_push(box_list,weapon_sprite)
array_push(smg_list,weapon_sprite)
exit}
auto = true
set_gun_ammo(30,150)
set_bullet_power(12,2,1)
set_deploy_stats(9,-1)
gun_recoil = 5*choose(1,-1)
shoot_delay = 4
knockback = 3
reload_time = 75
weapon_weight = 2
shoot_sfx = sfx_mp5Shoot
}

function wpn_MP40(){
weapon_sprite = s_MP40
weapon_name = "MP40"
cost = 1040
if object_index = GM{
array_push(box_list,weapon_sprite)
array_push(smg_list,weapon_sprite)
array_push(nazi_list,weapon_sprite)
exit}
auto = true
set_gun_ammo(32,192)
set_bullet_power(13,3,1)
set_deploy_stats(10,-1)
gun_recoil = 3*choose(1,-1)
shoot_delay = 8
knockback = 3
reload_time = 120
weapon_weight = 2
shoot_sfx = sfx_mp5Shoot
}

function wpn_PPBison(){
weapon_sprite = s_PPBison
weapon_name = "PP Bison"
cost = 1350
if object_index = GM{
array_push(box_list,weapon_sprite)
array_push(smg_list,weapon_sprite)
exit}
auto = true
set_gun_ammo(64,192)
set_bullet_power(12,2,1)
set_deploy_stats(14,-1)
gun_recoil = 5*choose(1,-1)
shoot_delay = 5
knockback = 2
reload_time = 90
weapon_weight = 2
shoot_sfx = sfx_mp5Shoot
}

function wpn_mp5(){
weapon_sprite = s_mp5
weapon_name = "mp5"
cost = 2000
if object_index = GM{
array_push(box_list,weapon_sprite)
array_push(smg_list,weapon_sprite)
exit}
auto = true
set_gun_ammo(30,150)
set_bullet_power(18,2,1)
set_deploy_stats(12,-1)
gun_recoil = 3*choose(1,-1)
shoot_delay = 5
knockback = 2
reload_time = 90
weapon_weight = 2
shoot_sfx = sfx_mp5Shoot
}
	
function wpn_Thompson(){
weapon_sprite = s_Thompson
weapon_name = "Tommy"
cost = 3200
if object_index = GM{
array_push(box_list,weapon_sprite)
array_push(smg_list,weapon_sprite)
exit}
auto = true
set_gun_ammo(100,200)
set_bullet_power(14,2,1)
set_deploy_stats(20,1)
gun_recoil = 6*choose(1,-1)
shoot_delay = 4
knockback = 2
reload_time = 140
weapon_weight = 5
bullet_spread = 3
shoot_sfx = sfx_mp5Shoot
}

function wpn_KrissVector(){
weapon_sprite = s_KrissVector
weapon_name = "Vector 45"
cost = 4800
if object_index = GM{
//array_push(box_list,weapon_sprite)
array_push(smg_list,weapon_sprite)
exit}
auto = true
set_gun_ammo(40,160)
set_bullet_power(18,2,1)
set_deploy_stats(18,-1)
gun_recoil = 8*choose(1,-1)
shoot_delay = 2
knockback = 2
reload_time = 140
weapon_weight = 4
bullet_spread = 0
shoot_sfx = sfx_mp5Shoot
}

function wpn_M14(){
weapon_sprite = s_M14
weapon_name = "M14"
cost = 400
if object_index = GM{
array_push(box_list,weapon_sprite)
array_push(semi_ar_list,weapon_sprite)
exit}
auto = false
set_gun_ammo(8,96)
set_bullet_power(28,8,1)
set_deploy_stats(18,1)
gun_recoil = 4
shoot_delay = 7
knockback = 5
reload_time = 70
weapon_weight = 3.5
shoot_sfx = sfx_AK47Shoot
}

function wpn_AK47(){
weapon_sprite = s_AK47
weapon_name = "AK-47"
cost = 1500
if object_index = GM{
array_push(box_list,weapon_sprite)
array_push(full_ar_list,weapon_sprite)
exit}
auto = true
set_gun_ammo(30,60)
set_bullet_power(40,10,2)
set_deploy_stats(20,1)
gun_recoil = 30*choose(1,-1)
shoot_delay = 8
knockback = 14
reload_time = 110
weapon_weight = 4.5
shoot_sfx = sfx_AK47Shoot
}

function wpn_AN94(){
weapon_sprite = s_AN94
weapon_name = "AN-94"
cost = 2790
if object_index = GM{
array_push(box_list,weapon_sprite)
array_push(full_ar_list,weapon_sprite)
exit}
auto = true
set_gun_ammo(30,60)
set_bullet_power(35,6,2)
set_deploy_stats(16,1)
gun_recoil = 6*choose(1,-1)
shoot_delay = 6
knockback = 10
reload_time = 110
weapon_weight = 4
if object_index != Player{exit}
if trigger_delay_timer < 2 && ammo_inmag > 1{shoot_amount = 2;gun_recoil = 2}else{shoot_amount = 1}
}

function wpn_Xiuhcoatl(){
weapon_sprite = s_Xiuhcoatl
weapon_name = "Xiuhcoatl"
cost = 1450
if object_index = GM{
array_push(box_list,weapon_sprite)
array_push(full_ar_list,weapon_sprite)
exit}
auto = true
set_gun_ammo(30,90)
set_bullet_power(29,5,2)
set_deploy_stats(15,1)
gun_recoil = 9*choose(1,-1)
shoot_delay = 4
knockback = 9
reload_time = 110
weapon_weight = 4
shoot_sfx = sfx_AK47Shoot
}

function wpn_Galil(){
weapon_sprite = s_Galil
weapon_name = "Galil"
cost = 3300
if object_index = GM{
array_push(box_list,weapon_sprite)
array_push(full_ar_list,weapon_sprite)
exit}
auto = true
set_gun_ammo(35,105)
set_bullet_power(25,6,2)
set_deploy_stats(18,1)
gun_recoil = 5*choose(1,-1)
shoot_delay = 7
knockback = 7
reload_time = 130
weapon_weight = 4
shoot_sfx = sfx_AK47Shoot
}

function wpn_Lewis(){
weapon_sprite = s_Lewis
weapon_name = "Lewis"
cost = 2150
if object_index = GM{
array_push(box_list,weapon_sprite)
array_push(lmg_list,weapon_sprite)
exit}
auto = true
set_gun_ammo(47,141)
set_bullet_power(30,8,3)
set_deploy_stats(35,-1)
gun_recoil = 6*choose(1,-1)
shoot_delay = 8
knockback = 8
reload_time = 240
weapon_weight = 7.5
shoot_sfx = sfx_AK47Shoot
}

function wpn_RPD(){
weapon_sprite = s_RPD
weapon_name = "RPD"
cost = 2900
if object_index = GM{
array_push(box_list,weapon_sprite)
array_push(lmg_list,weapon_sprite)
exit}
auto = true
set_gun_ammo(100,100)
set_bullet_power(28,10,1)
set_deploy_stats(30,-1)
gun_recoil = 9*choose(1,-1)
shoot_delay = 5
knockback = 10
reload_time = 300
weapon_weight = 7
shoot_sfx = sfx_AK47Shoot
}

function wpn_Olympia(){
weapon_sprite = s_Olympia
weapon_name = "Olympia 72"
cost = 400
if object_index = GM{
array_push(box_list,weapon_sprite)
array_push(shotgun_list,weapon_sprite)
exit}
auto = false
set_gun_ammo(2,44)
set_bullet_power(8,1.5,1)
set_deploy_stats(12,-1)
gun_recoil = 30
shoot_delay = 5
knockback = 12
reload_time = 120
weapon_weight = 3
bullet_spread = 15
bullet_amount = 10
shoot_sfx = sfx_OlympiaShoot

}

function wpn_Ithaca(){
weapon_sprite = s_Ithaca
weapon_name = "Ithaca 37"
cost = 800
if object_index = GM{
array_push(box_list,weapon_sprite)
array_push(shotgun_list,weapon_sprite)
exit}
auto = false
set_gun_ammo(7,35)
set_bullet_power(8,2,1)
set_deploy_stats(15,-1)
gun_recoil = 40
shoot_delay = 45
knockback = 18
set_variable_reload_time(15,60,30)

weapon_weight = 3
bullet_spread = 20
bullet_amount = 15
shoot_sfx = sfx_IthacaShoot
}
	
function wpn_Remi870(){
weapon_sprite = s_Remi870
weapon_name = "Remi 870 Marine"
cost = 2500
if object_index = GM{
array_push(box_list,weapon_sprite)
array_push(shotgun_list,weapon_sprite)
exit}
auto = false
set_gun_ammo(7,28)
set_bullet_power(10,2,2)
set_deploy_stats(25,1)
gun_recoil = 70
shoot_delay = 30
knockback = 25
set_variable_reload_time(15,55,30)
weapon_weight = 3.5
bullet_spread = 35
bullet_amount = 15
shoot_sfx = sfx_IthacaShoot
}

function wpn_Spaz12(){
weapon_sprite = s_Spaz12
weapon_name = "Spas 12"
cost = 2600
if object_index = GM{
array_push(box_list,weapon_sprite)
array_push(shotgun_list,weapon_sprite)
exit}
auto = false
set_gun_ammo(8,52)
set_bullet_power(8,1,1)
set_deploy_stats(15,-1)
gun_recoil = 95
shoot_delay = 5
knockback = 20
reload_time = 190
weapon_weight = 4.5
bullet_spread = 30
bullet_amount = 12
knockback = 18
set_variable_reload_time(30,45,30)
shoot_sfx = sfx_OlympiaShoot
jam_chance = 40
jam_time = 130
}

function wpn_Winchester1897(){
weapon_sprite = s_Winchester1897
weapon_name = "1897 Trench Gun"
cost = 1150
if object_index = GM{
array_push(box_list,weapon_sprite)
array_push(shotgun_list,weapon_sprite)
exit}
auto = true
set_gun_ammo(6,42)
set_bullet_power(8,1,2)
set_deploy_stats(14,-1)
gun_recoil = 45
shoot_delay = 30
knockback = 42
set_variable_reload_time(15,45,30)
weapon_weight = 3
bullet_spread = 35
bullet_amount = 12
shoot_sfx = sfx_IthacaShoot
}

function wpn_SSG08(){
weapon_sprite = s_SSG08
weapon_name = "SSG-08"
cost = 750
if object_index = GM{
array_push(box_list,weapon_sprite)
array_push(sniper_list,weapon_sprite)
exit}
auto = false
set_gun_ammo(10,90)
set_bullet_power(55,12,1)
set_deploy_stats(15,1)
gun_recoil = 15
shoot_delay = 60
knockback = 4
reload_time = 95
weapon_weight = 3.5
reload_sfx = sfx_AWPReload
shoot_sfx = sfx_SSG08Shoot
}

function wpn_AWP(){
weapon_sprite = s_AWP
weapon_name = "AWP"
cost = 4750
if object_index = GM{
array_push(box_list,weapon_sprite)
array_push(sniper_list,weapon_sprite)
exit}
auto = false
set_gun_ammo(5,35)
set_bullet_power(150,14,4)
set_deploy_stats(20,1)
gun_recoil = 30
shoot_delay = 70
knockback = 16
reload_time = 100
weapon_weight = 5.5
reload_sfx = sfx_AWPReload
shoot_sfx = sfx_AWPShoot
}

function wpn_DSR50(){
weapon_sprite = s_DSR50
weapon_name = "DSR-50"
cost = 5000
if object_index = GM{
array_push(box_list,weapon_sprite)
array_push(sniper_list,weapon_sprite)
exit}
auto = false
set_gun_ammo(4,28)
set_bullet_power(140,16,8)
set_deploy_stats(28,1)
gun_recoil = 60
shoot_delay = 80
knockback = 32
reload_time = 105
weapon_weight = 8
reload_sfx = sfx_AWPReload
shoot_sfx = sfx_AWPShoot
}

function wpn_GM6Lynx(){
weapon_sprite = s_GM6Lynx
weapon_name = "GM6 Lynx"
cost = 14000
auto = false
if object_index = GM{
array_push(box_list,weapon_sprite)
array_push(sniper_list,weapon_sprite)
exit}
set_gun_ammo(5,30)
set_bullet_power(165,12,4)
set_deploy_stats(36,1)
gun_recoil = 135
shoot_delay = 15
knockback = 72
reload_time = 105
weapon_weight = 8
if object_index = Player && ammo_inmag = ammo_inmag_max{jam_chance = 4}
else{jam_chance = 100}
jam_time = 720
reload_sfx = sfx_AWPReload
shoot_sfx = sfx_AWPShoot
}

function wpn_SquareGun(){
weapon_sprite = s_SquareGun
weapon_name = "Quad Lazer"
cost = 16000
auto = false
if object_index = GM{
array_push(box_list,weapon_sprite)
exit}
set_gun_ammo(4,4)
set_bullet_power(16000,0,4000)
set_deploy_stats(20,-1)
gun_recoil = 0
shoot_delay = 1
knockback = 96
bullet_speed = 0.2
bullet_sprite = s_SquareGunBullet
reload_time = 4
weapon_weight = 5.5
}