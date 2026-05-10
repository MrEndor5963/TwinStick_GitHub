if room = r_TitleScreen{
play_msc(msc_TitleScreen)
}

if instance_exists(Player){room_start = true;//game_set_speed(20,gamespeed_fps)
}

if instance_exists(Player) && room != r_FloorTransition{
	var_repeat = 0
	repeat (player_amount){
	var_player = array_get(player_list,var_repeat)
	if next_room = "Left"{
	var_player.x = room_width-160
	var_player.y = room_height/2
	}
	if next_room = "Right"{
	var_player.x = 160
	var_player.y = room_height/2
	}
	if next_room = "Up"{
	var_player.x = room_width/2
	var_player.y = room_height-160 - var_player.sprite_height
	}
	if next_room = "Down"{
	var_player.x = room_width/2
	var_player.y = var_player.sprite_height+160
	}
	var_player.can_control = true
	var_repeat += 1}
	next_room = -1

var_bg = layer_get_id("Background")
var_bg = layer_background_get_id(var_bg)
var_bg_sprite = asset_get_index("s_BackgroundF"+string(floor_number))
layer_background_change(var_bg,var_bg_sprite)

var_sprite = s_WallF1
if floor_number = 2{var_sprite = s_WallF2}
_width = sprite_get_width(var_sprite)
var_wall = instance_create_layer(0,0,"Walls",Collision)
var_wall.image_xscale = (room_width-128)/_width
var_wall.sprite_index = var_sprite

var_wall = instance_create_layer(0,room_height,"Walls",Collision)
var_wall.image_xscale = (room_height-128)/_width
var_wall.sprite_index = var_sprite
var_wall.image_angle = 90

var_wall = instance_create_layer(room_width,0,"Walls",Collision)
var_wall.image_xscale = (room_height-128)/_width
var_wall.sprite_index = var_sprite
var_wall.image_angle = -90

var_wall = instance_create_layer(room_width,room_height,"Walls",Collision)
var_wall.image_xscale = (room_width-128)/_width
var_wall.sprite_index = var_sprite
var_wall.image_angle = 180



var_offset = 32
if map_x < map_size-1 && ds_grid_get(map,map_x+1,map_y) != 0{
var_door = instance_create_layer(room_width-var_offset,room_height/2,"Walls",Door)
var_door.image_angle = 270;var_door.depth -= 1
}
if map_x > 0 && ds_grid_get(map,map_x-1,map_y) != 0{
var_door = instance_create_layer(var_offset,room_height/2,"Walls",Door)
var_door.image_angle = 90;var_door.depth -= 1

}

if map_y > 0 && ds_grid_get(map,map_x,map_y-1) != 0{
var_door = instance_create_layer(room_width/2,var_offset,"Walls",Door)
var_door.depth -= 1
}
if map_y < map_size-1 && ds_grid_get(map,map_x,map_y+1) != 0{
var_door = instance_create_layer(room_width/2,room_height-var_offset,"Walls",Door)
var_door.image_angle = 180
var_door.depth -= 1
}

instance_create_depth(0,0,depth,Shade)

}
time_in_room = 0