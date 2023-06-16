import Foundation

/*
 
 Given head which is a reference node to a singly-linked list. The value of each node in the linked list is either 0 or 1. The linked list holds the binary representation of a number.

 Return the decimal value of the number in the linked list.

 The most significant bit is at the head of the linked list.
 
 Input: head = [1,0,1]
 Output: 5
 Explanation: (101) in base 2 = (5) in base 10
 
 Input: head = [0]
 Output: 0
 
 */

// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
 

class Solution {
    func getDecimalValue(_ head: ListNode?) -> Int {
        var node: ListNode? = head
        var stringResult = ""
        
        while node != nil {
            guard let nodeUnwrapped = node else { return 0 }
            stringResult.append(String(nodeUnwrapped.val))
            node = node?.next
        }
         
        return Int(stringResult, radix: 2)!
    }
}

//[1,0,0,1,0,0,1,1,1,0,0,0,0,0,0]


let o15 = ListNode(0)
let o14 = ListNode(0, o15)
let o13 = ListNode(0, o14)
let o12 = ListNode(0, o13)
let o11 = ListNode(0, o12)

let o10 = ListNode(0, o11)
let o9 = ListNode(1, o10)
let o8 = ListNode(1, o9)
let o7 = ListNode(1, o8)
let o6 = ListNode(0, o7)
let o5 = ListNode(0, o6)
let o4 = ListNode(1, o5)
let o3 = ListNode(0, o4)
let o2 = ListNode(0, o3)

let o1 = ListNode(1, o2)

let ooo = Solution()
ooo.getDecimalValue(o1)

// 18,880


