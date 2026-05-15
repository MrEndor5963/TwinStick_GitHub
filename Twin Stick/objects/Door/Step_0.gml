if instance_exists(Enemy){
if door_closedness < 1{door_closedness += 0.05};sprite_index = s_DoorBlackspace}
else{
if door_closedness > 0{door_closedness -= 0.05;sprite_index = s_DoorBlackspace}
if door_closedness = 0{sprite_index = s_DoorOpen}
}

if place_meeting(x+x_offset,y+y_offset,Player) && sprite_index = s_DoorOpen{
Player.next_room = next_room
GM.next_room = next_room
}