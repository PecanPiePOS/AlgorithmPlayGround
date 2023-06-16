import Foundation

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
print("-")
