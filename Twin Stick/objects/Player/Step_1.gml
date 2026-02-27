if spawned = false{
if player_name = "Hazel"{
country = "Brazil"
hp = 4;hp_max = 4
starting_weapon = s_Taurus92
money = 600
mov_spd = 12
strength = 3
player_weight = 1.14
//reload_speed = 1
healthcare = 0//Heals everyone except craig
draw_color = $00CC00
//favorite_gun = s_SMT9
player_age = 20
futbol_skill = 320
liquor_tolorance = 0.03
gambling_degeneracy = 4
}

if player_name = "Justin"{
country = "Mexico"
hp = 6;hp_max = 6
starting_weapon = s_m1911
money = 12
mov_spd = 12
strength = 5
player_weight = 1.25
//reload_speed = 0.75
healthcare = 2000//Heals everyone except Craig
draw_color = c_aqua
favorite_gun = s_Xiuhcoatl//Cartel Killer
player_age = 17
futbol_skill = 230
liquor_tolorance = 0.045
gambling_degeneracy = 8
}

if player_name = "Craig"{
country = "USA"
hp = 15;hp_max = 15
starting_weapon = s_m1911
money = 400
mov_spd = 7
strength = 17
player_weight = 2.85
//reload_speed = 1.2
healthcare = 195000//Will not get healthcare in co-op modes when someone else buys it
draw_color = $FF00A9
favorite_gun = s_Thompson//Chicago Typewriter
player_age = 26
futbol_skill = 60
liquor_tolorance = 0.32
gambling_degeneracy = 18
}

if player_name = "Nia"{
country = "Canada"//Maybe switch to poland or something else
hp = 8;hp_max = 8
starting_weapon = s_CZ75Auto
money = 6500
mov_spd = 7
strength = 4
player_weight = 1.23
//reload_speed = 1.5
healthcare = 3000//Heals everyone except Craig
draw_color = $3B00FF
player_age = 23
futbol_skill = 15
liquor_tolorance = 0.07
gambling_degeneracy = 6
}

if player_name = "Christos"{	
country = "Spain"
hp = 8;hp_max = 8
starting_weapon = s_mp5
money = 2000
mov_spd = 10
strength = 11
player_weight = 1.48
//reload_speed = 0.95
healthcare = 3000//Heals everyone except Craig
draw_color = c_orange
player_age = 29
futbol_skill = 135
liquor_tolorance = 0.06
gambling_degeneracy = 14
}
/*
if player_name = "Muhammad"{
country = "Saudi Arabia"	
hp = 4;hp_max = 4
starting_weapon = s_mp5
money = 12890000000
mov_spd = 6
strength = 2.5
player_weight = 1.48
//reload_speed = 0.95
healthcare = 0//Only heals himself
draw_color = c_red
player_age = 86
futbol_skill = 30
liquor_tolorance = 0.0//Drinking is harem
gambling_degeneracy = 0//Gambling is harem
//As for the thief male or female, cut off the hands of both. This is a recompense for what they have done,
//Can't take any found/free items
}

if player_name = "Jiayi"{
country = "China"
hp = 5;hp_max = 5
starting_weapon = s_mp5
money = 888
mov_spd = 8
strength = 3
player_weight = 1.02
//reload_speed = 0.95
healthcare = 0
draw_color = c_red
player_age = 26
futbol_skill = 85
liquor_tolorance = 0.05
gambling_degeneracy = 99999
//Casinos spawn on every floor, rigged odds, kicked out of casino after too many wins
//Can only make money by gambling
//Abnormally lucky
}

if player_name = "Talya"{
country = "Russia"
hp = 7;hp_max = 7
starting_weapon = s_mp5
money = 340
mov_spd = 8
strength = 4.5
player_weight = 1.33
//reload_speed = 0.95
healthcare = 0
draw_color = c_red
//favorite_gun = s_SVDDragnov
player_age = 19
futbol_skill = 70
liquor_tolorance = 0.12
gambling_degeneracy = 15
}
*/


portrait_sprite = asset_get_index("s_"+string(player_name)+"Portrait")
if give_all_weapons = true{weapon_slots += 1;weapon_number = weapon_slots}
get_new_weapon(starting_weapon)
switch_to_weapon(array_length(weapon)-1)

spawned = true
}