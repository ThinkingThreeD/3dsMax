struct Sphere_
(
	c, 
	r
)



fn intersect a b =
(
	if (classof a) == Sphere_ and (classof b) == Sphere_ do
	(
		d = a.c - b.c
		dist2 = dot d d
		radiusSum = a.r + b.r
		return dist2 <= radiusSum * radiusSum
	)
	return undefined
)

fn testSphereIntersect =
(
	a = Sphere_ c:$Sphere001.pos r:$Sphere001.radius
	b = Sphere_ c:$Sphere002.pos r:$Sphere002.radius
	return intersect a b
)

testSphereIntersect()
