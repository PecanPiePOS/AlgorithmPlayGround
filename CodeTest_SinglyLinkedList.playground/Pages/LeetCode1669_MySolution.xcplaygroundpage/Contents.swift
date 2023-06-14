import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

    /// 하... 왤케 머리에 각인이 안될까... ㅜ
class Solution {
    func mergeInBetween(_ list1: ListNode?, _ a: Int, _ b: Int, _ list2: ListNode?) -> ListNode? {
        var head = list1
        var aHead: ListNode?
        var bHead: ListNode?
        
        for _ in 0..<a-1 {
            head = head?.next
        }
        
        aHead = head
        
        for _ in 0...(b-a) {
            head = head?.next
        }
        
        bHead = head
        head = list2
        
        while head?.next != nil {
            head = head?.next
        }
        
        head?.next = bHead?.next
        aHead?.next = list2
        
        return list1
    }
}
