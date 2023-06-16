import Foundation

/// Codes are from the Udemy Course.

class Node<T: Comparable> {
    var data: T
    var left: Node?
    var right: Node?
    
    init(data: T) {
        self.data = data
    }
    
    var minimumData: Node {
        if left == nil {
            return self
        } else {
            guard let left else { return Node(data: 0 as! T) }
            return left.minimumData
        }
    }
    
    var maximumData: Node {
        if right == nil {
            return self
        } else {
            guard let right else { return Node(data: 0 as! T)}
            return right.maximumData
        }
    }
    
    var isLeaf: Bool {
        return left == nil && right == nil
    }
    
    var isFull: Bool {
        return left != nil && right != nil
    }
}

class BSTRecursive<T: Comparable> {
    var root: Node<T>?
    
    func insert(data: T) {
        root = insertData(of: root, data: data)
    }
    
    private func insertData(of node: Node<T>?, data: T) -> Node<T>? {
        guard let node = node else {
            return Node(data: data)
        }
        
        if node.data == data {
            print("Error. It's duplicate data.")
            return nil
        }
        
        if node.data > data {
            node.left = insertData(of: node.left, data: data)
        } else {
            node.right = insertData(of: node.right, data: data)
        }
        
        return node
    }
    
    func searchData(of data: T) -> Node<T>? {
        guard let root = self.root else { return nil }
        guard let node = search(node: root, data: data) else { return nil }
        
        return node
    }
    
    private func search(node: Node<T>?, data: T) -> Node<T>? {
        guard let node = node else { return nil }
        
        if node.data == data {
            return node
        } else if node.data > data {
            return search(node: node.left, data: data)
        } else if node.data < data {
            return search(node: node.right, data: data)
        }
        
        return nil
    }
}

extension BSTRecursive {
    
//    func delete(data: T) {
//        guard let _ = root else { return }
//        root = deleteData(&root, data)
//    }
//
//    private func deleteData(_ node: inout Node<T>?, _ data: T) -> Node<T>? {
//        guard let deleteNode = node else { return nil }
//
//        if data < deleteNode.data {
//            deleteNode.left = deleteData(&deleteNode.left, data)
//        } else if data > deleteNode.data {
//            deleteNode.right = deleteData(&deleteNode.right, data)
//        } else {
//
//            // Case 1: When Leaf
//            if deleteNode.isLeaf {
//                node = nil
//            }
//
//            // Case 2: When with One Child
//            else if deleteNode.left == nil {
//                node = deleteNode.right
//            } else if deleteNode.right == nil {
//                node = deleteNode.left
//            }
//
//            // Case 3: When Full
//            else {
//                guard let node else { return nil }
//                let minRight = deleteNode.minimumData
//
//                node.data = minRight.data
//                node.right = deleteData(&node.right, node.data)
//            }
//        }
//
//        return deleteNode
//    }
    
    func findMin() -> T {
        guard let root = root else { return 0 as! T }
        return findMin(root).data
    }

    private func findMin(_ node: Node<T>) -> Node<T> {
        return node.minimumData
    }

    func delete(data: T) {
            guard let _ = root else { return }
            root = delete(&root, data)
        }

    private func delete(_  node: inout Node<T>?, _ data: T) -> Node<T>? {
            guard let nd = node else { return nil }

            if data < nd.data {
                nd.left = delete(&nd.left, data)
            } else if data > nd.data {
                nd.right = delete(&nd.right, data)
            } else {
                // Woohoo! Found you. This is the node we want to delete.

                // Case 1: No child
                if nd.left == nil && nd.right == nil {
                    return nil
                }

                // Case 2: One child
                else if nd.left == nil {
                    return nd.right // check delete(&insideNode.right, key) not necessary because we have already found
                }
                else if nd.right == nil {
                    return nd.left // delete(&insideNode.left, key)
                }

                // Case 3: Two children
                else {
                    // Find the minimum node on the right (could also find max on the left)
                    let minRight = findMin(nd.right!)

                    // Duplicate it by copying its value here
                    nd.data = minRight.data

                    // Now go ahead and delete the node we just duplicated (same key)
                    nd.right = delete(&nd.right, nd.data)
                }
            }

            return nd
        }
}

extension BSTRecursive {
    
    func drawDiagram() {
        print(diagram(for: self.root))
    }
    
    private func diagram(for node: Node<T>?,
                         _ top: String = "",
                         _ root: String = "",
                         _ bottom: String = "") -> String {
        guard let node = node else {
            return root + "nil\n"
        }
        if node.left == nil && node.right == nil {
            return root + "\(node.data)\n"
        }
        return diagram(for: node.right, top + " ", top + "┌──", top + "│ ")
        + root + "\(node.data)\n"
        + diagram(for: node.left, bottom + "│ ", bottom + "└──", bottom + " ")
    }
}

let bst = BSTRecursive<Int>()
bst.insert(data: 5)
bst.insert(data: 3)
bst.insert(data: 2)
bst.insert(data: 4)
bst.insert(data: 7)
bst.insert(data: 6)
bst.insert(data: 8)

bst.drawDiagram()
print("-------")

bst.delete(data: 3)
bst.drawDiagram()
