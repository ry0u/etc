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

int main() {
    int cnt = 0;
    int no = 0;

    REP(i,0,1000) {
        stringstream ss;
        ss << i;

        string s = ss.str();
        bool flag = true;

        rep(j,s.size()) {
            if(s[j] == '1') flag = false;
        }

        if(flag) cnt++;
        else {
            cout << i << endl;
            no++;
        }
    }

    cout << cnt << " " << no << endl;

    return 0;
}
