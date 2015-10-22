#include <iostream>
#include <vector>
#include <string>
#include <cstring>
#include <algorithm>
#include <sstream>
#include <map>
#include <set>
#include <cmath>

#define REP(i,k,n) for(int i=k;i<n;i++)
#define rep(i,n) for(int i=0;i<n;i++)
#define INF 1<<30
#define pb push_back
#define mp make_pair

using namespace std;
typedef long long ll;
typedef pair<int,int> P;

// 2*n 3*n 5*n 7*n
// 123456789101112131415161718192021
// **o*oo*o* o * o * * o * * o * o o
// 123456789101112131415161718192021
// **o**o**o * * o * * o * * o * * o
// 123456789101112131415161718192021
// ****o**** o * * * * o * * * * o *
// 123456789101112131415161718192021
// xoooxoxox o x o x o o o x o x o o
bool used[100005];
int main() {
    int a = 11, b = 17;

    REP(i,2,50) REP(j,2,50) {
        if(__gcd(i,j) != 1) continue;
        a = i;
        b = j;

    memset(used,0,sizeof(used));

    vector<int> v;
    int t = a;
    int n = 500;
    rep(i,n) {
        v.push_back(t);
        t += a;
    }

    vector<int> u;
    t = b;
    rep(i,n) {
        u.push_back(t);
        t += b;
    }

    vector<int> res;
    set<int> st;
    rep(i,n) {
        used[v[i]] = true;
        used[u[i]] = true;

        // bool flag = false;
        // set<int>::iterator ite;
        // for(ite = st.begin(); ite != st.end(); ite++) {
        //     if(__gcd(*ite,v[i]) != 1) flag = true;
        // }
        //
        // if(!flag) res.push_back(v[i]),st.insert(v[i]);
        //
        // flag = false;
        // for(ite = st.begin(); ite != st.end(); ite++) {
        //     if(__gcd(*ite,u[i]) != 1) flag = true;
        // }
        //
        // if(!flag) res.push_back(u[i]),st.insert(u[i]);

        rep(j,n) {
            used[v[i] + u[j]] = true;
            //
            // flag = false;
            // for(ite = st.begin(); ite != st.end(); ite++) {
            //     if(__gcd(*ite,v[i] + u[j]) != 1) flag = true;
            // }
            //
            // if(!flag) res.push_back(v[i] + u[j]), st.insert(v[i] + u[j]);
        }
    }

    // sort(res.begin(), res.end());
    // rep(i,res.size()) {
    //     cout << i << " --- res:" << res[i] << endl;
    // }

    int vmax = 0;
    rep(i,n) {
        if(used[i]) continue;
        else {
            vmax = max(vmax, i);
        }
    }
    // rep(i,n) {
    //     cout << i << " ";
    //
    //     if(used[i]) cout << "O";
    //     else cout << "X", vmax = max(vmax, i);
    //     cout << endl;
    // }

    cout << a << " " << b << " "<< vmax << endl;
    // cout << a << " " << b << " " << abs(a-b) << " " << vmax << endl;
    }

    return 0;
}
