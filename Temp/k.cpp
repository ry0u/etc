#include <iostream>
#include <vector>
#include <string>
#include <cstring>
#include <algorithm>
#include <sstream>
#include <map>
#include <set>

#define REP(i,k,n) for(int i=k;i<n;i++)
#define rep(i,n) for(int i=0;i<n;i++)
#define INF 1<<30
#define pb push_back
#define mp make_pair

using namespace std;
typedef long long ll;
typedef pair<int,int> P;

int lcs(string s,string s2,int len) {
    int c[len+1][len+1];	
    int m = s.size();
    int n = s2.size();

    int ret = 0;
    s = ' ' + s;
    s2 = ' ' + s2;

    REP(i,1,m+1) c[i][0] = 0;
    REP(j,1,n+1) c[0][j] = 0;

    REP(i,1,m+1) {
        REP(j,1,n+1) {
            if(s[i] == s2[j]) c[i][j] = c[i-1][j-1] + 1;
            else c[i][j] = max(c[i-1][j],c[i][j-1]);
            ret = max(ret,c[i][j]);
        }
    }

    return ret;
}

int humming(string s, string s2, int len) {
    int c[len+1][len+1];
    memset(c, 0, sizeof(c));

    int m = s.size();
    int n = s2.size();

    int ret = 0;
    s = ' ' + s;
    s2 = ' ' + s2;

    REP(i,1,m+1) c[i][0] = i;
    REP(j,1,n+1) c[0][j] = j;

    REP(i,1,m+1) {
        REP(j,1,n+1) {
            int x = (s[i] == s2[j] ? 0 : 1);
            c[i][j] = min(c[i-1][j] + 1, min(c[i][j-1] + 1, c[i-1][j-1] + x));
        }
    }

    rep(i,m+1) {
        rep(j,n+1) {
            cout << c[i][j] << " ";
        }
        cout << endl;
    }

    return c[m][n];
}

int main() {
    string s = "abcdef";
    string s2 = "ghbce";


    cout << humming(s, s2, 6) << endl;
    return 0;
}
