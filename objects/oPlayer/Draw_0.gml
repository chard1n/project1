if(isHurt) {
	shader_set(shdFlashRed);
}

draw_self();
if(holding != undefined) draw_sprite_ext(holding.options.sprite, sprite_frame, x + holding.options.x_offset * sign(image_xscale),y + holding.options.y_offset * sign(image_yscale), holding.options.x_scale * sign(image_xscale),  holding.options.y_scale, holding.options.rotation, image_blend, 1);

shader_reset();