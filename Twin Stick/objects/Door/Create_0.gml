x_offset = 0;y_offset = 0
if x < room_width/2{next_room = "Left";x_offset = -48}
if x > room_width/2{next_room = "Right";x_offset = 48}
if y < room_height/2{next_room = "Up";y_offset = -48}
if y > room_height/2{next_room = "Down";y_offset = 48}