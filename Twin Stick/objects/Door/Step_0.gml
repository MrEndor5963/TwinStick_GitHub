if instance_exists(Enemy){
if door_closedness < 1{door_closedness += 0.05}}
else{
if door_closedness > 0{door_closedness -= 0.05}
if door_closedness = 0{sprite_index = s_DoorOpen}
}

if place_meeting(x+x_offset,y+y_offset,Player) && sprite_index = s_DoorOpen{
GM.next_room = next_room
}