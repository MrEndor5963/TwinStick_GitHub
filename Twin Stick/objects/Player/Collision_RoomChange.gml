next_room = other.next_room

var_repeat = 0
repeat (GM.player_amount){
var_player = array_get(GM.player_list,var_repeat)
if next_room = "Left"{
var_player.x = room_width-(sprite_width*2)
var_player.y = other.y
}
if next_room = "Right"{
var_player.x = (sprite_width*2)
var_player.y = other.y
}
if next_room = "Up"{
var_player.x = other.x
var_player.y = room_height-(sprite_height*2)
}
if next_room = "Down"{
var_player.x = other.x
var_player.y = (sprite_height*2)
}

var_repeat += 1}

if next_room = "Left"{next_room = ds_grid_get(GM.map,GM.map_x-1,GM.map_y);GM.map_x -= 1}
if next_room = "Right"{next_room = ds_grid_get(GM.map,GM.map_x+1,GM.map_y);GM.map_x += 1}
if next_room = "Up"{next_room = ds_grid_get(GM.map,GM.map_x,GM.map_y-1);GM.map_y-=1}
if next_room = "Down"{next_room = ds_grid_get(GM.map,GM.map_x,GM.map_y+1);GM.map_y+=1}
room_goto(next_room)
