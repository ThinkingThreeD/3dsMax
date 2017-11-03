
fn Clamp n _min _max =
(
	if (n < _min) do return _min
	if (n > _max) do return _max
	return n
)


