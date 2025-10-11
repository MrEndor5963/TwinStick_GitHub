hsp = 0;vsp = 0
hsp_knockback = 0;vsp_knockback = 0
mov_spd = 5
hp = 3
hit_stun = 0
kills = 0
shoot_timer = 0

auto = true;recoil_cooldown = 0

aim_object = 0//instance_create_depth(x,y,depth,PlayerAim)

//weapon_sprite = s_m1911
//weapon_sprite = s_mp5
weapon_sprite = s_AK47
//weapon_sprite = s_AWP
//weapon_sprite = s_DSR50

if weapon_sprite = s_m1911{
ammo = 960
weapon_damage = 1
penetration = 1
base_recoil = 0.5
shoot_delay = 12
knockback = 0.2
}

if weapon_sprite = s_mp5{
ammo = 960
weapon_damage = 1
penetration = 1
base_recoil = 2
shoot_delay = 4
knockback = 0.5
}

if weapon_sprite = s_AK47{
ammo = 35
weapon_damage = 10
penetration = 2
base_recoil = 15
shoot_delay = 9
knockback = 3
}


if weapon_sprite = s_AWP{
ammo = 35
weapon_damage = 195
penetration = 1
base_recoil = 2
shoot_delay = 50
knockback = 3
}

if weapon_sprite = s_DSR50{
ammo = 35
weapon_damage = 50
penetration = 10
base_recoil = 2
shoot_delay = 60
knockback = 8
}

set_tileset_collision()