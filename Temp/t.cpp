#include <iostream>
#include <vector>
#include <string>
#include <cstring>
#include <algorithm>

#define REP(i,k,n) for(int i=k;i<n;i++)
#define rep(i,n) for(int i=0;i<n;i++)

using namespace std;
typedef long long ll;

int main() {
    int n;
    cin >> n;
    
    vector<int> v;
    v.erase(remove(v.begin(),v.end(),2),v.end());

    rotate(v.begin(),v.begin()+2,v.end());

    v.erase(unique(v.begin(),v.end()),v.end());

    vector<int> v2;
    copy(v.begin(),v.end(),back_inserter(v2));

    return 0;
}
