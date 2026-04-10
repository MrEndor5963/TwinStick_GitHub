timer -= 1
if timer <0 or instance_number(Enemy) = 0{
set_image_scale(image_xscale-0.02)	
if image_xscale = 0{instance_destroy()}
}