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
    return false
}

func isBSTValid(node: Node?) -> Node? {
    guard let node,
            let leftKey = node.left?.key,
            let rightKey = node.right?.key else {
        return nil
    }
    
    var isValid: Bool = leftKey < node.key || rightKey > node.key
    
    switch isValid {
    case true:
        node = 
        isBSTValid(node: node)
    case false:
        
    }
    
    return nil
}

//func checkBST(root: Node?) -> Bool {
//    return isBSTValid(root, nil, nil)
//}
//
//func isBST(_ node: Node?, _ min: Int?, _ max: Int?) -> Bool {
//    print("Comparing: \(node?.key) min: \(min) max: \(max)")
//
//
//
//
//
//    return false
//}

