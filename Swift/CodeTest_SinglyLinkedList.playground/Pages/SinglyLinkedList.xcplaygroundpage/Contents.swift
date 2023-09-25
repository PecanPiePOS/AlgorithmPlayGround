
import Foundation

class Node {
    var data: Int
    var next: Node?
    
    init(_ data: Int, _ next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

let node4 = Node(4)
let node3 = Node(3, node4)
let node2 = Node(2, node3)
let node1 = Node(1, node2)



    // MARK: - 단방향 linked list
    // head 밖에 없으므로, 만약 검색을 시행한다면, 무조건
    // 처음부터 찾는 수 밖에 없다.
class SinglyLinkedList {
    private var head: Node?
    
    // MARK: O(1)
    func addFront(_ data: Int) {
        let newNode = Node(data)
        // 여기서의 head 는 기존의 첫번째 Node 를 의미한다.
        newNode.next = head
        head = newNode
    }
    
    // MARK: O(1)
    func getFirst() -> Int? {
        if head == nil {
            return nil
        }
        
        return head?.data
    }
    
    // MARK: O(N)
    func addBack(_ data: Int) {
        let newNode = Node(data)
        
        if head == nil {
            head = newNode
            return
        }
        
        var node = head
        while node!.next != nil {
            node = node!.next
        }
        
        node?.next = newNode
    }

    
    // MARK: O(N)
    func getLast() -> Int? {
        if head == nil {
            return nil
        }
        
        var node = head
        while node?.next != nil {
            node = node?.next
        }
        
        return node?.data
    }
    
    // MARK: O(N)
    func insert(position: Int, data: Int) {
        if position == 0 {
            addFront(data)
            return
        }
        
        let newNode = Node(data)
        var currentNode = head
        
        // MARK: if the index gets out of bound, the new node is added at the back of the list.
        for _ in 0..<position-1 {
            if currentNode?.next == nil {
                print("Out of Bound. Added at back.")
                addBack(data)
                return
            }
            currentNode = currentNode?.next
        }
        
        newNode.next = currentNode?.next
        currentNode?.next = newNode
    }

    
    // MARK: O(1), Skip and Reassign the next.
    func deleteFirst() {
        head = head?.next
    }

    // MARK: O(N), Get record of previous node.
    func deleteLast() {
        var nextNode = head
        var previousNode: Node?
        
        while nextNode?.next != nil {
            previousNode = nextNode
            nextNode = nextNode?.next
        }
        
        // MARK: Requisite Check
        previousNode?.next = nil
    }
    
    var isEmpty: Bool {
        return head == nil
    }
    
    func clear() {
        self.head = nil
    }
    
    // MARK: O(N), Get record of previous node.
    func delete(at position: Int) {
        if position == 0 {
            deleteFirst()
            return
        }
        
        var nextNode = head
        var previousNode: Node?
        
        for _ in 0..<position {
            previousNode = nextNode
            nextNode = nextNode?.next
        }
        
        previousNode?.next = nextNode?.next
    }
    
    func printLinkedListSimple() {
        if head == nil { return }
        
        var result: [Int] = []
        var node = head
        result.append(node!.data)
        
        while node?.next != nil {
            result.append(node!.next!.data)
            node = node?.next
        }
        
        print(result)
    }
}


let example = SinglyLinkedList()
example.addFront(3)
example.addFront(2)
example.addFront(1)

example.printLinkedListSimple()

example.addFront(40)

example.addBack(50)
example.insert(position: 6, data: 90)
example.printLinkedListSimple()

example.deleteLast()
example.delete(at: 2)
example.printLinkedListSimple()

example.isEmpty
example.clear()
example.isEmpty

