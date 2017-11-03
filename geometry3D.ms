struct Sphere_
(
	c, 
	r
)

fn intersect a b =
(
	d = a.c - b.c;
	dist2 = dot d d
	radiusSum = a.r + b.r;
	dist2 <= radiusSum * radiusSum;
)

fn testSphereIntersect =
(
	a = Sphere_ c:$Sphere001.pos r:$Sphere001.radius
	b = Sphere_ c:$Sphere002.pos r:$Sphere002.radius
	return intersect a b
)
