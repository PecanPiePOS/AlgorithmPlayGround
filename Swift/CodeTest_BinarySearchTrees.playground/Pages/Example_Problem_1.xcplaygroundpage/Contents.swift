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

//func isBSTValid(node: Node?) -> Node? {
//    guard let node,
//            let leftKey = node.left?.key,
//            let rightKey = node.right?.key else {
//        return nil
//    }
//
//    var isValid: Bool = leftKey < node.key || rightKey > node.key
//
//    switch isValid {
//    case true:
//        node =
//        isBSTValid(node: node)
//    case false:
//
//    }
//
//    return nil
//}

func isBST(_ node: Node?, _ min: Int?, _ max: Int?) -> Bool {
    print("Comparing: \(node?.key) min: \(min) max: \(max)")
    
    // if nil we hit the end of the branch - OK
    guard let node else { return true }
    
    // else check if min < parent
    if let min, node.key <= min {
        print("min: \(min) key: \(node.key)")
        return false
    }

    // check if max > parent
    if let max, node.key >= max {
        print("max: \(max) key: \(node.key)")
        return false
    }

    // if min max OK, go to next level passing in min/max and parent
    return isBST(node.left, min, node.key)
}

