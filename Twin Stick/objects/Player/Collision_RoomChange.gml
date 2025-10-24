next_room = other.next_room

if next_room = "Left"{x = room_width-(sprite_width*2)}
if next_room = "Right"{x = (sprite_width*2)}
if next_room = "Up"{y = room_height-(sprite_height*2)}
if next_room = "Down"{y = (sprite_height*2)}

if next_room = "Left"{next_room = ds_grid_get(GM.map,GM.map_x-1,GM.map_y);GM.map_x -= 1}
if next_room = "Right"{next_room = ds_grid_get(GM.map,GM.map_x+1,GM.map_y);GM.map_x += 1}
if next_room = "Up"{next_room = ds_grid_get(GM.map,GM.map_x,GM.map_y-1);GM.map_y-=1}
if next_room = "Down"{next_room = ds_grid_get(GM.map,GM.map_x,GM.map_y+1);GM.map_y+=1}
room_goto(next_room)
