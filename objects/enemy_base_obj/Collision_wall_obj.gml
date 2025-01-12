/// @description Insert description here
// You can write your code in this editor

var _xdiff = x - other.x
var _ydiff = y - other.y
	 
var _totaldiff = (abs(_xdiff) + abs(_ydiff))

x += (_xdiff / _totaldiff) * 6
y += (_ydiff / _totaldiff) * 6

direction = point_direction(x, y, other.x, other.y) - 180
speed = 6











