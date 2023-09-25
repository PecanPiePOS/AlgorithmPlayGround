import Foundation

/*
 
 Given the head of a singly linked list, group all the nodes with odd indices together followed by the nodes with even indices, and return the reordered list.

 The first node is considered odd, and the second node is even, and so on.

 Note that the relative order inside both the even and odd groups should remain as it was in the input.

 You must solve the problem in O(1) extra space complexity and O(n) time complexity.
 
 
 Input: head = [1,2,3,4,5]
 Output: [1,3,5,2,4]
 
 Input: head = [2,1,3,5,6,4,7]
 Output: [2,3,6,7,1,5,4]
 
 */

    /// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
 
    /// WHAT THE HELL IS WRONG WITH ANSWERS. I'M NOT GETTING ANYTHING.... 😰
class Solution {
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        var node = head
        var evenHead = head
        var oddHead = head
        var oddCount = findOddCount(head)
        
        while node?.next != nil {
            guard let data = node?.val else { return ListNode() }
            if data % 2 == 1 {
                
            }
            
        }
        
        return head
    }
    
    func findOddCount(_ head: ListNode?) -> Int {
        var count = 0
        var node = head
        
        while node?.next != nil {
            guard let data = node?.val else { return 0 }
            if data % 2 == 1 { // odd
                count += 1
            }
            
            node = node?.next
        }
        
        return count
    }
}
