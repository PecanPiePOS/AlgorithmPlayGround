
import Foundation

/*
 
 Find Merge Point of Two Lists
 
 Given pointers to the head nodes of 2 linked lists that merge together at some point, find the node where the two lists merge. The merge point is where both lists point to the same node, i.e. they reference the same memory location. It is guaranteed that the two head nodes will be different, and neither will be NULL. If the lists share a common node, return that node's data value.
 
 */

// MARK: DIDN'T GET THAT ALL

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

func findMergeInsight(_ headA: Node?, _ headB: Node?) -> Int? {
    /*
     
     Figure out which is longer
     Swap if necessary
     
     Calculate the diff of each length: d
     
     Walk d for longer
     Walk remainder for both
     
     */
    
    let m = length(headA)
    let n = length(headB)
    
    var currentA = headA
    var currentB = headB

    if n > m {
        let temp = currentA
        currentA = currentB
        currentB = temp
    }
    
    let d: Int = abs(m - n)
    
    for _ in 1...d {
        currentA = currentA?.next
    }
    
    for _ in 0...n-1 {
        let A = currentA?.data
        let B = currentB?.data
        
        if A == B {
            return A
        }
        currentA = currentA?.next
        currentB = currentB?.next
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
    findMergeInsight(node20, node1)
}

// If we figure out which is shorter?
// "Just add condition and swap them."
// Avg of 0.0017 ~ 0.0023 secs

// If we DON'T figure out which is shorter?
// Avg of 0.0024 ~ 0.0032 secs
