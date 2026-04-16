if instance_exists(Player){room_start = true}

if instance_exists(Player){
if room != r_FloorTransition{
var_bg = layer_get_id("Background")
var_bg = layer_background_get_id(var_bg)
var_bg_sprite = asset_get_index("s_BackgroundF"+string(floor_number))
layer_background_change(var_bg,var_bg_sprite)
}

var lay_id = layer_get_id("TileMap");
var tile_id = layer_tilemap_get_id(lay_id);
var correct_tiles = asset_get_index("t_WallsF"+string(floor_number))
if (tilemap_get_tileset(tile_id) != correct_tiles){tilemap_tileset(tile_id, correct_tiles)}

}
time_in_room = 0

if room = r_FloorTransition{
var lay_id = layer_get_id("TileMap")
var map_id = layer_tilemap_get_id(lay_id)
tile_landlocked = tilemap_get(map_id,0,0)
tile_wall_left = tilemap_get(map_id,1,2)
tile_wall_right = tilemap_get(map_id,3,2)
tile_wall_up = tilemap_get(map_id,2,1)
tile_wall_down = tilemap_get(map_id,2,3)
}

if instance_exists(Player) && room != r_FloorTransition{
var lay_id = layer_get_id("TileMap")
var map_id = layer_tilemap_get_id(lay_id)

if map_x = 0 or ds_grid_get(map,map_x-1,map_y) = 0{
tilemap_set(map_id,tile_landlocked,0,4)
tilemap_set(map_id,tile_landlocked,0,5)
tilemap_set(map_id,tile_landlocked,0,6)
tilemap_set(map_id,tile_landlocked,0,7)
tilemap_set(map_id,tile_wall_right,1,4)
tilemap_set(map_id,tile_wall_right,1,5)
tilemap_set(map_id,tile_wall_right,1,6)
tilemap_set(map_id,tile_wall_right,1,7)
}

if map_x+1 = map_size or ds_grid_get(map,map_x+1,map_y) = 0{
tilemap_set(map_id,tile_landlocked,19,4)
tilemap_set(map_id,tile_landlocked,19,5)
tilemap_set(map_id,tile_landlocked,19,6)
tilemap_set(map_id,tile_landlocked,19,7)
tilemap_set(map_id,tile_wall_left,18,4)
tilemap_set(map_id,tile_wall_left,18,5)
tilemap_set(map_id,tile_wall_left,18,6)
tilemap_set(map_id,tile_wall_left,18,7)
}

if map_y = 0 or ds_grid_get(map,map_x,map_y-1) = 0{
tilemap_set(map_id,tile_landlocked,8,0)
tilemap_set(map_id,tile_landlocked,9,0)
tilemap_set(map_id,tile_landlocked,10,0)
tilemap_set(map_id,tile_landlocked,11,0)
tilemap_set(map_id,tile_wall_down,8,1)
tilemap_set(map_id,tile_wall_down,9,1)
tilemap_set(map_id,tile_wall_down,10,1)
tilemap_set(map_id,tile_wall_down,11,1)
}

if map_y+1 = map_size or ds_grid_get(map,map_x,map_y+1) = 0{
tilemap_set(map_id,tile_landlocked,8,11)
tilemap_set(map_id,tile_landlocked,9,11)
tilemap_set(map_id,tile_landlocked,10,11)
tilemap_set(map_id,tile_landlocked,11,11)
tilemap_set(map_id,tile_wall_up,8,10)
tilemap_set(map_id,tile_wall_up,9,10)
tilemap_set(map_id,tile_wall_up,10,10)
tilemap_set(map_id,tile_wall_up,11,10)
}


}