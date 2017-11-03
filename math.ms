
fn Clamp n _min _max =
(
	if (n < _min) do return _min
	if (n > _max) do return _max
	return n
)

fn IsConvexQuad a b c d = 
(
	bda = Cross (d - b) (a - b)
	bdc = Cross (d - b) (c - b)
	if Dot bda bdc >= 0.0f do return 0
	acd = Cross (c - a) (d - a)
	acb = Cross (c - a) (b - a)
	return Dot acd acb < 0.0f
)

