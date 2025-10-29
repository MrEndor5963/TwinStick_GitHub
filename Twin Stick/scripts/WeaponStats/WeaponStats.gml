function script_execute_wpn(arg_weapon_sprite){
var_string = string_delete(sprite_get_name(arg_weapon_sprite),1,2)
script_execute(asset_get_index("wpn_"+string(var_string)))
}
function referece_weapons(){referece_weapons()
wpn_m1911()
wpn_Taurus92()
wpn_SnW500()
wpn_Olympia()
wpn_mp5()
wpn_spectre()
wpn_AK47cs()
wpn_M14()
wpn_Xiuhcoatl()
wpn_AWP()
wpn_DSR50()
wpn_SquareGun()
}

function wpn_m1911(){
weapon_sprite = s_m1911
weapon_name = "m1911"
auto = false
ammo_reserve_max = 72
ammo_inmag_max = 8
weapon_damage = 14
penetration = 1
base_recoil = 2
shoot_delay = 4
knockback = 2
reload_time = 55
}
	
function wpn_Taurus92(){
weapon_sprite = s_Taurus92
weapon_name = "Taurus 92"
auto = false
ammo_reserve_max = 85
ammo_inmag_max = 17
weapon_damage = 15
penetration = 1
base_recoil = 4
shoot_delay = 5
knockback = 2.5
reload_time = 65
}

function wpn_SnW500(){
weapon_sprite = s_SnW500
weapon_name = "S&W500"
auto = false
ammo_reserve_max = 10
ammo_inmag_max = 5
weapon_damage = 160
penetration = 3
base_recoil = 15
shoot_delay = 20
knockback = 10
reload_time = 130
}

function wpn_Olympia(){
weapon_sprite = s_Olympia
weapon_name = "Olympia"
auto = false
ammo_reserve_max = 38
ammo_inmag_max = 2
weapon_damage = 19
penetration = 2
base_recoil = 2
shoot_delay = 5
knockback = 12
reload_time = 180
}

function wpn_mp5(){
weapon_sprite = s_mp5
weapon_name = "mp5"
ammo_reserve_max = 150
ammo_inmag_max = 30
auto = true
weapon_damage = 10
penetration = 1
base_recoil = 2
shoot_delay = 5
knockback = 2
reload_time = 90
}

function wpn_spectre(){
weapon_sprite = s_spectre
weapon_name = "spectre"
auto = true
ammo_reserve_max = 160
ammo_inmag_max = 50
weapon_damage = 10
penetration = 1
base_recoil = 8
shoot_delay = 3
knockback = 3
reload_time = 75
}

function wpn_AK47cs(){
weapon_sprite = s_AK47cs
weapon_name = "AK-47cs"
auto = true
ammo_reserve_max = 60
ammo_inmag_max = 30
weapon_damage = 30
penetration = 2
base_recoil = 12
shoot_delay = 9
knockback = 14
reload_time = 110
}

function wpn_Xiuhcoatl(){
weapon_sprite = s_Xiuhcoatl
weapon_name = "Xiuhcoatl"
auto = true
ammo_reserve_max = 90
ammo_inmag_max = 30
weapon_damage = 5
penetration = 2
base_recoil = 8
shoot_delay = 3
knockback = 9
reload_time = 110
}

function wpn_M14(){
weapon_sprite = s_M14
weapon_name = "M14"
auto = false
ammo_reserve_max = 96
ammo_inmag_max = 8
weapon_damage = 24
penetration = 1
base_recoil = 2
shoot_delay = 7
knockback = 4
reload_time = 70
}

function wpn_AWP(){
weapon_sprite = s_AWP
weapon_name = "AWP"
auto = false
ammo_reserve_max = 30
ammo_inmag_max = 5
weapon_damage = 115//Reduced damage against Bosses
penetration = 4
base_recoil = 2
shoot_delay = 50
knockback = 16
reload_time = 100
}

function wpn_DSR50(){
weapon_sprite = s_DSR50
weapon_name = "DSR"
auto = false
ammo_reserve_max = 28
ammo_inmag_max = 4
weapon_damage = 100
penetration = 8
base_recoil = 2
shoot_delay = 60
knockback = 32
reload_time = 105
}

function wpn_SquareGun(){
weapon_sprite = s_SquareGun
weapon_name = "square_gun"
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
}