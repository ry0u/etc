#include <iostream>
#include <vector>
#include <string>
#include <cstring>
#include <algorithm>

#define REP(i,k,n) for(int i=k;i<n;i++)
#define rep(i,n) for(int i=0;i<n;i++)

using namespace std;
typedef long long ll;

ll extgcd(ll a,ll b,ll &x,ll &y) {
    ll g = a;
    x = 1,y = 0;

    if(b != 0) {
        g = extgcd(b,a%b,y,x);
        y -= (a / b) * x;
    }

    return g;
}

ll mod_inverse(ll a,ll m) {
    ll x,y;
    extgcd(a,m,x,y);
    return (m + x%m) % m;
}

ll fact[1000000000];

ll mod_fact(ll n,ll p,ll& e) {
    e = 0;
    if(n == 0) return 1;

    ll res = mod_fact(n/p,p,e);
    e += n/p;

    if(n/p % 2 != 0) return res*(p-fact[n%p]) % p;
    return res * fact[n%p] % p;
}

ll nCk(ll n,ll k,ll p) {
    if(n < 0 || k < 0 || n < k) return 0;
    ll e1,e2,e3;
    
    ll a1 = mod_fact(n,p,e1);
    ll a2 = mod_fact(k,p,e2);
    ll a3 = mod_fact(n-k,p,e3);

    if(e1 > e2 + e3) return 0;
    return a1* mod_inverse(a2 * a3 % p,p) % p;
}

int main() {
    int n;
    cin >> n;

    return 0;
}
