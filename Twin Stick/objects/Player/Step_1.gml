if spawned = false{
if player_name = "Hazel"{
weapon_slot[0] = 0
weapon_slot[1] = s_Taurus92
script_execute_wpn(weapon_slot[1])
weapon_slot_ammo_inmag[1] = ammo_inmag_max
weapon_slot_ammo_reserve[1] = ammo_reserve_max
ammo_inmag = ammo_inmag_max
ammo_reserve = ammo_reserve_max
}

if player_name = "Justin"{
weapon_slot[0] = 0
weapon_slot[1] = s_Xiuhcoatl
script_execute_wpn(weapon_slot[1])
weapon_slot_ammo_inmag[1] = ammo_inmag_max
weapon_slot_ammo_reserve[1] = ammo_reserve_max
ammo_inmag = ammo_inmag_max
ammo_reserve = ammo_reserve_max
}
}
spawned = true