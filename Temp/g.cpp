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

vector<int> G[105];
vector<int> rG[105];
vector<int> vs;
bool used[105];
int cmp[105];

void add_edge(int from,int to) {
    G[from].push_back(to);
    G[to].push_back(from);
}

void dfs(int v) {
    used[v] = true;
    rep(i,G[v].size()) {
        if(!used[G[v][i]]) dfs(G[v][i]);
    }

    vs.push_back(v);
}

void rdfs(int v,int k) {
    used[v] = true;
    cmp[k] = k;

    rep(i,rG[v].size()) {
        if(!used[rG[v][i]]) rdfs(rG[v][i],k);
    }
}

int scc(int n) {
    memset(used,0,sizeof(used));
    vs.clear();

    rep(i,n) {
        if(!used[i]) dfs(i);
    }

    memset(used,0,sizeof(used));
    int k = 0;

    for(int i=n-1;i>=0;i--) {
        if(!used[vs[i]]) rdfs(vs[i],k++);
    }

    return k;
}

int main() {
    int n;
    cin >> n;

    return 0;
}
