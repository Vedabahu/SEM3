#include <bits/stdc++.h>
#include <chrono>
#include <system_error>

#define ll long long

using namespace std;
using namespace std::chrono;

ll *memo = NULL;

ll fibonachi(int n) {
  if (!memo) {
    memo = new ll[n + 1];
    for (int i = 0; i < n; i++) {
      memo[i] = -1;
    }
    memo[0] = 0;
    memo[1] = 1;
  }

  if (memo[n - 1] == -1) {
    memo[n - 1] = fibonachi(n - 1);
  }
  if (memo[n - 2] == -1) {
    memo[n - 2] = fibonachi(n - 2);
  }

  return memo[n - 1] + memo[n - 2];
}

ll fib(int n) {
  if (n <= 1)
    return n;
  return fib(n - 1) + fib(n - 2);
}

int main() {

  int n = 25;

  auto start = high_resolution_clock::now();
  cout << fibonachi(n);
  auto stop = high_resolution_clock::now();

  cout << "\nTime 1 : " << (duration_cast<microseconds>(stop - start)).count();

  auto start2 = high_resolution_clock::now();
  cout << fib(n);
  auto stop2 = high_resolution_clock::now();

  cout << "\nTime 2 : "
       << (duration_cast<microseconds>(stop2 - start2)).count();

  cout << "\n";
  return 0;
}
