#include <iostream>
#include <vector>
#include <string>
#include <cstring>
#include <algorithm>

#define REP(i,k,n) for(int i=k;i<n;i++)
#define rep(i,n) for(int i=0;i<n;i++)
#define INF 1<<30

using namespace std;
typedef long long ll;

struct edge {
    int from,to;
    int cost;

    edge(int t,int c) : to(t),cost(c) {}
    edge(int f,int t,int c) : from(f),to(t),cost(c) {}

    bool operator<(const edge &e) const {
        return cost < e.cost;
    }
};

vector<edge> G[105];

void visit(vector<vector<edge> > h,int v,int s,int r,vector<int> &no,vector< vector<int> > &comp,vector<int> &prev,vector<vector<int> > &next,vector<int> &mcost,vector<int> &mark,int &cost,bool &found) {
    
    int n = h.size();
    if(mark[v]) {
        vector<int> temp = no;
        found = true;

        do {
            cost += mcost[v];
            v = prev[v];
            
            if(v != s) {
                while(comp[v].size() > 0) {
                    no[comp[v].back()] = s;
                    comp[s].push_back(comp[v].back());
                    comp[v].pop_back();
                }
            }
        }while(v != s);

        rep(i,comp[s].size()) {
            int j = comp[s][i];

            if(j != r) {
                rep(k,h[j].size()) {
                    edge e = h[j][k];
                    if(no[e.from] != s) {
                        e.cost -= mcost[temp[j]];
                    }
                }
            }
        }

        mark[v] = true;
        rep(i,next[v].size()) {
            int j = next[v][i];

            if(no[j] != no[v] && prev[no[j]] == v) {
                if(!mark[no[j]] || j == s) {
                    visit(h,j,s,r,no,comp,prev,next,mcost,mark,cost,found);
                }
            }
        }
    }
}


int minimumSpanningAborescence(int n,int s) {
    vector< vector<edge> > H(n);

    rep(u,n) {
        rep(i,G[u].size()) {
            edge e = G[u][i];
            H[e.to].push_back(e);
        }
    }

    vector<int> no(n);
    vector< vector<int> > comp(n);
    rep(i,n) comp[i].push_back(no[i] = i);

    for(int cost = 0;;) {
        vector<int> prev(n,-1);
        vector<int> mcost(n,INF);

        rep(i,n) {
            if(i != s) {
                rep(j,H[i].size()) {
                    edge e = H[i][j];
                    int id = no[i];
                    int src = e.from;

                    if(no[src] != id) {
                        if(e.cost < mcost[id]) {
                            mcost[id] = e.cost;
                            prev[id] = no[src];
                        }
                    }
                }
            }
        }

        vector< vector<int> > next(n);
        rep(i,n) {
            if(prev[i] >= 0) {
                next[prev[i]].push_back(i);
            }
        }

        bool stop = true;
        vector<int> mark(n);
        rep(i,n) {
            if(i != s && !mark[i] && !comp[i].empty()) {
                bool found = false;

                visit(H,i,i,s,no,comp,prev,next,mcost,mark,cost,found);
                if(found) {
                    stop = false;
                }
            }
        }

        if(stop) {
            rep(i,n) {
                if(prev[i] >= 0) cost += mcost[i];
            }

            return cost;
        }
    }
}

int main() {
    int n,m,r;
    cin >> n >> m >> r;

    rep(i,m) {
        int s,t,w;
        cin >> s >> t >> w;
        
        G[s].push_back(edge(s,t,w));
    }

    cout << minimumSpanningAborescence(n,r) << endl;

    return 0;
}
