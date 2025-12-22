if spawned = false{
script_execute_item(sprite_index)
if item_is_free = true{cost = 0}
spawned = true
}

if sprite_index = s_item_Heart{
list_temp = ds_list_create() 
instance_place_list(x,y,[Player],list_temp,false)
higest_value = 0
vrp = 0
repeat(ds_list_size(list_temp)){
var_player = ds_list_find_value(list_temp,vrp)
higest_value = var_player.healthcare
}
cost = higest_value
ds_list_destroy(list_temp)

}
if array_contains(GM.items_bought,sprite_index) = true{instance_destroy()}