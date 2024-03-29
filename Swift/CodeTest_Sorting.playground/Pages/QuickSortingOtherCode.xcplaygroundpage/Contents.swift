import Foundation

public func progressTime(_ closure: () -> ()) -> TimeInterval {
    let start = CFAbsoluteTimeGetCurrent()
    closure()
    let diff = CFAbsoluteTimeGetCurrent() - start
    print(diff)
    
    return (diff)
}

var array = [4,6,68,5,2,1,3,8,48,7,14,22,17]

extension Array where Element == Int {
    
    mutating func sortByQuick() -> [Element] {
        return divide(self)
    }
    
    func divide(_ list:[Element]) -> [Element] {
        if list.count < 2 { return list }
        var newList:[Element] = list
        let pivotIndex:Int = newList.count/2-1
        var leftIndex:Int = 0
        var rightIndex:Int = newList.count-1
        var isLeft:Bool = true
        
        while leftIndex < rightIndex {
            if isLeft {
                if newList[leftIndex] < newList[pivotIndex] {
                    leftIndex += 1
                }else {
                    newList.swapAt(pivotIndex, leftIndex)
                }
            }else {
                if newList[rightIndex] > newList[pivotIndex] {
                    rightIndex -= 1
                }else {
                    newList.swapAt(pivotIndex, rightIndex)
                }
            }
            isLeft.toggle()
        }
     
        let left:[Element] = Array(newList[0...leftIndex])
        let right:[Element] = Array(newList[leftIndex+1..<newList.count])
        return merge(divide(left),divide(right))
    }
    
    func merge(_ left:[Element],_ right:[Element]) -> [Element] {
        return left + right
    }
}

/// Avg time of 0.0092 s
progressTime {
    array.sortByQuick()
}

