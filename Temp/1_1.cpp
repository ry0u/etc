#include <iostream>
#include <string>
#include <vector>
#include <algorithm>

#define REP(i,k,n) for(int i=k;i<n;i++)
#define rep(i,n) for(int i=0;i<n;i++)

using namespace std;
typedef long long ll;

ll gcd(ll a,ll b) {
    if(b == 0) return a;
    cout << a << " " << b << "  :" << a/b << " :" << a%b << endl;
    return gcd(b,a%b);
}

ll lcm(ll m,ll n)
{
    if(m == 0 || n == 0) return 0;
    return ((m / __gcd(m,n)) * n);
}


ll extgcd(ll a,ll b,ll &x,ll &y)
{
    ll g = a;
    x = 1,y = 0;

    if(b != 0)
    {
        g = extgcd(b,a%b,y,x);
        y -= (a / b) * x;
    }

    return g;
}

bool check(ll a,ll b,ll c) {
    cout << "gcd:" << __gcd(a,b) << endl;
    if(c % __gcd(a,b) == 0) return true;
    return false;
}

bool extgcd2(ll a,ll b,ll &x,ll &y,ll c) {
    if(!check(a,b,c)) {
        return false;
    }

    ll g = __gcd(a,b);
    extgcd(a,b,x,y);

    cout << x << " " << endl;

    REP(i,1,11) {
        ll nx = x + (b/g) * i;
        ll ny = y + (a/g) * i;

        ll nx2 = x + (b/g) * -i;
        ll ny2 = y + (b/g) * -i;

        cout << "i:" << i << " nx:" << nx << " ny:" << ny << endl;
        cout << "i:" << i << " nx:" << nx2 << " ny:" << ny2<< endl;
    }

    return true;
}
int main()
{
    ll a,b,x,y,c;
    cin >> a >> b >> c;
    
    if(b > a) swap(b,a);

    if(!check(a,b,c)) {
        cout << "no ans" << endl;
    }

    extgcd(a,b,x,y);
    ll g = gcd(a,b);

    REP(i,1,11) {
        ll nx = x + (b/g) * i;
        ll ny = y + (a/g) * i;

        cout << nx << " " << ny << endl;

        nx = x + (b/g) * -i;
        ny = y + (a/g) * -i;

        cout << nx << " " << ny << endl;
    }
    return 0;
}
