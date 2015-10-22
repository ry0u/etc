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

    cout << 999 << endl;
    cout << 999 * 999 << endl;
    cout << 999 * 999 * 999 << endl;

    rep(i,10000) {
        ll d = i * i * i;
        stringstream ss;
        ss << d;

        string s = ss.str();

        if(s.size() >= 3 && s[s.size()-1] == '9' && s[s.size()-2] == '9' && s[s.size()-3] == '9') {
            cout << i << " " << d << " YES" << endl;
        }
    }

    return 0;
}
