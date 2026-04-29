if GM.map_x != home_x or GM.map_y != home_y{exit}
if z < 0{
var_scale = 1//clamp(-z/50,0.8,1.2)
draw_sprite_ext(sprite_index,image_index,x,floor_y,image_xscale*var_scale,image_yscale*var_scale,image_angle,c_black,0.5)
}
draw_self()
/*
draw_text(x,y,x)
draw_text(x,y+30,y)
draw_text(x,y+60,z)