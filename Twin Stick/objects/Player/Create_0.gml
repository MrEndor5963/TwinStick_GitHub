player_number = global.player_amount
global.player_amount += 1
hsp = 0;vsp = 0
hsp_knockback = 0;vsp_knockback = 0
mov_spd = 5
hp = 3
hit_stun = 0
kills = 0
shoot_timer = 0

aim_direction = 0;aim_x = 0;aim_y = 0

auto = true;recoil_cooldown = 0

aim_object = 0//instance_create_depth(x,y,depth,PlayerAim)

//Default stats
ammo = 960
weapon_damage = 1
penetration = 1
base_recoil = 0.5
shoot_delay = 12
knockback = 0.2
bullet_speed = 30
bullet_sprite = s_Bullet

//weapon_sprite = s_m1911
weapon_sprite = s_mp5
//weapon_sprite = s_spectre
//weapon_sprite = s_AK47cs
//weapon_sprite = s_AWP
//weapon_sprite = s_DSR50
//weapon_sprite = s_SquareGun

if weapon_sprite = s_m1911{
weapon_damage = 1
penetration = 1
base_recoil = 0.5
shoot_delay = 12
knockback = 0.2
}

if weapon_sprite = s_mp5{
weapon_damage = 0.8
penetration = 1
base_recoil = 2
shoot_delay = 5
knockback = 0.5
}

if weapon_sprite = s_spectre{
weapon_damage = 1
penetration = 1
base_recoil = 12
shoot_delay = 2
knockback = 1
}

if weapon_sprite = s_AK47cs{
weapon_damage = 10
penetration = 2
base_recoil = 24
shoot_delay = 9
knockback = 11
}


if weapon_sprite = s_AWP{
weapon_damage = 195
penetration = 1
base_recoil = 2
shoot_delay = 50
knockback = 3
}

if weapon_sprite = s_DSR50{
weapon_damage = 50
penetration = 10
base_recoil = 2
shoot_delay = 60
knockback = 8
}

if weapon_sprite = s_SquareGun{
weapon_damage = 1000
penetration = 1000
base_recoil = 0
shoot_delay = 60
knockback = 50
bullet_speed = 1
bullet_sprite = s_SquareGunBullet
}

set_tileset_collision()