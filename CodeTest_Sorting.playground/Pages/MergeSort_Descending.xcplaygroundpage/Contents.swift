import Foundation


func mergeSortDescending<T: Comparable>(_ array: [T]) -> [T] {
    let count = array.count
    guard count > 1 else { return array }
    
    let midIndex = count/2
    let left = Array(array[0..<midIndex])
    let right = Array(array[midIndex..<count])
    
    return merge(left: mergeSortDescending(left), right: mergeSortDescending(right))
}

func merge<T: Comparable>(left: [T], right: [T]) -> [T] {
    var leftArray = left
    var rightArray = right
    var result: [T] = []
    
    while !leftArray.isEmpty && !rightArray.isEmpty {
        if leftArray[0] > rightArray[0] {
            result.append(leftArray.removeFirst())
        } else {
            result.append(rightArray.removeFirst())
        }
    }
    
    if !leftArray.isEmpty {
        result += leftArray
    }
    
    if !rightArray.isEmpty {
        result += rightArray
    }
    
    return result
}

let array: [Int] = [9,47,34,72,1,23,66,54,43,78,70,71,99,6,555, 444, 444, 4256,24623,23424,234,24,52,523,62,62,4735,7,4573,5,62,4352,4,5234,624,372,57,2435,234,7,124,85,68,3,562,43,28,46,8568, 9,47,34,72,1,23,66,54,43,78,70,71,99,6,555, 444, 444, 4256,24623,23424,234,24,52,523,62,62,4735,7,4573,5,62,4352,4,5234,624,372,57,2435,234,7,124,85,68,3,562,43,28,46,8568,9,47,34,72,1,23,66,54,43,78,70,71,99,6,555, 444, 444, 4256,24623,23424,234,24,52,523,62,62,4735,7,4573,5,62,4352,4,5234,624,372,57,2435,234,7,124,85,68,3,562,43,28,46,8568]

public func progressTime(_ closure: () -> ()) -> TimeInterval {
    let start = CFAbsoluteTimeGetCurrent()
    closure()
    let diff = CFAbsoluteTimeGetCurrent() - start
    print(diff)
    
    return (diff)
}


progressTime {
    let k = mergeSortDescending(array)
    print(k)
}

