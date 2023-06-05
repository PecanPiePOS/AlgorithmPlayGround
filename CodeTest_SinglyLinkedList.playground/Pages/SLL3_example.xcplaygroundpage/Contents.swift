
import Foundation

/*
 
 Detect a Cycle
 
 https://www.hackerrank.com/challenges/ctci-linked-list-cycle/problem
 
 A linked list is said to contain a cycle if any node is visited more than once while traversing the list. For example, in the following graph there is a cycle formed when node 5 points back to node 3.
 
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

func hasCycleMine(first: Node?) -> Bool {
    if first == nil {
        return false
    }
    
    var node = first
    var dictionaryForCheck: [Int: Bool] = [:]
    
    while node != nil {
        if dictionaryForCheck[node!.data] == true {
            print(node!.data)
            return true
        }
        
        dictionaryForCheck[node!.data] = true
        node = node?.next
    }
    
    return false
}

func hasCycleTortoiseHare(first: Node) -> Bool {
    var slow: Node? = first
    var fast: Node? = first
    
    while fast != nil && fast!.next != nil {
        slow = slow?.next
        fast = fast?.next?.next
        
        if slow?.data == fast?.data {
            return true
        }
    }
    
    return false
}

let node5 = Node(5)
let node4 = Node(4)
let node3 = Node(3)
let node2 = Node(2)
let head = Node(1)

head.next = node2
node2.next = node3
node3.next = node4
node4.next = node5
node5.next = node3

print("📍")

progressTime {
    hasCycleTortoiseHare(first: head)
}
// Avg of 0.00046 ~ 0.00050 secs
