draw_self();
if(holding != undefined) draw_sprite_ext(holding.sprite, 0, x + holding.options.x_offset * sign(image_xscale),y + holding.options.y_offset * sign(image_yscale), holding.options.x_scale,  holding.options.y_scale, holding.options.rotation, image_blend, 1);

draw_text(x,y - 50, isInsideLight)