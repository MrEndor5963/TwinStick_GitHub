if spawned = false{
if player_name = "Hazel"{
hp = 4;hp_max = 4
starting_weapon = s_Taurus92
mov_spd = 12
strength = 2
player_weight = 1.14
//reload_speed = 1
healthcare = 0
draw_color = $00CC00
player_age = 21
}

if player_name = "Justin"{
hp = 6;hp_max = 6
starting_weapon = s_Xiuhcoatl
mov_spd = 12
strength = 4
player_weight = 1.29
//reload_speed = 0.75
healthcare = 500
draw_color = c_aqua
player_age = 19
}

if player_name = "Craig"{
hp = 15;hp_max = 15
starting_weapon = s_Remi870
mov_spd = 6
strength = 12
player_weight = 2.85
//reload_speed = 1.2
healthcare = 12000
draw_color = $FF00A9
player_age = 26
}

if player_name = "Nia"{	
hp = 10;hp_max = 10
starting_weapon = s_VzSkorpion
mov_spd = 7
strength = 3
player_weight = 1.23
//reload_speed = 1.5
healthcare = 4000
draw_color = $3B00FF
player_age = 23
}

if player_name = "Christos"{	
hp = 8;hp_max = 8
starting_weapon = s_mp5
mov_spd = 10
strength = 17
player_weight = 1.48
//reload_speed = 0.95
healthcare = 1500
draw_color = c_orange
player_age = 29
}

portrait_sprite = asset_get_index("s_"+string(player_name)+"Portrait")
get_new_weapon(starting_weapon)
switch_to_weapon(array_length(weapon)-1)

spawned = true
}