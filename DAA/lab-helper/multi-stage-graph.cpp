#include <bits/stdc++.h>
#include <climits>

using namespace std;

int main() {
  int stages = 4, min;
  int n = 8;
  int cost[n + 1], d[n + 1], p[stages + 1];
  int c[n + 1][n + 1]; // will contain the graph thing

  cost[n] = 0;

  for (int i = n - 1; i >= 1; i--) {
    min = INT_MAX;
    for (int k = i + 1; k <= n; k++) {
      if (c[i][k] != 0 && c[i][k] + cost[k] < min) {
        min = c[i][k] + cost[k];
        d[i] = k;
      }
    }
    cost[i] = min;
  }
  p[1] = 1;
  p[stages] = n;
  for (int i = 2; i < stages; i++) {
    p[i] = d[p[i - 1]];
  }
  return 0;
}
