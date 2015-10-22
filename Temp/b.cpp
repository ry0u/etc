#include <iostream>
#include <string>
#include <vector>
#include <algorithm>

#define REP(i,k,n) for(int i=k;i<n;i++)
#define rep(i,n) for(int i=0;i<n;i++)

using namespace std;

int a,b,c,n;
vector<int> gp,gc,gf;
bool flag;

struct BIT
{
    vector<int> bit;

    BIT(int n) : bit(n+1) {}

    int sum(int i)
    {
	    int s = 0;
	    while(i > 0)
	    {
		    s += bit[i];
		    i -= i & -i;
	    }
    	return s;
    }

    void add(int i,int x)
    {
	    while(i <= bit.size())
	    {
		    bit[i] += x;
	    	i += i & -i;
	    }
	}
};

void dfs(int num,int da,int db,int dc)
{
	if(da > a || db > b || dc > a) return;

	if(num >= n)
	{
		if(da == a && db == b && dc == c) flag = true;
		return;
	}

	dfs(num+1,da + gp[num],db + gc[num],dc + gf[num]);
	dfs(num+1,da,db,dc);
}


int main()
{
	int t;
	cin >> t;

	rep(k,t)
	{
		gp.clear();
		gc.clear();
		gf.clear();

		flag = false;

		cin >> a >> b >> c;

		cin >> n;


		int t1,t2,t3;
		
		rep(i,n)
		{
			cin >> t1 >> t2 >> t3;
			gp.push_back(t1);
			gc.push_back(t2);
			gf.push_back(t3);
		}


		dfs(0,0,0,0);

		cout << "Case #" << k+1 << ": "; 

		if(flag)
		{
			cout << "yes" << endl;
		}
		else cout << "no" << endl;
			
	}
	return 0;
}
