#include <iostream>
#include <vector>
#include <string>
#include <cstring>
#include <algorithm>
#include <fstream>
#include <boost/graph/adjacency_list.hpp>
#include <boost/graph/graphviz.hpp>

#define REP(i,k,n) for(int i=k;i<n;i++)
#define rep(i,n) for(int i=0;i<n;i++)

using namespace std;
typedef long long ll;

boost::adjacency_list<> g;

int main() {
    int n;
    cin >> n;
    
    vector<int> v(n);
    rep(i,n) {
       v[i] = boost::add_vertex(g);
    }

    rep(i,n) {
        int t = (i+1)%n;
        boost::add_edge(i,t,g);
    }

    boost::write_graphviz(std::cout, g);
    

    return 0;
}
