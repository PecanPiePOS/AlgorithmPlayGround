
import Foundation

public func progressTime(_ closure: () -> ()) -> TimeInterval {
    let start = CFAbsoluteTimeGetCurrent()
    closure()
    let diff = CFAbsoluteTimeGetCurrent() - start
    
    print(diff)

    return (diff)
}

class QueueWithDoubleArray<T> {
    var originalArray: [T]
    var enqueueArray: [T]
    var dequeueArray: [T] = []
    
    var isEmpty: Bool {
        return enqueueArray.isEmpty && dequeueArray.isEmpty
    }
    
    var count: Int {
        return enqueueArray.count + dequeueArray.count
    }
    
    var peek: T? {
        return dequeueArray.isEmpty ? enqueueArray.first : dequeueArray.last
    }
    
    init(_ queue: [T]) {
        self.enqueueArray = queue
        self.originalArray = queue
    }
    
    func enqueue(_ item: T) {
        enqueueArray.append(item)
    }
    
    func dequeue() -> T? {
        if dequeueArray.isEmpty {
            dequeueArray = enqueueArray.reversed()
            enqueueArray.removeAll()
        }
        print(dequeueArray.count)
        return dequeueArray.popLast()
    }
    
    func dequeueOriginal() -> T? {
        if enqueueArray.isEmpty {
            enqueueArray = originalArray
        }
        print(enqueueArray.count)
        return enqueueArray.removeLast()
    }
}

var kkk = [1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 1]
var ppp = [1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 8, 9, 10, 11, 12, 8, 9, 10, 11, 12, 8, 9, 10, 11, 12, 8, 9, 10, 11, 12, 8, 9, 10, 11, 12, 8, 9, 10, 11, 12, 8, 9, 10, 11, 12, 8, 9, 10, 11, 12, 8, 9, 10, 11, 12, 8, 9, 10, 11, 12, 8, 9, 10, 11, 12, 8, 9, 10, 11, 12, 8, 9, 10, 11, 12, 8, 9, 10, 11, 12, 8, 9, 10, 11, 12, 1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 1, 2, 3, 4, 5]

let queue1 = QueueWithDoubleArray(kkk)
let queue2 = QueueWithDoubleArray(ppp)

print("1000개 - Reversed")
progressTime {
    let b = queue1.dequeue()
}

print("1000개 - Original")
progressTime {
    let b = queue1.dequeueOriginal()
}

print("10000개 - Reversed")
progressTime {
    let k = queue2.dequeue()
}

print("10000개 - Original")
progressTime {
    let k = queue2.dequeueOriginal()
}
