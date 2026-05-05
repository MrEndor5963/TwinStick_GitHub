function script_execute_character(arg_player_name){
player_name = arg_player_name
script_execute(asset_get_index("character_"+string(arg_player_name)))
portrait_sprite = asset_get_index("s_"+string(player_name)+"Portrait")
if give_all_weapons = true{weapon_slots_max += 1;weapon_equipped = weapon_slots_max}
get_new_weapon(starting_weapon)
switch_to_weapon(array_length(weapons_held)-1)

}

function reference_characters(){
reference_characters()
character_Hazel()
character_Justin()
character_Craig()
character_Nia()
character_Christos()
}

function character_Hazel(){
country = "Brazil"
hp = 4;hp_max = 4
starting_weapon = s_Ithaca //Taurus92
money = 1000
mov_spd = 12
strength = 3
weight = 1.14
//reload_speed = 1
healthcare = 0//Heals everyone except craig
draw_color = $00CC00
//favorite_gun = s_SMT9
//Ex occupation - Unemployed
/*
Subject was picked up outside São Paulo Guarulhos Airport at 7:09AM with a flight booked for Portugal
Subject asked no questions while being apprehended and was "oddly calm" about the situation.
Subject remained highly cooperative until mauling the head off a technician at the local teleportaion hub
when being escorted to the CADE facility
*/
player_age = 20
futbol_skill = 320
liquor_tolorance = 0.03
gambling_degeneracy = 4
}

function character_Justin(){
country = "Mexico"
hp = 5;hp_max = 5
starting_weapon = s_m1911
money = 12
mov_spd = 12
strength = 5
weight = 1.25
//reload_speed = 0.75
healthcare = 1200//Heals everyone except Craig
draw_color = c_aqua
favorite_gun = s_Xiuhcoatl//Cartel Killer
//Ex occupation - Student
/*
Subject was detained at a shopping mall after a 3 day pursuit by a team of two Special Operatives.
Subject then negotiated the operatives to take him out the eat at a local restaurant and then go to
an assosiates birthday party with subject before officially going into CADE custody
*/
player_age = 17
futbol_skill = 230
liquor_tolorance = 0.045
gambling_degeneracy = 8
}

function character_Craig(){
country = "USA"
hp = 15;hp_max = 15
starting_weapon = s_m1911
money = 420
mov_spd = 7
strength = 17
weight = 2.85
//reload_speed = 1.2
healthcare = 195000//Will not get healthcare in co-op modes when someone else buys it
draw_color = $FF00A9
favorite_gun = s_Thompson//Chicago Typewriter
//Ex occupation - Dish Washer
/*
Subject was shot 17 times in a shootout in downtown Chicago before subject willfully dropped fire arm, calmy walked
towards opperatives and said "take me to area 51 and fix my shit" reguarding subjects host's
multiple gunshot wounds
*/
player_age = 26
futbol_skill = 60
liquor_tolorance = 0.32
gambling_degeneracy = 12
}

function character_Nia(){
country = "Canada"
hp = 8;hp_max = 8
starting_weapon = s_P320
money = 6800
mov_spd = 7
strength = 4
weight = 1.23
//reload_speed = 1.5
healthcare = 3500//Heals everyone except Craig
draw_color = $3B00FF
//Ex occupation - Online Artist
/*
Subject was aprehended in their apartment at 1:18 PM on a Tuesday.
According to both opperatives present, subject kept making sexual remarks and overall
"needs to go outside more".


When opperatives gave subject a compliance notice, the Subject's host, of her own will, told
operatives she would kill herself she and "lil demon" (subject) were seperated.
Roughly 4 minutes of negotiating ended with one of the opperatives knocking subjects host unconsious
*/
player_age = 23
futbol_skill = 15
liquor_tolorance = 0.07
gambling_degeneracy = 6
}

function character_Christos(){	
country = "Spain"
hp = 8;hp_max = 8
starting_weapon = s_P320
money = 2000
mov_spd = 10
strength = 11
weight = 1.48
//reload_speed = 0.95
healthcare = 3000//Heals everyone except Craig
draw_color = c_orange
player_age = 29
//Ex occupation - Bartender
/*
Subject was
*/
futbol_skill = 135
liquor_tolorance = 0.06
gambling_degeneracy = 14
}
/*
if player_name = "Muhammad"{
country = "Saudi Arabia"	
hp = 4;hp_max = 4
starting_weapon = s_mp5
money = 2290000000
mov_spd = 6
strength = 2.5
weight = 1.48
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
weight = 1.02
//reload_speed = 0.95
healthcare = 1000
draw_color = c_red
player_age = 26
futbol_skill = 85
liquor_tolorance = 0.05
gambling_degeneracy = 99999
//Ex Occupation - Gambler and Card dealer
Subject was detained at an underground poker game after an off duty opperative called for backup
upon identifying subject's alien nature.

//Casinos spawn on every floor, rigged odds, kicked out of casino after too many wins
//Can only make money by gambling
//Abnormally lucky
}

if player_name = "Talya"{
country = "Russia"
hp = 7;hp_max = 7
starting_weapon = s_mp5
money = 400
mov_spd = 8
strength = 4.5
weight = 1.33
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