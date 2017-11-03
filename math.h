
#include "point3.h"

float Clamp(float n, float min, float max) 
{
	if (n < min) return min;
	if (n > max) return max;
	return n;
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
