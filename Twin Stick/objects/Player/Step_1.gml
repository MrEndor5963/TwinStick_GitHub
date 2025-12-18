if spawned = false{
if player_name = "Hazel"{
weapon[0] = s_Taurus92
script_execute_wpn(weapon[0])
weapon_ammo_inmag[0] = ammo_inmag_max
weapon_ammo_reserve[0] = ammo_reserve_max
ammo_inmag = ammo_inmag_max
ammo_reserve = ammo_reserve_max
mov_spd = 10
strength = 1.5
draw_color = $00CC00
}

if player_name = "Justin"{
weapon[0] = s_Xiuhcoatl
script_execute_wpn(weapon[0])
weapon_ammo_inmag[0] = ammo_inmag_max
weapon_ammo_reserve[0] = ammo_reserve_max
ammo_inmag = ammo_inmag_max
ammo_reserve = ammo_reserve_max
mov_spd = 10
strength = 2
draw_color = c_aqua
}

if player_name = "Craig"{
hp = 12;hp_max = 12
weapon[0] = s_Remi870
script_execute_wpn(weapon[0])
weapon_ammo_inmag[0] = ammo_inmag_max
weapon_ammo_reserve[0] = ammo_reserve_max
ammo_inmag = ammo_inmag_max
ammo_reserve = ammo_reserve_max
mov_spd = 6
strength = 6
draw_color = $FF00A9
}

if player_name = "Nia"{
hp = 6;hp_max = 6
weapon[0] = s_VzSkorpion
script_execute_wpn(weapon[0])
weapon_ammo_inmag[0] = ammo_inmag_max
weapon_ammo_reserve[0] = ammo_reserve_max
ammo_inmag = ammo_inmag_max
ammo_reserve = ammo_reserve_max
mov_spd = 10
strength = 1.5
draw_color = $3B00FF
}

portrait_sprite = asset_get_index("s_"+string(player_name)+"Portrait")

spawned = true
}