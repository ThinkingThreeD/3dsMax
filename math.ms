
fn Clamp n _min _max =
(
	if (n < _min) do return _min
	if (n > _max) do return _max
	return n
)

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

int TestPointTriangle(Point3 p, Point3 a, Point3 b, Point3 c)
{
	float u, v, w;
	BarycentricCoords(a, b, c, p, u, v, w);
	return v >= 0.0f && w >= 0.0f && (v + w) <= 1.0f;
}

