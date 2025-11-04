function script_execute_wpn(arg_weapon_sprite){
var_string = string_delete(sprite_get_name(arg_weapon_sprite),1,2)
script_execute(asset_get_index("wpn_"+string(var_string)))
}
function referece_weapons(){referece_weapons()
wpn_Knife()
wpn_m1911()
wpn_Taurus92()
wpn_SnW500()
wpn_Olympia()
wpn_Remi870()
wpn_mp5()
wpn_spectre()
wpn_AK47()
//H&K G11
wpn_M14()
wpn_Xiuhcoatl()
wpn_AWP()
wpn_DSR50()
wpn_SquareGun()
}

function wpn_Knife(){
weapon_sprite = s_Knife
weapon_name = "Knife"
cost = 0
auto = false
ammo_reserve_max = 72
ammo_inmag_max = 8
weapon_damage = 14
penetration = 1
base_recoil = 3
shoot_delay = 4
knockback = 2
reload_time = 55
weapon_weight = 1
}

function wpn_m1911(){
weapon_sprite = s_m1911
weapon_name = "m1911"
cost = 100
auto = false
ammo_reserve_max = 72
ammo_inmag_max = 8
weapon_damage = 14
penetration = 1
base_recoil = 3
shoot_delay = 3
knockback = 2
reload_time = 55
weapon_weight = 2
}
	
function wpn_Taurus92(){
weapon_sprite = s_Taurus92
weapon_name = "Taurus 92"
cost = 150
auto = false
ammo_reserve_max = 85
ammo_inmag_max = 17
weapon_damage = 15
penetration = 1
base_recoil = 6
shoot_delay = 6
knockback = 2.5
reload_time = 65
weapon_weight = 2
}

function wpn_SnW500(){
weapon_sprite = s_SnW500
weapon_name = "S&W500"
cost = 3000
auto = false
ammo_reserve_max = 10
ammo_inmag_max = 5
weapon_damage = 100
penetration = 3
base_recoil = 15
shoot_delay = 20
knockback = 24
reload_time = 130
weapon_weight = 3
}

function wpn_Olympia(){
weapon_sprite = s_Olympia
weapon_name = "Olympia"
cost = 250
auto = false
ammo_reserve_max = 38
ammo_inmag_max = 2
weapon_damage = 3
penetration = 2
base_recoil = 2
shoot_delay = 5
knockback = 12
reload_time = 150
weapon_weight = 4
bullet_spread = 20
bullet_amount = 8
}
	
function wpn_Remi870(){
weapon_sprite = s_Remi870
weapon_name = "Remi870Marine"
cost = 2500
auto = false
ammo_reserve_max = 35
ammo_inmag_max = 7
weapon_damage = 4
penetration = 2
base_recoil = 2
shoot_delay = 45
knockback = 25
reload_time = 180
weapon_weight = 6
bullet_spread = 30
bullet_amount = 14
}

function wpn_mp5(){
weapon_sprite = s_mp5
weapon_name = "mp5"
cost = 1200
ammo_reserve_max = 150
ammo_inmag_max = 30
auto = true
weapon_damage = 8
penetration = 1
base_recoil = 2
shoot_delay = 5
knockback = 2
reload_time = 90
weapon_weight = 3
}

function wpn_spectre(){
weapon_sprite = s_spectre
weapon_name = "spectre"
cost = 1250
auto = true
ammo_reserve_max = 160
ammo_inmag_max = 50
weapon_damage = 7
penetration = 1
base_recoil = 8
shoot_delay = 3
knockback = 3
reload_time = 75
weapon_weight = 3
}

function wpn_AK47(){
weapon_sprite = s_AK47
weapon_name = "AK-47"
cost = 2700
auto = true
ammo_reserve_max = 60
ammo_inmag_max = 30
weapon_damage = 30
penetration = 2
base_recoil = 12
shoot_delay = 9
knockback = 14
reload_time = 110
weapon_weight = 7
}

function wpn_Xiuhcoatl(){
weapon_sprite = s_Xiuhcoatl
weapon_name = "Xiuhcoatl"
cost = 1450
auto = true
ammo_reserve_max = 90
ammo_inmag_max = 30
weapon_damage = 20
penetration = 2
base_recoil = 8
shoot_delay = 3
knockback = 9
reload_time = 110
weapon_weight = 6.5
}

function wpn_M14(){
weapon_sprite = s_M14
weapon_name = "M14"
cost = 250
auto = false
ammo_reserve_max = 96
ammo_inmag_max = 8
weapon_damage = 24
penetration = 1
base_recoil = 2
shoot_delay = 7
knockback = 4
reload_time = 70
weapon_weight = 5
}

function wpn_AWP(){
weapon_sprite = s_AWP
weapon_name = "AWP"
cost = 4750
auto = false
ammo_reserve_max = 30
ammo_inmag_max = 5
weapon_damage = 115//Reduced damage against Bosses
penetration = 4
base_recoil = 2
shoot_delay = 50
knockback = 16
reload_time = 100
weapon_weight = 8
}

function wpn_DSR50(){
weapon_sprite = s_DSR50
weapon_name = "DSR"
cost = 5000
auto = false
ammo_reserve_max = 28
ammo_inmag_max = 4
weapon_damage = 65
penetration = 8
base_recoil = 2
shoot_delay = 60
knockback = 32
reload_time = 105
weapon_weight = 9
}

function wpn_SquareGun(){
weapon_sprite = s_SquareGun
weapon_name = "Quad Lazer"
cost = 16000
auto = false
ammo_reserve_max = 4
ammo_inmag_max = 4
weapon_damage = 9999
penetration = 9999
base_recoil = 0
shoot_delay = 1
knockback = 100
bullet_speed = 1
bullet_sprite = s_SquareGunBullet
reload_time = 4
weapon_weight = 8
}