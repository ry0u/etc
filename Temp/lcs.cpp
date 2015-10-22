#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
#include <cmath>

#define REP(i,k,n) for(int i=k;i<n;i++)
#define rep(i,n) for(int i=0;i<n;i++)
#define EPS 1e-8
#define equals(a,b) fabs((a) - (b)) < EPS

using namespace std;

struct edge
{
	int from,to;
	int cost;

	edge(int t,int c) : to(t),cost(c) {}
	edge(int f,int t,int c) : from(f),to(t),cost(c) {}

	bool operator<(const edge &e) const
	{
		return cost < e.cost;
	}
};	

struct UnionFind
{
	vector<int> par,rank;
	int N;

	UnionFind(int n)
	{
		N = n;
		par.resize(n);
		rank.resize(n);

		rep(i,n)
		{
			par[i] = i;
			rank[i] = 0;
		}
	}

	int find(int x)
	{
		if(par[x] == x) return x;
		else return par[x] = find(par[x]);
	}

	void unite(int x,int y)
	{
		x = find(x);
		y = find(y);

		if(x == y) return;

		if(rank[x] < rank[y])
		{
			par[x] = y;
		}
		else
		{
			par[y] = x;
			if(rank[x] == rank[y]) rank[x]++;
		}
	}

	bool same(int x,int y)
	{
		return find(x) == find(y);
	}

	int size()
	{
		int cnt = 0;
		rep(i,N) if(find(i) == i) cnt++;

		return cnt;
	}

};

int kruskal(int n,vector<edge> v)
{
	sort(v.begin(),v.end());
	UnionFind uf(n);
	
	int ret = 0;
	rep(i,v.size())
	{
		edge e = v[i];
		if(!uf.same(e.from,e.to))
		{
			uf.unite(e.from,e.to);
			ret += e.cost;
		}
	}

	return ret;
}

struct Point
{
	double x, y;

	Point(double x=0, double y=0) : x(x), y(y) {}

	Point operator+(const Point &o) const { return Point(x+o.x, y+o.y); }

	Point operator-(const Point &o) const { return Point(x-o.x, y-o.y); }

	Point operator*(const double m) const { return Point(x*m, y*m); }

	Point operator/(const double d) const { return Point(x/d, y/d); }

	Point operator<(const Point &o) const { return x != o.x ? x < o.x : y < o.y; }

	bool operator==(const Point &o) const { return fabs(x-o.x) < EPS && fabs(y-o.y) < EPS; }

	double cross(const Point &o) const { return x * o.y - y * o.x; }

	double dot(const Point &o) const { return x * o.x + y * o.y; }

	double atan() const { return atan2(y, x); }

	double norm() const { return sqrt(dot(*this)); }

	double distance(const Point &o) const { return (o - (*this)).norm(); }

	double area(const Point &a,const Point &b)
	{
		Point p = a - (*this), p2 = b - (*this); 
		return p.cross(p2);
	}

	double area_abs(const Point &a,const Point &b) const
	{
		Point p = a - (*this), p2 = b - (*this);
		return fabs(p.cross(p2)) / 2.0;
	}	

	//線分abが自身に含まれているのかどうか判断する
	int between(const Point &a,const Point &b)
	{
		if(area(a,b) != 0) return 0;

		if(a.x != b.x)
		{
			return ((a.x <= x) && (x <= b.x) || (a.x >= x) && (x >= b.x));
		}
		else
		{
			return ((a.y <= y) && (y <= b.y) || (a.y >= y) && (y >= b.y));
		}
	}

	double distance_seg(const Point& a,const Point& b)
	{
		if((b-a).dot(*this-a) < EPS)
		{
			return (*this-a).norm();
		}
		if((a-b).dot(*this-b) < EPS)
		{
			return (*this-b).norm();
		}
		return abs((b-a).cross(*this-a)) / (b-a).norm();
	}

	//点a,b,cからなる三角形の中に自身が含まれているかどうか
	bool hitPolygon(const Point& a,const Point& b,const Point& c)
	{
		double t = (b-a).cross(*this-b);
		double t2 = (c-b).cross(*this-c);
		double t3 = (a-c).cross(*this-a);
		if((t > 0 && t2 > 0 && t3 > 0) || ( t < 0 && t2 < 0 && t3 < 0))
		{
			return true;
		}

		return false;
	}
};


struct Seg
{
	Point a,b;

	Seg (Point a, Point b) : a(a),b(b) {}

	bool isOrthogonal(Seg &s) { return equals((b - a).dot(s.b - s.a),0.0); }

	bool isParallel(Seg &s) { return equals((b-a).cross(s.b - s.a),0.0); }
	
	bool isIntersect(Seg &s)
	{
		return ((a-b).cross(s.a-a) * (a-b).cross(s.b-a) < EPS) && ((s.b-s.a).cross(a-s.a)*(s.b-s.a).cross(b-s.a) < EPS);
	}

	bool distance(Seg &s)
	{
		if((*this).isIntersect(s)) return 0.0;

		return min(min(a.distance_seg(s.a,s.b),b.distance_seg(s.a,s.b)),
				min(s.a.distance_seg(a,b),s.b.distance_seg(a,b)));
	}

	int getCrossPoint(Seg &s,Point &p)
	{
		Point ac = s.a - a;
		int sw = -1;

		double temp = (b.x - a.x) * (s.b.y - s.a.y) - (b.y - a.y) * (s.b.x - s.a.x);

		if(fabs(temp) > EPS)
		{
			double r = ((s.b.y - s.a.y) * p.x - (s.b.x - s.a.y) * p.y) / temp;
			double s = ((b.y - a.y) * p.x - (b.x - a.x) * p.y) / temp;
			if(r > -EPS && r < 1.0 + EPS && s > -EPS && s < 1.0 + EPS)
			{
				p.x = a.x + r * (b.x - a.x);
				p.y = a.y + r * (b.y - a.y);
				sw = 1;
			}
			else sw = 0;
		}
		return sw;	
	}
};

int ccw(Point a,Point b,Point c)
{
	b = b-a;
	c = c-a;

	if(b.cross(c) > 0.0) return +1;	//conter clockwise
	if(b.cross(c) < 0.0) return -1;	//clockwise
	if(b.dot(c) < 0.0) return +2;	//a on Seg(b,c)
	if(b.norm() < c.norm()) return -2;	//b on Seg(a,c)
	return 0;	//c on Seg(a,b)
}


int main()
{
	int n;
	cin >> n;

	
	return 0;
}
