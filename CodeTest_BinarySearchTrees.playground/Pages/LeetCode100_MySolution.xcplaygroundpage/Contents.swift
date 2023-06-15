import Foundation

/*
 
 Given the roots of two binary trees p and q, write a function to check if they are the same or not.
 
 Two binary trees are considered the same if they are structurally identical, and the nodes have the same value.
 
 Input: p = [1,2,3], q = [1,2,3]
 Output: true
 
 Input: p = [1,2], q = [1,null,2]
 Output: false
 
 Input: p = [1,2,1], q = [1,1,2]
 Output: false
 
 */

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        
    }
}
