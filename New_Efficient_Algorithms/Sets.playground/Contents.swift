import UIKit

/**
 
 해당되는 subset 들이 어디에 포함되어 있는지 확인하는 것은
 1. `Undirected Graph` 에서 사용할 수 있다.
 2. `Kruskal's algorithm for Minimum Spanning tree`
 (https://github.com/kodecocodes/swift-algorithm-club/tree/master/Graph)
 
 우리가 알아볼 것은 `Weighted Quick Union` 이다.
 Union-Find 데이터 구조는 subset 들이 나무인, 숲이라고 생각할 수 있다.
  사용을 할 때에는 각 노드의 Parent Node 만 사용하면 된다.
 Child Node 는 필요 하지 않다.
 
 parent [ 1, 1, 1, 0, 2, 0, 6, 6, 6 ]
      i   0  1  2  3  4  5  6  7  8
 
    1              6
  /   \           / \
 0      2        7   8
/ \    /
3  5   4
 
 각 subset 에는 Identify 할 수 있는 유니크한 번호들이 있다.
 그 번호들은 Tree 의 root Node 라고 할 수 있다.
 -> Parent[] 에서 안에 들어가는 Key 가 Root 일 경우, 자신을 가르킨다. ex) parent[1] = 1, parent[6] = 6
 
 총 4가지의 Method 를 구현한다.
 1. Add Set
 2. Find
 3. Union (Weighted)
 4. Path Compression
 
 */

struct UnionFind<T: Hashable> {
    private var index: [T: Int] = [:]
    private var parent: [Int] = []
    private var size: [Int] = []
}

    // Add Set
extension UnionFind {
    /**
     1. 추가한 element 를 빠르게 찾을 수 있게 index Dict. 에 넣는다.
     2. Parent 의 Index 를 추가한다.
     3. size[i] 는 i index 가 root 인 노드의 개수를 의미한다. 새로운 set 의 경우, size 는 항상 1 이다.
     이 size 는 Union Operation 에 사용한다.
     */
    mutating func addSetWith(_ element: T) {
        index[element] = parent.count   // 1
        parent.append(parent.count)   // 2
        size.append(1)    // 3
    }
}

    // Find
extension UnionFind {
    
}

    // Union
extension UnionFind {
    
}

    // Path Compression
extension UnionFind {
    
}
