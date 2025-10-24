if instance_number(Enemy) > 0{
if !instance_exists(door){
door = instance_create_depth(x,y,depth+1,Collision)
door.image_xscale = image_xscale
door.image_yscale = image_yscale}
}

if !instance_exists(Enemy){instance_destroy(door)}