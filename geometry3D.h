
struct Sphere
{
	Point3 c; 
	float r;
};

int intersects(Sphere a, Sphere b)
{
	// Calculate squared distance between centers
	Point3 d = a.c - b.c;
	float dist2 = DotProd(d, d);
	// Spheres intersect if squared distance is less than squared sum of radii
	float radiusSum = a.r + b.r;
	return dist2 <= radiusSum * radiusSum;
}
