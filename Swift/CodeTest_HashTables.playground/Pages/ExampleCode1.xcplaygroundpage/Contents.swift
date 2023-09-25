import Foundation

let MAX_TBL = 100

typealias HashFunction = (Int) -> Int
private var hashFuntion : HashFunction? = nil

struct Slot { // Key-Value 관리
    let key : Int
    var value : String
    
    init(key: Int, value: String) {
        self.key = key
        self.value = value
    }
}

class Table {
    private (set) var hashList = [[Slot]](repeating: [], count: MAX_TBL)
    private (set) var hashFunc : HashFunction? = nil
    
    convenience init(hashFunc: @escaping HashFunction) {
        self.init()
        self.hashFunc = hashFunc
    }
    
    public func insert(key: Int, value: String) {
        
        if self.search(key: key) == nil {
            let hash = self.hashFunc!(key)
            self.hashList[hash].append(Slot.init(key: key, value: value))
            
        } else {
            NSLog("Error!! => Duplicated Key")
        }
    }
    
    public func search(key: Int) -> String? {
        
        let hash = self.hashFunc!(key)
        for slot in self.hashList[hash] {
            if slot.key == key { return slot.value }
        }
        return nil
    }
    
    public func delete(key: Int) -> String? {
        
        let hash = self.hashFunc!(key)
        
        for i in 0..<self.hashList[hash].count {
            let slot = self.hashList[hash][i]
            if slot.key == key {
                self.hashList[hash].remove(at: i)
                return slot.value
            }
        }
        
        return nil
    }
}



func myHashFunc(k: Int) -> Int { return k % 100 }

let table : Table = Table.init(hashFunc: myHashFunc)

// 데이터 입력
table.insert(key: 900254, value: "윤아")
table.insert(key: 900139, value: "서현")
table.insert(key: 900827, value: "태연")

// 데이터 탐색
NSLog("value is %@", table.search(key: 900254) ?? "nil")
NSLog("value is %@", table.search(key: 900139) ?? "nil")
NSLog("value is %@", table.search(key: 900827) ?? "nil")

// 데이터 삭제
NSLog("deleted slot's value is %@", table.delete(key: 900254) ?? "nil")
NSLog("deleted slot's value is %@", table.delete(key: 900139) ?? "nil")
NSLog("deleted slot's value is %@", table.delete(key: 900827) ?? "nil")
