if instance_exists(Enemy){sprite_index = s_DoorClosed}
else{sprite_index = s_DoorOpen}

if place_meeting(x+x_offset,y+y_offset,Player) && sprite_index = s_DoorOpen{
GM.next_room = next_room
}