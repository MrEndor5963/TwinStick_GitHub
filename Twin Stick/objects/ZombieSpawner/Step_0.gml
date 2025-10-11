timer -= 1

if timer < 0{timer = 140;instance_create_depth(x,y,depth,Zombie)}
/*if timer < 0{timer = 140}
if timer = 15{
instance_create_depth(0+irandom_range(0,room_width),-20,depth+1,Zombie)
}
if timer = 2{
instance_create_depth(0+irandom_range(0,room_width),room_height+20,depth+1,Zombie)
}
if timer = 39{
instance_create_depth(-20,0+irandom_range(0,room_height),depth+1,Zombie)
}
if timer = 59{
instance_create_depth(room_width+20,0+irandom_range(0,room_height),depth+1,Zombie)
}