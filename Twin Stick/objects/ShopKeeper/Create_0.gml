home_x = GM.map_x
home_y = GM.map_y
if array_contains(GM.map_visited,x_plus_y(home_x,home_y)){
instance_destroy();exit
}

items_in_shop = 3
if room = r_Treasure{items_in_shop = 1}
shop_item = []
vrp = 0
repeat(items_in_shop){
do{
var_item = array_get(GM.item_list,irandom_range(0,array_length(GM.item_list)-1))}
until(
array_contains(GM.items_bought,var_item) = false && array_contains(shop_item,var_item) = false
)
shop_item[vrp] = var_item


vrp += 1}