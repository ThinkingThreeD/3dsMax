struct Sphere_
(
	c, 
	r
)


-- intersect sphere to sphere
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

fn IsConvexQuad a b c d = 
(
	-- Example: IsConvexQuad (getvert $.mesh 1) (getvert $.mesh 2) (getvert $.mesh 3) (getvert $.mesh 4)
	
	bda = Cross (d - b) (a - b)
	bdc = Cross (d - b) (c - b)
	if Dot bda bdc >= 0.0f do return 0
	acd = Cross (c - a) (d - a)
	acb = Cross (c - a) (b - a)
	return Dot acd acb < 0.0f
)

fn barycentric a b c p =
(
	/* 	v1 = (getVert $Plane001.mesh (getFace $Plane001 1).x)*$Plane001.transform
	* 	v2 = (getVert $Plane001.mesh (getFace $Plane001 1).y)*$Plane001.transform
	* 	v3 = (getVert $Plane001.mesh (getFace $Plane001 1).z)*$Plane001.transform
	* 	thePoint = $Point001.pos
	* 	barycentric v1 v2 v3 thePoint
	*/
	
	v0 = b - a
	v1 = c - a 
	v2 = p - a
	d00 = Dot v0 v0
	d01 = Dot v0 v1
	d11 = Dot v1 v1
	d20 = Dot v2 v0
	d21 = Dot v2 v1
	denom = d00 * d11 - d01 * d01;
	v = (d11 * d20 - d01 * d21) / denom
	w = (d00 * d21 - d01 * d20) / denom
	u = 1.0 - v - w
	return [u,v,w]
)

fn pointInTriangle p a  b c = 
(
	/* v1 = (getVert $Plane001.mesh (getFace $Plane001 1).x)*$Plane001.transform
	* v2 = (getVert $Plane001.mesh (getFace $Plane001 1).y)*$Plane001.transform
	* v3 = (getVert $Plane001.mesh (getFace $Plane001 1).z)*$Plane001.transform
	* thePoint = $Point001.pos
	* TestPointTriangle  thePoint v1 v2 v3 
	*/

	uvw = BarycentricCoords a b c p 
	return uvw[2] >= 0.0 and uvw[3] >= 0.0 and (uvw[2] + uvw[2]) <= 1.0
)
