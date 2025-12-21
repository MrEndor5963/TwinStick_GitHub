if spawned = false{
if player_name = "Hazel"{
starting_weapon = s_Taurus92
mov_spd = 10
strength = 1.5
player_weight = 1.14
draw_color = $00CC00
}

if player_name = "Justin"{
starting_weapon = s_Xiuhcoatl
mov_spd = 10
strength = 2
player_weight = 1.29
draw_color = c_aqua
}

if player_name = "Craig"{
hp = 12;hp_max = 12
starting_weapon = s_Remi870
mov_spd = 6
strength = 6
player_weight = 2.85
draw_color = $FF00A9
}

if player_name = "Nia"{
	
hp = 6;hp_max = 6
starting_weapon = s_VzSkorpion
mov_spd = 8
strength = 1.5
player_weight = 1.23
draw_color = $3B00FF
}

portrait_sprite = asset_get_index("s_"+string(player_name)+"Portrait")
get_new_weapon(starting_weapon)
switch_to_weapon(array_length(weapon)-1)

spawned = true
}