if block = -1{
block = instance_create_depth(x,y,depth+1,Collision)
block.image_angle = image_angle
block.image_xscale = image_xscale
sprite_index = asset_get_index("s_WallF"+string(GM.floor_number))
block.sprite_index = sprite_index
}