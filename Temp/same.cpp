#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
#include <sstream>

#define REP(i,k,n) for(int i=k;i<n;i++)
#define rep(i,n) for(int i=0;i<n;i++)

using namespace std;

vector<string> samesplit(string s)
{
	vector<string> ret;
	rep(i,s.size())
	{
		stringstream ss;
		ss << s[i];
		REP(j,i+1,s.size())
		{
			if(s[i] == s[j]) 
			{
				ss << s[j];
				i++;
			}
			else break;
		}
		ret.push_back(ss.str());
	}
	return ret;
}


void dijkstra(int s,int n)
{
    priority_queue<P,vector<P>,greater<P> > que;
    fill(d,d+n,INF);

    d[s] = 0;
    que.push(P(0,s));

    while(que.size())
    {
    	P p = que.top();
    	que.pop();

        int v = p.second;
        if(d[v] < p.first) continue;

        rep(i,G[v].size())
        {
            edge e = G[v][i];
            if(d[e.to] > d[v] + e.cost)
            {
                d[e.to] = d[v] + e.cost;
                que.push(P(d[e.to],e.to));
            }
        }
    }
}

vector<string> sp(string s){
    vector<string> ret;
    rep(i,s.size()) {
        stringstream ss;
        ss << s[i];
        REP(j,i+1,s.size()) {
            if(s[i] == s[j]) {
                ss << s[j];
                i++;
            }
            else break;
        }
        ret.push_back(ss.str());
    }
    return ret;
}

int main()
{
	string s;
	cin >> s;
	
	vector<string> S = samesplit(s);

	cout << S.size() << endl;
	rep(i,S.size())
	{
		cout << S[i] << endl;
	}
	return 0;
}
