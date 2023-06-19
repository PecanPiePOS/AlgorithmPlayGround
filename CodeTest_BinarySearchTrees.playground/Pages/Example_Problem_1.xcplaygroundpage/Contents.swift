import Foundation

/*
 
 Given the root node of a binary tree, determine if it is a binary search tree.

 */

class Node {
    var key: Int
    var left: Node?
    var right: Node?
    
    init(_ data: Int) {
        self.key = data
    }
}

func checkBST(root: Node?) -> Bool {
    return isBSTValid(root, nil, nil)
}

