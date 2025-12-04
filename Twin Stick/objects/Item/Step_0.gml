if spawned = false{
script_execute_item(sprite_index)
if item_is_free = true{cost = 0}
spawned = true
}
if array_contains(GM.items_bought,sprite_index) = true{instance_destroy()}