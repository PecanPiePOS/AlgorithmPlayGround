
import Foundation

public func progressTime(_ closure: () -> ()) -> TimeInterval {
    let start = CFAbsoluteTimeGetCurrent()
    closure()
    let diff = CFAbsoluteTimeGetCurrent() - start
    print("--progress--")
    print(diff)
    print("----")

    return (diff)
}

class Node {
    var data: Int
    var next: Node?
    
    init(_ data: Int, _ next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

func length(_ head: Node?) -> Int {
    if head == nil {
        return 0
    }
    
    var headNode: Node? = head
    var length: Int = 0
    
    while headNode != nil {
        headNode = headNode?.next
        length += 1
    }
    
    return length
}

    // MARK: - Brute Force - O(M*N) > O(N^2)
func findMerge(_ headA: Node?, _ headB: Node?) -> Int? {
    
    let m = length(headA)
    let n = length(headB)
    
    var currentA = headA
    
    for _ in 0...m-1 { // O(N)
        var currentB = headB
        for _ in 0...n-1 { // O(M)
            let A = currentA?.data
            let B = currentB?.data
            
            if A == B {
                return A
            }
            
            currentB = currentB?.next
        }
        
        currentA = currentA?.next
    }
    
    return nil
}

let node10 = Node(10)
let node9 = Node(9, node10)
let node8 = Node(8, node9)
let node7 = Node(7, node8)
let node6 = Node(6, node7)
let node5 = Node(5, node6)
let node4 = Node(4, node5)
let node3 = Node(3, node4)
let node2 = Node(2, node3)
let node1 = Node(1, node2)

let node21 = Node(21, node4)
let node20 = Node(20, node21)

progressTime {
    findMerge(node1, node20)
}
// Dict 쓴거랑 비슷한데... 이게 수가 적어서 비슷하게 나오는건가...
// -> 그런듯 ㅎ
// Avg of 0.003 ~ 0.0035
