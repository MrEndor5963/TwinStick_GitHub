set_tileset_collision()
image_xscale = 0
while !collision_present(x,y){image_xscale += 0.1;if image_xscale > room_width{exit}}
