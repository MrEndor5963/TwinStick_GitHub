if spawned = false{
if player_name = "Hazel"{
starting_weapon = s_Taurus92
mov_spd = 10
strength = 1.5
draw_color = $00CC00
}

if player_name = "Justin"{
starting_weapon = s_Xiuhcoatl
mov_spd = 10
strength = 2
draw_color = c_aqua
}

if player_name = "Craig"{
hp = 12;hp_max = 12
weapon[0] = s_Remi870
starting_weapon = s_Remi870
mov_spd = 6
strength = 6
draw_color = $FF00A9
}

if player_name = "Nia"{
hp = 6;hp_max = 6
starting_weapon = s_VzSkorpion
mov_spd = 10
strength = 1.5
draw_color = $3B00FF
}

portrait_sprite = asset_get_index("s_"+string(player_name)+"Portrait")
get_new_weapon(starting_weapon,0)
switch_to_weapon(0)

spawned = true
}