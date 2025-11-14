if block = -22{
block = instance_create_depth(x,y,depth+1,Collision)
block.image_xscale = image_xscale
block.image_yscale = image_yscale}

if !instance_exists(Enemy){
if place_meeting(x,y,Key){
instance_destroy(Key)
instance_destroy(block)
instance_destroy()
}
	
}

image_xscale += 0.2;image_yscale += 0.2
if place_meeting(x,y,Player){display_text = true}else{display_text = false}
image_xscale -= 0.2;image_yscale -= 0.2