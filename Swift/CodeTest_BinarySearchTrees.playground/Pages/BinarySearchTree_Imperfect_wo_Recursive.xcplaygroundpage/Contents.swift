import UIKit

/*
 
  🌴 What is Tree?
 - Tree consists of Nodes & Branches that doesn't cycle.
 
 
   "Linked List used Nodes."
 
   Node = Data + Addresses to next Data
 
   연결리스트는 head 와 tail 같은 "선형 구조"로 이루어져 있다.
   그에 반해,
   트리는 최상위 노드가 존재하며, 그 노드를 기준으로 왼쪽과 오른쪽에 "자식" 으로 배치가 되는 "비선형 구조"를 가지고 있다.
   하위로 떨어지는 그 선이 "branch" 이다. 즉, 다음 주소값은 내 자식 노드들의 주소값을 가리는구나 라고 이해하자.
   
   아래로만 떨어지므로, 순환될 일이 없다. 사이클이 존재하지 않는다.
 
 
   Node: 트리에서 데이터를 구성하고 있는 각 요소 (데이터 및 Branch 정보도 포함)
   Root Node: 트리의 최상위에 있는 노드
   Level: 노드의 깊이
   Parent Node: 어떤 노드의 다음 레벨에 연결된 노드
   Child Node: 어떤 노드의 이전 레벨에 연결된 노드
   Leaf Node(Terminal Node): Child Node 가 하나도 없는 노드
   Depth: 트리에서 Node 가 가질 수 있는 가장 깊은 Level
 
*/
 
/**
 
 🌴² What is Binary Tree?
 - Binary Tree consists of Nodes that have maximum of TWO branches. AND, there's a rule for the mechanism.
 
 1️⃣ 모든 노드가 자신의 "왼쪽" Child Node 에는 자신의 값보다 "작은" 값이, "오른쪽" Child Node 에는 자신의 값보다 "큰" 값이 오는 규칙을 만족해야 한다.
 
 2️⃣ 노드의 데이터 값은 중복되지 않고 유일하다. 노드의 데이터 값은 항상 존재한다. (nil 이 아니다.)
 
 3️⃣ BST 는 배열로 구현하지 않는다. 연결리스트로 구현한다.
 
 */

/*
 
 1. 각 브랜치에 있는 data 들을 비교하려면, data 는 Comparable 이어야 한다. 그래서 제네릭<T> 을 Comparable 을 받아준다.
 2. root Node 가 항상 기본적으로 존재한다.
 
 */






// 근데 이 코드 뭔가 좀 이상함 ㅎ




    // MARK: - Binary Search Tree Node: Insert, Search, Remove, Draw
    /// Insert, Search
class BSTNode<T: Comparable> {
    var data: T
    var left: BSTNode?
    var right: BSTNode?
    
    init(data: T) {
        self.data = data
    }
}

class BinarySearchTree<T: Comparable> {
    var root: BSTNode<T>?
    
    func insert(_ data: T) {
        
        guard let root = self.root else {
            return self.root = BSTNode.init(data: data)
        }
        
        var currentNode = root
        
        while true {
            // BST 의 값은 유일해야 한다.
            if currentNode.data == data {
                print("중복된 값입니다.")
                return
            }
            
            if currentNode.data > data {
                guard let nextNode = currentNode.left else {
                    return currentNode.left = BSTNode.init(data: data)
                }
                
                currentNode = nextNode
            } else {
                guard let nextNode = currentNode.right else {
                    return currentNode.right = BSTNode.init(data: data)
                }
                
                currentNode = nextNode
            }
        }
    }
    
    func search(from data: T) -> Bool {
        if self.root == nil { return false }
        
        var currentNode = root
        
        while let node = currentNode {
            if node.data == data {
                return true
            }
            
            if node.data > data {
                currentNode = node.left
            } else {
                currentNode = node.right
            }
        }
        
        return false
    }
}

    // MARK: - Remove Methods
    /// Case 1: Child Node 가 0개인 Leaf Node 삭제
    /// Case 2: Child Node 가 1개 있는 Node 삭제
    /// Case 3: Child Node 가 2개 있는 Node 삭제
extension BinarySearchTree {
    
