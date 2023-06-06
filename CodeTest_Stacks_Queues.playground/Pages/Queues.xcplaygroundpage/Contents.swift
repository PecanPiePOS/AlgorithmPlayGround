
import Foundation

public func progressTime(_ closure: () -> ()) -> TimeInterval {
    let start = CFAbsoluteTimeGetCurrent()
    closure()
    let diff = CFAbsoluteTimeGetCurrent() - start
//    print("--progress--")
    print(diff)
//    print("----")

    return (diff)
}

class Queue<T> {
    var array: [T] = []
    
    func enqueue(_ item: T) {
        array.append(item)
    }
    
    func dequeueMySolutionUsingReversed() -> T? {
        if isEmpty == true {
            return nil
        } else {
            var reversedArray = Array(array.reversed())
            let poppedItem =  reversedArray.popLast()
            array = Array(reversedArray.reversed())
            return poppedItem
        }
    }
    
    func dequeueOriginal() -> T? {
        if isEmpty == true {
            return nil
        } else {
            return array.removeFirst()
        }
    }
    
    var isEmpty: Bool {
        array.isEmpty
    }
}

var kkk = [Int](repeating: 264598, count: 1000)
var ppp = [Int](repeating: 264598, count: 10000)

let queue1 = Queue<Int>()
let queue2 = Queue<Int>()

queue1.array = kkk
queue2.array = ppp

print("1000개 - Reversed")
progressTime {
    let p = queue1.dequeueMySolutionUsingReversed()
}
print("-----------------------")

print("1000개 - Original")
progressTime {
    let q = queue1.dequeueOriginal()
}
print("-----------------------")

print("10000개 - Reversed")
progressTime {
    let m = queue2.dequeueMySolutionUsingReversed()
}
print("-----------------------")

print("10000개 - Original")
progressTime {
    let n = queue2.dequeueOriginal()
}
print("-----------------------")
