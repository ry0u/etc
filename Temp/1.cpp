#include <iostream>
#include <vector>
#include <string>
#include <algorithm>
#include <climits>

#define REP(i,k,n) for(int i=k;i<n;i++)
#define rep(i,n) for(int i=0;i<n;i++)

using namespace std;
typedef unsigned long long ull;

ull gcd(ull a,ull b) {
    if(b == 0) return a;
    cout << a << " " << b << "  :" << a/b << " :" << a%b << endl;
    return gcd(b,a%b);
}

ull lcm(ull m,ull n)
{
    if(m == 0 || n == 0) return 0;
    return ((m / __gcd(m,n)) * n);
}

ull extgcd(ull a,ull b,ull &x,ull &y)
{
    ull g = a;
    x = 1,y = 0;

    if(b != 0)
    {
        g = extgcd(b,a%b,y,x);
        y -= (a / b) * x;
    }

    return g;
}

int main() {
    ull a = 1234567890123456789;
    ull b = 9876543210987654321ULL;
    
    if(b > a) swap(a,b);
    
    cout << gcd(a,b) << endl;
}
