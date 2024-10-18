#include <iostream>
#include <vector>

using namespace std;

class Graph {
  int V;
  vector<vector<int>> arr;
  vector<int> edges; // No of edges for each element.
  vector<int> result;

  int find_max() {
    int maxI = 0;
    int max = edges[maxI];

    for (int i = 0; i < V; i++) {
      if (edges[i] > max) {
        maxI = i;
        max = edges[i];
      }
    }
    return maxI;
  }

  bool hasEdges(int v) {
    for (int i = 0; i < V; i++) {
      if (arr[v][i] > 0)
        return true;
    }

    return false;
  }

public:
  Graph(int V) {
    this->V = V;
    arr.resize(V);
    edges.resize(V);
    for (int i = 0; i < V; i++) {
      arr[i].resize(V);
    }
  }

  void addEdge(int u, int v) {
    edges[u] += 1;
    edges[v] += 1;
    arr[u][v] = 1;
    arr[v][u] = 1;
  }

  vector<int> vertexCover() {
    int vertexWithMaxEdges = find_max();
    edges[vertexWithMaxEdges] = -1;

    if (!hasEdges(vertexWithMaxEdges)) {
      return result;
    }

    for (int i = 0; i < V; i++) {

      if (arr[vertexWithMaxEdges][i] > 0) {
        edges[i]--;
      }

      arr[vertexWithMaxEdges][i] = 0;
      arr[i][vertexWithMaxEdges] = 0;
    }

    result.push_back(vertexWithMaxEdges);
    vertexCover();
    return result;
  }

  void pprint() {
    cout << "\n\nMatrix: \n\n";

    for (int i = 0; i < V; i++) {
      for (int j = 0; j < V; j++) {
        cout << arr[i][j] << "  ";
      }
      cout << "\n\n";
    }
  }
};

int main() {
  Graph g(11);

  g.addEdge(1, 2);
  g.addEdge(1, 3);
  g.addEdge(1, 4);
  g.addEdge(2, 3);
  g.addEdge(2, 4);
  g.addEdge(2, 5);
  g.addEdge(2, 6);
  g.addEdge(2, 7);
  g.addEdge(2, 8);
  g.addEdge(2, 9);
  g.addEdge(3, 5);
  g.addEdge(4, 5);
  g.addEdge(6, 10);
  g.addEdge(7, 10);
  g.addEdge(8, 9);

  // g.pprint();

  vector<int> result = g.vertexCover();

  cout << "Result:\t";

  for (auto i : result) {
    cout << i << "\t";
  }

  cout << "\n";

  return 0;
}
