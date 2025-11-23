if GM.map_x != home_x or GM.map_y != home_y{sprite_index = 0;exit}else{sprite_index = s_ShopMarker}
vrp = 0
repeat(items_in_shop){
var_item = instance_create_depth((1280/(items_in_shop+1))*(vrp+1),336,depth,ShopItem)
var_item.sprite_index = shop_item_name[vrp]
vrp += 1
}