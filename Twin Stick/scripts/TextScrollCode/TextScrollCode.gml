function create_text_scroll_variables(){
text_sound = sfx_mp5Shoot
sleep = 0
type_speed = 1

padding = 8
width = 600
height = 400

text_font = f_Main
text_color = c_white
text_speed = 5

text_width = width - padding*2

text = ""
text_progress = 0
text_length = 0
char = 0
}

function type(x, y, arg_text, progress, width){
	text = arg_text
	draw_x = 0;
	draw_y = 0;
	
	if text_speed = 1{text_progress = round(text_progress)}
	if sleep > 0{sleep -= 1}
	if text_progress != text_length && sleep = 0 && text_progress % 1 == 0{play_sfx(text_sound);sleep = 4}
	
	for (var i = 1; i <= progress; i+=1) {
		 char = string_char_at(text, i);
		 //if char = "." or char = "?" or char = ","{text_speed = 0.1}else{text_speed = 1}
	
		// Handle normal line breaks
		if (char == "\n") {
			draw_x = 0;
			draw_y += string_height("A");
		}
		// If we're starting a new word, we can line break
		else if (char == " ") {
			draw_x += string_width(char);
			
			word_width = 0;
			for (var ii = i + type_speed; ii <= string_length(text); ii++) {
				 word_char = string_char_at(text, round(ii));
				
				// If we reached the end of the word, stop checking
				if (word_char == "\n" || word_char == " "){break}
				
				// If the current word extends past the width boundary,
				// then move it to the next line
				word_width += string_width(word_char);
				if (draw_x + word_width > width) {
					draw_x = 0;
					draw_y += string_height("A")*1.2;
					break;
				}
			}
		}
		else {
			// Draw the letter
			draw_text(x + draw_x, y + draw_y, char);
			draw_x += string_width(char);
		}
	}
	
}