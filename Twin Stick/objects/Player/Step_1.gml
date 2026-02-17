if spawned = false{
if player_name = "Hazel"{
hp = 4;hp_max = 4
starting_weapon = s_Taurus92
money = 600
mov_spd = 12
strength = 3
player_weight = 1.14
//reload_speed = 1
healthcare = 0
draw_color = $00CC00
player_age = 20
}

if player_name = "Justin"{
hp = 6;hp_max = 6
starting_weapon = s_m1911
money = 12
mov_spd = 12
strength = 5
player_weight = 1.25
//reload_speed = 0.75
healthcare = 2000
draw_color = c_aqua
player_age = 17
}

if player_name = "Craig"{
hp = 15;hp_max = 15
starting_weapon = s_m1911
money = 400
mov_spd = 6
strength = 17
player_weight = 2.85
//reload_speed = 1.2
healthcare = 195000
draw_color = $FF00A9
player_age = 26
}

if player_name = "Nia"{	
hp = 8;hp_max = 8
starting_weapon = s_VzSkorpion
money = 6500
mov_spd = 7
strength = 4
player_weight = 1.23
//reload_speed = 1.5
healthcare = 250
draw_color = $3B00FF
player_age = 23
}

if player_name = "Christos"{	
hp = 8;hp_max = 8
starting_weapon = s_mp5
money = 2000
mov_spd = 10
strength = 11
player_weight = 1.48
//reload_speed = 0.95
healthcare = 3000
draw_color = c_orange
player_age = 29
}

if player_name = "Muhammad"{
hp = 4;hp_max = 4
starting_weapon = s_mp5
money = 12890000000
mov_spd = 6
strength = 3.5
player_weight = 1.48
//reload_speed = 0.95
healthcare = 0
draw_color = c_red
player_age = 86
//As for the thief male or female, cut off the hands of both. This is a recompense for what they have done,
}

portrait_sprite = asset_get_index("s_"+string(player_name)+"Portrait")
get_new_weapon(starting_weapon)
switch_to_weapon(array_length(weapon)-1)

spawned = true
}