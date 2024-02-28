shown = true;
selected_slot = 0;

total_slots = 9;
padding = 10;
box_padding = 10;
selected_slot_yoffset = -3;
selected_slot_padding = 5;
box_size = 64;
bgd_color = #A3620A;
selected_bgd_color = #331E02;

height = 64;
width = total_slots * (box_padding + box_size);

x_offset = ( view_wport / 2 ) - ( (width + padding) / 2 );
y_offset = view_hport - height - padding;