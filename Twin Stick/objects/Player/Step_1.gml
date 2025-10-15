ammo = 960
weapon_damage = 1
penetration = 1
base_recoil = 0.5
shoot_delay = 12
knockback = 0.2
bullet_speed = 30
bullet_sprite = s_Bullet

weapon_sprite = array_get(weapon_list,weapon_number)
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
knockback = 6
}

if weapon_sprite = s_AWP{
weapon_damage = 195
penetration = 2
base_recoil = 2
shoot_delay = 50
knockback = 3
}

if weapon_sprite = s_DSR50{
weapon_damage = 50
penetration = 10
base_recoil = 2
shoot_delay = 60
knockback = 12
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