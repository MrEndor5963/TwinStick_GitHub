if room_start = true && game_mode != "Versus"{
set_tileset_collision()
if instance_exists(Player){

if !array_contains(visited_rooms,x_plus_y(map_x,map_y)){
array_push(visited_rooms,x_plus_y(map_x,map_y))


vrp = 0;
repeat(array_length(player_list)){
var_player = player_list[vrp]
if var_player.weapon_sprite != s_SquareGun && var_player.melee_equipped = false{
var_player.ammo_reserve += var_player.bullets_per_new_room}
vrp += 1
}


}


}


sprite_index = s_BlackPixel
ds_grid_clear(global.collision_grid,0)
var_xx = 0
repeat(ds_grid_width(global.collision_grid)){
x = var_xx*48
var_yy = 0
repeat(ds_grid_height(global.collision_grid)){
y = var_yy*48
if collision_present(x,y){ds_grid_set(global.collision_grid,var_xx,var_yy,1)}
var_yy += 1}
var_xx += 1}
sprite_index = s_0

room_start = false}