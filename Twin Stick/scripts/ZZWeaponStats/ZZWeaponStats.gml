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
var_string = string_delete(sprite_get_name(arg_weapon_sprite),1,2)
script_execute(asset_get_index("wpn_"+string(var_string)))
}sprite_nineslice_create()
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
ammo_reserve_max = 72
ammo_inmag_max = 8
weapon_damage = 18
penetration = 1
gun_recoil = 5
shoot_delay = 1
knockback = 2
bullet_knockback = 3
reload_time = 65
weapon_weight = 1
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
ammo_reserve_max = 85
ammo_inmag_max = 17
weapon_damage = 22
penetration = 1
gun_recoil = 8
shoot_delay = 4
knockback = 2.5
bullet_knockback = 4
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
ammo_reserve_max = 35
ammo_inmag_max = 7
weapon_damage = 60
penetration = 1
gun_recoil = 70
shoot_delay = 5
knockback = 9
bullet_knockback = 2
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
ammo_reserve_max = 36
ammo_inmag_max = 6
weapon_damage = 70
penetration = 2
gun_recoil = 70
shoot_delay = 8
knockback = 16
bullet_knockback = 2
reload_startup = 30
reload_bullet_time = 45
reload_endlag = 60
if reload_timer = 0{reload_amount = ammo_inmag_max-ammo_inmag}
reload_time = reload_startup+reload_endlag+(reload_bullet_time*(reload_amount))
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
ammo_reserve_max = 10
ammo_inmag_max = 5
weapon_damage = 80
penetration = 3
gun_recoil = 80
shoot_delay = 8
knockback = 24
bullet_knockback = 2
reload_startup = 45
reload_bullet_time = 45
reload_endlag = 60
if reload_timer = 0{reload_amount = ammo_inmag_max-ammo_inmag}
reload_time = reload_startup+reload_endlag+(reload_bullet_time*(reload_amount))
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
ammo_reserve_max = 5
ammo_inmag_max = 5
weapon_damage = 300
penetration = 6
gun_recoil = 180
shoot_delay = 60
knockback = 50
reload_time = 100
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
ammo_reserve_max = 48
ammo_inmag_max = 16
weapon_damage = 17
penetration = 1
gun_recoil = (7*choose(1,-1))
shoot_delay = 4
knockback = 4
bullet_knockback = 4
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
ammo_reserve_max = 162
ammo_inmag_max = 18
weapon_damage = 12
penetration = 1
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
ammo_reserve_max = 180
ammo_inmag_max = 20
weapon_damage = 12
penetration = 1
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
ammo_reserve_max = 175
ammo_inmag_max = 25
weapon_damage = 14
penetration = 1
gun_recoil = 12*choose(1,-1)
shoot_delay = 3
knockback = 3
reload_time = 60
weapon_weight = 2
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
ammo_reserve_max = 150
ammo_inmag_max = 30
weapon_damage = 12
penetration = 1
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
ammo_reserve_max = 192
ammo_inmag_max = 32
weapon_damage = 13
penetration = 1
gun_recoil = 3*choose(1,-1)
shoot_delay = 9
knockback = 3.5
reload_time = 120
weapon_weight = 2
shoot_sfx = sfx_mp5Shoot
}

