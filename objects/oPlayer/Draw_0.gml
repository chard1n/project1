draw_self();
if(holding != undefined) draw_sprite_ext(holding.sprite, sprite_frame, x + holding.options.x_offset * sign(image_xscale),y + holding.options.y_offset * sign(image_yscale), holding.options.x_scale,  holding.options.y_scale, holding.options.rotation, image_blend, 1);

draw_text(x,y - 50, isInsideLight);

draw_text(x,y - 70, sprite_playing_animation)

draw_text(x,y - 100, sprite_frame)
draw_text(x,y - 130, animation_step_delay)
