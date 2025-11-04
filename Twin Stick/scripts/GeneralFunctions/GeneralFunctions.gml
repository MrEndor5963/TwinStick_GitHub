function draw_set_aligns(arg_halign,arg_valign){
draw_set_halign(arg_halign);draw_set_valign(arg_valign)
}

function set_tileset_collision(){
tiles = layer_tilemap_get_id("TileMap")
}

function collision_present(x_place,y_place){
if place_meeting(x_place,y_place,[Collision,tiles]){return true}
return false
}