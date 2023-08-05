import UIKit
import PlaygroundSupport

/**
 
 `Binary Search Tree` 란...
 
 각 Node 의 최대 Leaf 개수가 2개인 Tree 를 말하며,
 항상 정렬되어 있으며, Insertion 과 Deletion 를 할 수 있다.
 
 각 Node 의 왼쪽에는 자신보다 값이 작은 Node 가 들어가고, 오른쪽에는 자신보다 값이 큰 Node 가 들어간다.
 
 
 
 🌠 "Traverse the Tree"
 
 때때로는 하나의 값만 찾기보단 모든 노드를 봐야할 때가 있다.
 Binary Tree 를 Traverse 하는 방법은 크게 3 가지가 있다.
 1. In-Order (Depth-First)
 2. Pre-Order
 3. Post-Order
 
 - `In-Order (Depth First)`: 먼저 "왼쪽 Child Node" 을 통과한 뒤, "자신 Node" 를 통과하고 마지막으로 "오른쪽 Child Node" 를 통과한다.

 - `Pre-Order`: "자신 Node" 를 먼저 통과 후, "왼쪽 Child Node" 그 다음, "오른쪽 Child Node" 를 통과한다.
 
 - `Post-Order`: "왼쪽 Child Node" 그 다음 "오른쪽 Child Node" 를 통과 후, 마지막으로 "자신 Node" 를 본다.
 
 
 🗑️ "Deleting Nodes"
 
 Node 를 지우는 것은 어렵지 않다. 해당 Node 를 지우고 난 후, 그 지운 Node 를 left Child 중 가장 큰 Node 로 바꾸거나, right Child 중 가장 작은 Node 로 바꾸면 된다.
 
 
 자 이제 Class 와 Enum 으로 만들 수 있는 Binary Search Tree 를 만들어보자.
 
 */

    // MARK: - Properties
public final class BinarySearchTree<T: Comparable> {
    /// private(set) 이란 외부에서 Read 가능, 하지만 Set 은 불가능.
    private(set) public var value: T
    private(set) public var parent: BinarySearchTree?
    private(set) public var left: BinarySearchTree?
    private(set) public var right: BinarySearchTree?
    
    public init(value: T) {
        self.value = value
    }
    
    // 부모 Node 가 없으면 Root 이기 때문이다.
    public var isRoot: Bool {
        return parent == nil
    }
    
    public var isLeaf: Bool {
        return left == nil && right == nil
    }
    
    // ⭐️ "===" 이다. Swift 에서 Reference 타입을 가질 수 있는 class 객체를 참조할 수 있는 인스턴스는 다수가 될 수 있으므로 === 연산자가 필요하다.
    public var isLeftChild: Bool {
        return parent?.left === self
    }
    
    public var isRightChild: Bool {
        return parent?.right === self
    }
    
    public var hasLeftChild: Bool {
        return left != nil
    }
    
    public var hasRightChild: Bool {
        return right != nil
    }
    
    public var hasAnyChild: Bool {
        return hasLeftChild || hasRightChild
    }
    
    public var hasBothChildren: Bool {
        return hasLeftChild && hasRightChild
    }
   
    public var count: Int {
        return (left?.count ?? 0) + (right?.count ?? 0) + 1
    }
}

    //MARK: - Insertion
extension BinarySearchTree {
    
    /// 중요한 포인트는, 항상 ⭐️ Root Node 에 insert 를 해야한다는 점이다.
    public func insert(value: T) {
        if value < self.value {
            /// left 에 값이 있다면, 한 단계 더 내려간다.
            /// Recursive 하다.
            if let left = left {
                left.insert(value: value)
            } else {
                /// left 에 값이 없다면, left 에 .init 을 하고 value 를 채워 넣는다. 그리고 해당 left 의 parent 를 채운다.
                left = BinarySearchTree(value: value)
                left?.parent = self
            }
        } else {
            if let right = right {
                right.insert(value: value)
            } else {
                right = BinarySearchTree(value: value)
                right?.parent = self
            }
        }
    }
    
    /// ⭐️ 이렇게 init 을 만들면, insert 를 여러번에 걸쳐 하지 않아도 처음 init 에 arrat 를 넣으면 저절로 정렬된 Binary Tree 가 만들어진다.
    /// 예시로,
    /// - let tree = BinarySearchTree<Int>(array: [7,2,5,10,9,1])
    /// 처럼 사용할 수 있다.
    public convenience init(array: [T]) {
        precondition(array.count > 0)
        self.init(value: array.first!)
        for item in array.dropFirst() {
            insert(value: item)
        }
    }
}

    // MARK: - Search
extension BinarySearchTree {
    
    /// Node 를 정하고 그 노드로 움직이자.
    public func search(value: T) -> BinarySearchTree? {
        // 자신이 Root 일 때를 말한다.
        var node: BinarySearchTree? = self
        while let currentNode = node {
            if value < currentNode.value {
                node = currentNode.left
            } else if value > currentNode.value {
                node = currentNode.right
            } else {
                return node
            }
        }
        return nil
    }
}

//    /// Traversal
//extension BinarySearchTree {
//    
//    /// Left->Parent->Right
//    public func traverseInOrder(process: (T) -> Void) {
//      left?.traverseInOrder(process: process)
//      process(value)
//      right?.traverseInOrder(process: process)
//    }
//    
//    /// Parent->Left->Right
//    public func traversePreOrder(process: (T) -> Void) {
//      process(value)
//      left?.traversePreOrder(process: process)
//      right?.traversePreOrder(process: process)
//    }
//
//    /// Left->Right->Parent
//    public func traversePostOrder(process: (T) -> Void) {
//      left?.traversePostOrder(process: process)
//      right?.traversePostOrder(process: process)
//      process(value)
//    }
//}

extension BinarySearchTree: CustomStringConvertible {
    /// Tree 를 간단하게 보여줄 수 있는 Method 다.
    /// 예시)
    /// ((1) <- 2 -> (5)) <- 7 -> ((9) <- 10)
    public var description: String {
        var desc = ""
        if let left = left {
            desc += "(\(left.description)) <-"
        }
        
        desc += "\(value)"
        if let right = right {
            desc += "-> (\(right.description))"
        }
        return desc
    }
}