    // 삭제한다 = Parent Node 의 Branch(left or right) 를 끊어주는 것 (📍nil 을 할당하는 것)
    //      -> ⭐️ 1. 삭제할 Node, 2. 삭제할 Node 의 Parent Node
    //            를 탐색 후 정보를 알고 있어야함! 어떤 삭제 Case 에서든 필요한 과정임!
    func remove(from data: T) -> Bool {
        guard let root = self.root, root.data != data else { return false }
        
        var parentNode = root
        var currentNode: BSTNode? = root // Optional 이 될 수 있으므로 따로 선언했다.
        
        // 삭제할 노드 탐색하기
        while let node = currentNode {
            if node.data == data { break }
            if node.data > data {
                currentNode = node.left
            } else {
                currentNode = node.right
            }
            
            parentNode = node
        }
        
        // 탐색 실패 - 삭제할 노드에서 current Node == nil 이 돼서 while 을 탈출했다면 여기서 false 를 받을 수 있다.
        guard let deleteNode = currentNode else {
            return false
        }
        
// ------------------------------ 공통 작업 -----------------------------------
        
        // Case 1: Child Node 가 0개인 Leaf Node 삭제
        if deleteNode.left == nil && deleteNode.right == nil {
            if parentNode.data > data {
                parentNode.left = nil
            } else {
                parentNode.right = nil
            }
            
            return true
        }
        
        // Case 2: Child Node 가 1개인 Node 삭제
        if (deleteNode.left != nil) && (deleteNode.right == nil) {
            if parentNode.data > data {
                parentNode.right = deleteNode.left
            } else {
                parentNode.left = deleteNode.left
            }
            
            return true
        }
        
        if (deleteNode.left == nil) && (deleteNode.right != nil) {
            if parentNode.data > data {
                parentNode.right = deleteNode.right
            } else {
                parentNode.left = deleteNode.right
            }
            
            return true
        }
        
        // Case 3: Child Node 가 2개인 Node 삭제
        /// 이때, 2가지의 Case 로 나눌 수 있다. 이 case 중 한 가지 방법으로만 구현하면 된다.
        /// 1️⃣ 삭제할 Node 의 "오른쪽" 자식 중, 가장 "작은" 값을 찾아 삭제할 부모 Node 가 가리키게 한다. -> 결국 오른쪽 자식 Node 중, left 의 브랜치를 계속 타고 내려가면 찾을 수 있다.
        /// 2️⃣ 삭제할 Node 의 "왼쪽" 자식 중, 가장 "큰" 값을 찾아 삭제할 부모 Node 가 가리키게 한다. -> 결국 왼쪽 자식 Node 중, right 의 브랜치를 계속 타고 내려가면 찾을 수 있다.
        /// 둘 다 구현해보자.
        
        // 삭제할 Node 의 "오른쪽" 자식 중, 가장 "작은" 값을 찾아 삭제할 부모 Node 가 가리키게 한다.
        /// Remove Node through getting smallest data of right Children's nodes. 1️⃣
        /// 이미 여기까지 왔다면 deleteNode 는 찾아 놓은 상태.
        guard let rightNode = deleteNode.right else { return false }
        
        var changeNode = rightNode
        var changeParentNode = rightNode
        
            // left 노드의 끝까지 타고 내려가기 (Finding smallest Data)
        while let nextNode = changeNode.left {
            changeParentNode = changeNode
            changeNode = nextNode
        }
        
        if let changeChildNode = changeNode.right {
            changeParentNode.left = changeChildNode
        } else {
            changeParentNode.left = nil
        }
        
        if parentNode.data > data {
            parentNode.left = changeNode
        } else {
            parentNode.right = changeNode
        }
        
            // Delete Node 의 왼쪽, 오른쪽 자식을 ChangeNode 에게 이식
        changeNode.left = deleteNode.left
        changeNode.right = deleteNode.right
        
// -------------------------------------------
        // 삭제할 Node 의 "왼쪽" 자식 중, 가장 "큰" 값을 찾아 삭제할 부모 Node 가 가리키게 한다.
        /// Remove Node through getting largest data of left Children's nodes. 2️⃣
//        guard let leftNode = deleteNode.left else { return false }
//
//        var changeNode2 = leftNode
//        var changeParentNode2 = leftNode
//
//            // right 노드의 끝까지 타고 내려가기 (Finding largest Data)
//        while let nextNode = changeNode2.right {
//            changeParentNode2 = changeNode2
//            changeNode2 = nextNode
//        }
//
//        if let changeChildNode = changeNode2.left {
//            changeParentNode2.right = changeChildNode
//        } else {
//            changeParentNode2.right = nil
//        }
//
//        if parentNode.data > data {
//            parentNode.left = changeNode2
//        } else {
//            parentNode.right = changeNode2
//        }
//
//        changeNode2.right = deleteNode.right
//        changeNode2.left = deleteNode.left
// -------------------------------------------
        
        return true
    }
}

    // MARK: - Drawing Methods
extension BinarySearchTree {
    func drawDiagram() {
        print(diagram(for: self.root))
    }
 
    private func diagram(for node: BSTNode<T>?,
                         _ top: String = "",
                         _ root: String = "",
                         _ bottom: String = "") -> String {
       guard let node = node else {
            return root + "nil\n"
        }
        if node.left == nil && node.right == nil {
            return root + "\(node.data)\n"
        }
        return diagram(for: node.right, top + " ", top + "┌──", top + "│ ")
            + root + "\(node.data)\n"
            + diagram(for: node.left, bottom + "│ ", bottom + "└──", bottom + " ")
    }
}

//let BST = BinarySearchTree<Int>()
//BST.insert(50)
//BST.insert(100)
//BST.insert(20)
//BST.insert(21)
//BST.insert(22)
//BST.insert(54)
//BST.insert(2)
//BST.insert(7)
//
//BST.drawDiagram()
//
//print("----------------------")
//
//BST.search(from: 7)
//BST.insert(120)
//BST.insert(33)
//
//BST.drawDiagram()
//
//print("----------------------")
//
//BST.remove(from: 2)
//BST.drawDiagram()
//
//print("----------------------")
//
//BST.remove(from: 20)
//BST.drawDiagram()
//
//print("----------------------")
//
//
