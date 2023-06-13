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

/// Hash Table
class HashTable {
    private static let initialSize = 256
    private var entries = [HashEntry?](repeating: nil, count: initialSize)

    func put(key: String, value: String) {
        let index = getIndex(key)
        
        let entry = HashEntry(key, value)
        
        if entries[index] == nil {
            entries[index] = entry
        } else {
            var collisions = entries[index]
            
            while collisions?.next != nil {
                collisions = collisions?.next
            }
            
            collisions?.next = entry
        }
    }
    
    func getValue(_ key: String) -> String? {
        let index = getIndex(key)
        
        let possibleCollisions = entries[index]
        
        var currentEntry = possibleCollisions
        while currentEntry != nil {
            if currentEntry?.key == key {
                return currentEntry?.value
            }
            
            currentEntry = currentEntry?.next
        }
        
        return nil
    }
    
    func getIndex(_ key: String) -> Int {
        let hashCode = abs(key.hashValue)
        
        let index = hashCode % HashTable.initialSize
        print("\(key) - \(hashCode) - \(index)")
        
        // Forced Collisions
        if key == "John Smith" || key == "Sandra Dee" {
            return 152
        }
        
        return index
    }
    
    subscript(key: String) -> String? {
        get {
            getValue(key)
        }
        set(newValue) {
            guard let value = newValue else { return }
            put(key: key, value: value)
        }   
    }
}
