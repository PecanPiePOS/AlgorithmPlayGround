import Foundation

/*
 
 https://leetcode.com/problems/merge-in-between-linked-lists/
 
 You are given two linked lists: list1 and list2 of sizes n and m respectively.

 Remove list1's nodes from the ath node to the bth node, and put list2 in their place.

 The blue edges and nodes in the following figure indicate the result:
 
 Input: list1 = [0,1,2,3,4,5], a = 3, b = 4, list2 = [1000000,1000001,1000002]
 Output: [0,1,2,1000000,1000001,1000002,5]
 Explanation: We remove the nodes 3 and 4 and put the entire list2 in their place. The blue edges and nodes in the above figure indicate the result.
 
 Input: list1 = [0,1,2,3,4,5,6], a = 2, b = 5, list2 = [1000000,1000001,1000002,1000003,1000004]
 Output: [0,1,1000000,1000001,1000002,1000003,1000004,6]
 Explanation: The blue edges and nodes in the above figure indicate the result.
 
 */

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func mergeInBetween1(_ list1: ListNode?, _ a: Int, _ b: Int, _ list2: ListNode?) -> ListNode? {
        var aNode: ListNode?
        var bNode: ListNode?
        var node = list1
        
        for _ in 0..<a-1 {
            node = node?.next
        }
        
        aNode = node
        
        for _ in 0...(b-a) {
            node = node?.next
        }
        
        bNode = node
        
        node = list2
        
        while node?.next != nil {
            node = node?.next
        }
        
        node?.next = bNode?.next
        aNode?.next = list2
        
        return list1
    }
    
    func mergeInBetween2(_ list1: ListNode?, _ a: Int, _ b: Int, _ list2: ListNode?) -> ListNode? {
            var firstNode : ListNode?
            var lastNode: ListNode?
            var tempIteratingNode = list1
            var count = 0
            while tempIteratingNode != nil {
                if count + 1 == a {
                    firstNode = tempIteratingNode
                } else if count == b + 1 {
                    lastNode = tempIteratingNode
                    break
                }
                tempIteratingNode = tempIteratingNode?.next
                count = count + 1
            }
            firstNode?.next = list2
            tempIteratingNode = list2
            while tempIteratingNode?.next != nil {
                tempIteratingNode = tempIteratingNode?.next
            }
            tempIteratingNode?.next = lastNode
            return list1
        }
}

