import Foundation

    /// Simple Way to do it.
    /// Time Complexity of O(NlogN).
func kthLargest(array: [Int], k: Int) -> Int? {
    let length = array.count
    if k > 0 && k <= length {
        let sortedArray = array.sorted()
        let result = sortedArray[length-k]
        return result
    }
    return nil
}

    /// Faster Way to do it.
    /// Make it with using Binary Search and QuickSort,
    /// which can make the Time Complexity of O(N)
    /**
     
     1. QuickSort 처럼 Pivot 을 잡고, 반으로 나눈다.
     2. 배열의 크기와 k 를 비교하여 k 가 반영되는 배열을 선택한다.
     
     */
func randomizedSelect<T: Comparable>(_ array: [T], order k: Int) -> T {
    var a = array
    
    func randomPivot<T: Comparable>(_ a: inout [T], _ low: Int, _ high: Int) -> T {
        let pivotIndex = random(min: low, max: high)
        a.swapAt(pivotIndex, high)
        return a[high]
    }
    
    func randomizedPartition<T: Comparable>(_ a: inout [T], _ low: Int, _ high: Int) -> Int {
        let pivot = randomPivot(&a, low, high)
        var i = low
        for j in low..<high {
            if a[j] <= pivot {
                a.swapAt(i, j)
                i += 1
            }
        }
        a.swapAt(i, high)
        return i
    }
    
    func randomizedSelect<T: Comparable>(_ a: inout [T], _ low: Int, _ high: Int, _ k: Int) -> T {
        if low < high {
            let p = randomizedPartition(&a, low, high)
            if k == p {
                return a[p]
            } else if k < p {
                return randomizedSelect(&a, low, p - 1, k)
            } else {
                return randomizedSelect(&a, p + 1, high, k)
            }
        } else {
            return a[low]
        }
    }
    
    precondition(a.count > 0)
    return randomizedSelect(&a, 0, a.count - 1, k)
}
