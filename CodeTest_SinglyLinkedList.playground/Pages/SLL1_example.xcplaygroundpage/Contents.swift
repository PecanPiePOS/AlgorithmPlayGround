
import Foundation

    // MARK: - Get the length of linked list
    // We KNOW getting length of Linked List is waste of time. It's just a practice of fully understanding Linked List.
class NodeExample1 {
    var data: Int?
    var next: NodeExample1?
    
    init(_ data: Int, _ next: NodeExample1? = nil) {
        self.data = data
        self.next = next
    }
}

func length(_ head: NodeExample1?) -> Int {
    if head == nil {
        return 0
    }
    
    var headNode: NodeExample1? = head
    var length: Int = 0
    
    while headNode != nil {
        headNode = headNode?.next
        length += 1
    }
    
    print(length)
    return length
}

let node6 = NodeExample1(6)
let node5 = NodeExample1(5, node6)
let node4 = NodeExample1(4, node5)
let node3 = NodeExample1(3, node4)
let node2 = NodeExample1(2, node3)
let node1 = NodeExample1(1, node2)

length(node1)
