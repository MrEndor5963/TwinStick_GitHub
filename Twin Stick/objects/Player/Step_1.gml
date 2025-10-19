ammo = 960
weapon_damage = 1
penetration = 1
base_recoil = 0.5
shoot_delay = 12
knockback = 2
bullet_speed = 60
bullet_sprite = s_Bullet

weapon_sprite = array_get(weapon_list,weapon_number)

if weapon_sprite = s_m1911{
weapon_damage = 1
penetration = 1
base_recoil = 1
shoot_delay = 12
knockback = 2
}

if weapon_sprite = s_mp5{
weapon_damage = 1
penetration = 1
base_recoil = 2
shoot_delay = 5
knockback = 2
}

if weapon_sprite = s_spectre{
weapon_damage = 1
penetration = 1
base_recoil = 15
shoot_delay = 2
knockback = 3
}

if weapon_sprite = s_AK47cs{
weapon_damage = 3
penetration = 2
base_recoil = 24
shoot_delay = 9
knockback = 14
}

if weapon_sprite = s_AWP{
weapon_damage = 195
penetration = 2
base_recoil = 2
shoot_delay = 50
knockback = 16
}

if weapon_sprite = s_DSR50{
weapon_damage = 50
penetration = 10
base_recoil = 2
shoot_delay = 60
knockback = 32
}

if weapon_sprite = s_SquareGun{
weapon_damage = 1000
penetration = 1000
base_recoil = 0
shoot_delay = 60
knockback = 100
bullet_speed = 1
bullet_sprite = s_SquareGunBullet
}