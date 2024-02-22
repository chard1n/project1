
vertMove = keyboard_check(ord("S")) - keyboard_check(ord("W"))
horzMove = keyboard_check(ord("D")) - keyboard_check(ord("A"))

y = y + (vertMove * spd)
x = x + (horzMove * spd)