steps += 1

if(steps > 4){
	visible = true
}

var _dist = sqrt(sqr(x - player.x) + sqr(y - player.y))
if(_dist < closest_point)
{
	closest_point = _dist
}







