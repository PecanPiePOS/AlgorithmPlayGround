
import Foundation

/*
 
 Find Merge Point of Two Lists
 
 Given pointers to the head nodes of 2 linked lists that merge together at some point, find the node where the two lists merge. The merge point is where both lists point to the same node, i.e. they reference the same memory location. It is guaranteed that the two head nodes will be different, and neither will be NULL. If the lists share a common node, return that node's data value.
 
 */

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

    // 내 solution: 들리게 되는 점에 count 를 올려서 처음 count 가 2가 되는 애를 리턴하자. 그렇지 않으면, nil 반환
func findMerge(_ headA: Node?, _ headB: Node?) -> Int? {
    var headCountDictionary: [Int: Bool] = [:]

    var nodeA: Node? = headA
    var nodeB: Node? = headB

    while nodeA != nil {
        if headCountDictionary[nodeA!.data] == true {
            print("A")
            print(nodeA!.data)
            return nodeA!.data
        }

        headCountDictionary[nodeA!.data] = true
        nodeA = nodeA?.next
    }

    while nodeB != nil {
        if headCountDictionary[nodeB!.data] == true {
            print("B")
            print(nodeB!.data)
            return nodeB!.data
        }

        headCountDictionary[nodeB!.data] == true
        nodeB = nodeB?.next
    }
    
    return nil
}

func prointLinkedList(head: Node?) {
    if head == nil { return }
    
    var result: [Int] = []
    var node = head
    result.append(node!.next!.data)
    
    while node?.next != nil {
        result.append(node!.next!.data)
        node = node?.next
    }
    
    print(result)
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

// Avg of 0.0021 ~ 0.0024 secs

