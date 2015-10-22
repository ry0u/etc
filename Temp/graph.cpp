#include <iostream>
#include <vector>
#include <string>
#include <cstring>
#include <algorithm>
#include <complex>
#include <cmath>

#define REP(i,k,n) for(int i=k;i<n;i++)
#define rep(i,n) for(int i=0;i<n;i++)
#define PI acos(-1) 
#define INF 1<<30

using namespace std;
typedef long long ll;
typedef complex<double> C;

void fft(vector<C> &f,int n,int dir) {
    if(n == 1) return;
    vector<C> a(n/2),b(n/2);
    
    rep(i,n/2) {
        a[i] = f[i*2];
        b[i] = f[i*2+1];
    }

    fft(a,n/2,dir);
    fft(b,n/2,dir);

    C zeta = polar(1.0,dir*2*PI/n);
    C pow_zeta(1.0,0.0);

    rep(i,n) {
        int id = i % (n/2);
        f[i] = a[id] + pow_zeta * b[id];
        pow_zeta *= zeta;
    }
}

struct edge {
    int from,to;
    int cost;

    edge(int t,int c) : to(t),cost(c) {}
    edge(int f,int t,int c) : from(f),to(t),cost(c) {}

    bool operator<(const edge &e) const {
        return cost < e.cost;
    }
};

vector<edge> E;
int d[50][50];


void warshall_floyd(int n) {
    rep(i,n) rep(j,n) d[i][j] = INF;
    rep(i,n) d[i][i] = 0;

    rep(k,n) {
        rep(i,n) {
            rep(j,n) {
                d[i][j] = min(d[i][j],d[i][k] + d[k][j]);
            }
        }
    }
}

void printfGraph(vector<edge> G[],int n) {
    cout << "digraph g{" << endl;
    cout << "node[shape = circle];" << endl;
    cout << "nodestep=0.6;" << endl;

    cout << "rankdir=LR;" << endl;


    rep(i,n) {
        rep(j,G[i].size()) {
            cout << i << " ->" << G[i][j].to << ";" << endl;
        }
    }

    cout << "}" << endl;
}

void printEdge(vector<edge> E,int n) {
    int m = E.size();

    cout << "digraph g{" << endl;
    cout << "node[shape = circle];" << endl;
    cout << "nodestep=0.6;" << endl;
    cout << "randir=LR;" << endl;

    rep(i,m) {
        edge e = E[i];
        cout << e.from << " -> " << e.to << ";" << endl;
    }

    cout << "]" << endl;
}

int main() {
    int n,m;
    cin >> n >> m;

    vector<edge> G[50];
    rep(i,m) {
        int s,t;
        cin >> s >> t;

        G[s].push_back(edge(t,1));
    }

    printfGraph(G,n);

    return 0;
}
