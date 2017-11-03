
#include "point3.h"

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

void BarycentricCoords(Point3 a, Point3 b, Point3 c, Point3 p, float &u, float &v, float &w)
{
	file:///C:/Users/Cyrill/Downloads/Real-Time%20Collision%20Detection.pdf

	Point3 v0 = b - a, v1 = c - a, v2 = p - a;
	float d00 = DotProd(v0, v0);
	float d01 = DotProd(v0, v1);
	float d11 = DotProd(v1, v1);
	float d20 = DotProd(v2, v0);
	float d21 = DotProd(v2, v1);
	float denom = d00 * d11 - d01 * d01;
	v = (d11 * d20 - d01 * d21) / denom;
	w = (d00 * d21 - d01 * d20) / denom;
	u = 1.0f - v - w;
}

int IsConvexQuad(Point3 a, Point3 b, Point3 c, Point3 d)
{
	// Quad is nonconvex if Dot(Cross(bd, ba), Cross(bd, bc)) >= 0
	Point3 bda = CrossProd(d - b, a - b);
	Point3 bdc = CrossProd(d - b, c - b);
	if (DotProd(bda, bdc) >= 0.0f) return 0;
	// Quad is now convex iff Dot(Cross(ac, ad), Cross(ac, ab)) < 0
	Point3 acd = CrossProd(c - a, d - a);
	Point3 acb = CrossProd(c - a, b - a);
	return DotProd(acd, acb) < 0.0f;
}


int TestPointTriangle(Point3 p, Point3 a, Point3 b, Point3 c)
{
	float u, v, w;
	BarycentricCoords(a, b, c, p, u, v, w);
	return v >= 0.0f && w >= 0.0f && (v + w) <= 1.0f;
}

