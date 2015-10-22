#include <iostream>
#include <string>
#include <vector>
#include <algorithm>

#define REP(i,k,n) for(int i=k;i<n;i++)
#define rep(i,n) for(int i=0;i<n;i++)
#define INF 1<<30

using namespace std;
typedef long long ll;

struct RMQ
{
	int n;
	vector<int> dat;

	RMQ(int n_)
	{
		n = 1;
		while(n < n_) n *= 2;

		dat.resize(n*4);
		rep(i,n*4) dat[i] = INF;
	}

	void update(int k,int a)
	{
		int i = k+n-1;
		dat[i] = a;

		while(i > 0)
		{
			i = (i-1) / 2;
			dat[i] = min(dat[i*2+1],dat[i*2+2]);
		}
	}

	//[a,b)
	//query(a,b,0,0,n)
	int query(int a,int b,int k,int l,int r)
	{
		if(r <= a || b <= l) return INF;

		if(a <= l && r <= b) return dat[k];
		else
		{
			int vl = query(a,b,k*2+1,l,(l+r)/2);
			int vr = query(a,b,k*2+2,(l+r)/2,r);

			return min(vl,vr);
		}
	}
};



int main()
{
	int n;
	cin >> n;

	RMQ rmq(n);
	rep(i,n)
	{
		int x;
		cin >> x;

		rmq.update(i,x);
		

		rep(j,n*2)
		{
			if(rmq.dat[j] == INF) cout << "X ";
			else cout << rmq.dat[j] << " ";
		}
		cout << endl;
	}
	

	return 0;
}