function wpn_PPBison(){
weapon_sprite = s_PPBison
weapon_name = "PP Bison"
cost = 1350
ammo_reserve_max = 192
ammo_inmag_max = 64
if object_index = GM{
array_push(box_list,weapon_sprite)
array_push(smg_list,weapon_sprite)
exit}
auto = true
weapon_damage = 12
penetration = 1
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
ammo_reserve_max = 150
ammo_inmag_max = 30
if object_index = GM{
array_push(box_list,weapon_sprite)
array_push(smg_list,weapon_sprite)
exit}
auto = true
weapon_damage = 18
penetration = 1
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
ammo_reserve_max = 200
ammo_inmag_max = 100
if object_index = GM{
array_push(box_list,weapon_sprite)
array_push(smg_list,weapon_sprite)
exit}
auto = true
weapon_damage = 14
penetration = 1
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
ammo_reserve_max = 160
ammo_inmag_max = 40
if object_index = GM{
//array_push(box_list,weapon_sprite)
array_push(smg_list,weapon_sprite)
exit}
auto = true
weapon_damage = 18
penetration = 1
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
ammo_reserve_max = 96
ammo_inmag_max = 8
weapon_damage = 28
penetration = 1
gun_recoil = 4
shoot_delay = 7
knockback = 5
bullet_knockback = 8
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
ammo_reserve_max = 60
ammo_inmag_max = 30
weapon_damage = 40
penetration = 2
gun_recoil = 30*choose(1,-1)
shoot_delay = 8
knockback = 14
bullet_knockback = 10
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
ammo_reserve_max = 90
ammo_inmag_max = 30
weapon_damage = 35
penetration = 2
gun_recoil = 6*choose(1,-1)
shoot_delay = 6
knockback = 10
reload_time = 110
weapon_weight = 4
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
ammo_reserve_max = 120
ammo_inmag_max = 30
weapon_damage = 25
penetration = 2
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
ammo_reserve_max = 140
ammo_inmag_max = 35
weapon_damage = 25
penetration = 2
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
ammo_reserve_max = 141
ammo_inmag_max = 47
weapon_damage = 30
penetration = 3
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
ammo_reserve_max = 100
ammo_inmag_max = 100
weapon_damage = 19
penetration = 1
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
ammo_reserve_max = 38
ammo_inmag_max = 2
weapon_damage = 8
penetration = 1
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
ammo_reserve_max = 35
ammo_inmag_max = 7
weapon_damage = 8
penetration = 1
gun_recoil = 40
shoot_delay = 45
knockback = 18
reload_startup = 15
reload_bullet_time = 60
reload_endlag = 30
if reload_timer = 0{reload_amount = ammo_inmag_max-ammo_inmag}
reload_time = reload_startup+reload_endlag+(reload_bullet_time*(reload_amount))

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
ammo_reserve_max = 35
ammo_inmag_max = 7
weapon_damage = 10
penetration = 2
gun_recoil = 70
shoot_delay = 30
knockback = 25
reload_startup = 15
reload_bullet_time = 60
reload_endlag = 30
if reload_timer = 0{reload_amount = ammo_inmag_max-ammo_inmag}
reload_time = reload_startup+reload_endlag+(reload_bullet_time*(reload_amount))
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
ammo_reserve_max = 60
ammo_inmag_max = 8
weapon_damage = 8
penetration = 1
gun_recoil = 95
shoot_delay = 5
knockback = 20
reload_time = 190
weapon_weight = 4.5
bullet_spread = 30
bullet_amount = 12
knockback = 18
reload_startup = 30
reload_bullet_time = 50
reload_endlag = 60
if reload_timer = 0{reload_amount = ammo_inmag_max-ammo_inmag}
reload_time = reload_startup+reload_endlag+(reload_bullet_time*(reload_amount))
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
ammo_reserve_max = 42
ammo_inmag_max = 6
weapon_damage = 8
penetration = 2
gun_recoil = 45
shoot_delay = 30
knockback = 42
reload_startup = 15
reload_bullet_time = 60
reload_endlag = 30
if reload_timer = 0{reload_amount = ammo_inmag_max-ammo_inmag}
reload_time = reload_startup+reload_endlag+(reload_bullet_time*(reload_amount))
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
ammo_reserve_max = 90
ammo_inmag_max = 10
weapon_damage = 55
penetration = 1
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
ammo_reserve_max = 30
ammo_inmag_max = 5
weapon_damage = 150
penetration = 4
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
ammo_reserve_max = 28
ammo_inmag_max = 4
weapon_damage = 140
penetration = 8
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
ammo_reserve_max = 35
ammo_inmag_max = 5
weapon_damage = 165
penetration = 4
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
ammo_reserve_max = 4
ammo_inmag_max = 4
weapon_damage = 9999
penetration = 400
gun_recoil = 0
shoot_delay = 1
knockback = 96
bullet_speed = 0.2
bullet_sprite = s_SquareGunBullet
reload_time = 4
weapon_weight = 5.5
}