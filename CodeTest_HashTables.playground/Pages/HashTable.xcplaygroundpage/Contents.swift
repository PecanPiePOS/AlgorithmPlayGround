import Foundation

/*
 
 Generally, if the Hash Table Struct has been made correctly, the time Complexity of the functions will be O(1). Worst at O(N).
 If Hash Collision happens it will be O(N)
 
 */


/// Linked List
class HashEntry {
    var key: String
    var value: String
    var next: HashEntry?
    
    init(_ key: String, _ value: String) {
        self.key = key
        self.value = value
    }
}

///// Hash Table
//class HashTable {
//    private static let initialSize = 256
//    private var entries = [HashEntry?](repeating: nil, count: initialSize)
//
//
//}
