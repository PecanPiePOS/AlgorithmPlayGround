
import Foundation

    // MARK: - Stack as Class
class Stack<T> {
    private var array: [T] = []
    
    func push(_ item: T) {
        array.append(item)
    }
    
    func pop() -> T? {
        array.popLast()
    }
    
    func peek() -> T? {
        array.last
    }
    
    func isEmpty() -> Bool {
        return array.isEmpty
    }
    
    var count: Int {
        array.count
    }
}

    // MARK: - Stack as Struct
struct StackStruct<T> {
    private var array: [T] = []
    
    mutating func push(_ item: T) {
        array.append(item)
    }
    
    mutating func pop() -> T? {
        array.popLast()
    }
    
//    func peek() -> T? {
//        return array.last
//    }
    
    var peek: T? {
        return array.last
    }
    
    var isEmpty: Bool {
        array.isEmpty
    }
    
    var count: Int {
        array.count
    }
}
