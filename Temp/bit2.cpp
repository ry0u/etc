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

struct BIT {
    vector<int> bit;

    BIT(int n) : bit(n+1) {}

    int sum(int i) {
        int s = 0;
        while(i > 0) {
            s += bit[i];
            i -= i & -i;
        }
        return s;
    }

    void add(int i,int x) {
        while(i <= bit.size()) {
            bit[i] += x;
            i += i & -i;
        }
    }
};

struct BIT2D {
    vector<vector<int> > bit;
    int n;

    BIT2D(int N) : bit(n+1, vector<int>(n+1)), n(N) {}

    void add(int y, int x, int t) {
        for(int i=y ; i <= n ; i += (i & (-i)) ){
            for(int j=x; j <= n ; j += (j & (-j)) ) {
                bit[i][j] += t;
            }
        }
    }

    int get(int y, int x) {
        int ret = 0;
        for(int i=y; i > 0 ; i -= (i & (-i)) ){
            for(int j=x; j > 0 ; j -= (j & (-j)) ) {
                ret += bit[i][j];
            }
        }

        return ret;
    }
};

int main() {
    int n;
    cin >> n;

    return 0;
}
