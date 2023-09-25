import UIKit

/**
 
 배열에서 랜덤한 k 개의 item 을 선택한다. 다만 중복된 아이템이 선택이 되면 안된다.
 
 기본적인 원리는, random 한 item 이 결정되면, 해당 item 을 맨 앞으로 스왑하고, 해당 index + 1 부터 random 할 범위를 정한다.
 
 방식이 2가지 이다. 알아보자.
 
 */
    
    /// arc4random 을 사용한 방법.
func selectArc<T>(from a: [T], count requested: Int) -> [T] {
    var examined = 0
    var selected = 0
    var b = [T]()
    
    while selected < requested {                          // 1
        let r = Double(arc4random()) / 0x100000000          // 2
        
        let leftToExamine = a.count - examined              // 3
        let leftToAdd = requested - selected
        
        if Double(leftToExamine) * r < Double(leftToAdd) {  // 4
            selected += 1
            b.append(a[examined])
        }
        
        examined += 1
    }
    return b
}

    /// O(K) 에 대해서... 이게 속도가 맞나...
func select<T>(from a: [T], count k: Int) -> [T] {
    var a = a
    for i in 0..<k {
        let r = Int.random(in: i...a.count - 1)
        if i != r {
            a.swapAt(i, r)
        }
    }
    return Array(a[0..<k])
}

    /// Dictionary 를 사용한 방법.
func selectRandom<T: Hashable>(from array: [T], count k: Int) -> [T] {
    var dictionary: [Int: T] = [:]
    var resultArray: [T] = []
    var arrayCount = array.count
    
    for (index, item) in array.enumerated() {
        dictionary[index] = item
    }
    
    for _ in 0..<k {
        guard let randomKey = dictionary.keys.randomElement(), let randomValue = dictionary[randomKey] else { return [] }
        resultArray.append(randomValue)
        dictionary[randomKey] = nil
    }
    return resultArray
}

public func progressTime(_ closure: () -> ()) -> TimeInterval {
    let start = CFAbsoluteTimeGetCurrent()
    closure()
    let diff = CFAbsoluteTimeGetCurrent() - start
    print(diff)
    
    return (diff)
}

let array = Array(0...100000)

progressTime {
    // 10000 -> count 100: 0.08
    // 10000 -> count 1000: 0.44
    // 100000 -> Count 1000: 1.18
    // 100000 -> Count 30: 0.45
    // 100000 -> Count 10000: 21.9
    _ = selectRandom(from: array, count: 10000)
}

//progressTime {
//    // 10000 -> count 100: 0.39
//    // 10000 -> count 1000: 3.55
//    // 100000 -> Count 1000: 33.1
//    /// OUT OF LEAGUE
//    _ = select(from: array, count: 1000)
//}

progressTime {
    // 10000 -> count 100: 0.15
    // 10000 -> count 1000: 0.56
    // 100000 -> Count 1000: 1.16
    // 100000 -> Count 10000: 20.3
    _ = selectArc(from: array, count: 10000)
}


