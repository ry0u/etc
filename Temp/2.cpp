#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
#include <climits>
#include <queue>

#define REP(i,k,n) for(int i=k;i<n;i++)
#define rep(i,n) for(int i=0;i<n;i++)

using namespace std;


//max
struct RMQ
{
	int n;
	vector<int> dat;

	RMQ(int n_)
	{
		n = 1;
		while(n < n_) n *= 2;

		dat.resize(2*n-1);
		rep(i,2*n-1) dat[i] = -1;
	}

	void update(int k,int a)
	{
		k += n-1;
		dat[k] = a;

		while(k > 0)
		{
			k = (k-1) / 2;
			dat[k] = max(dat[k*2+1],dat[k*2+2]);
		}
	}

	void show()
	{
		rep(i,2*n-1)
		{
			if(dat[i] == -1) cout << "X ";
			else cout << dat[i] << " ";
		}
		cout << endl;
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
		rmq.show();
	}

	cout << "end" << endl;

	return 0;
}
