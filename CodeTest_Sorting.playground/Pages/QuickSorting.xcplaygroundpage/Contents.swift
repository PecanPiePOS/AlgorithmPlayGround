import Foundation

/*
 
 Quick Sort 는 분할 정복에 속한다.
 - 분할 정복이란;
 1. 문제를 나눌 수 없을 때까지 나누어 풀고
 2. 나누어서 푼 문제를 다시 합병하여 답을 얻는 알고리즘이다.
 3. 하양식 접근법으로, 일반적으로 재귀 함수로 구현한다.
 ⭐️ 역시나 Recursive 하다.
 
 시간 복잡도는 O(nlogn) 을 가진다.
 
 ------------------------------------------------
 
 🚩 Quick Sort 란?
 
 1. 기준점(Pivot) 을 정해서, 피봇보다 작은 데이터는 left, 큰 데이터는 right 로 모음
 2. left 와 right 에 모은 개수가 1개 이하가 될 때까지 위 작업을 재귀로 반복
 3. 재귀 함수는 left + pivot + right 를 리턴한다.
 
 */

public func progressTime(_ closure: () -> ()) -> TimeInterval {
    let start = CFAbsoluteTimeGetCurrent()
    closure()
    let diff = CFAbsoluteTimeGetCurrent() - start
    print(diff)
    
    return (diff)
}

class QuickSort {
    
    func quickSort<T: Comparable>(_ array: [T]) -> [T] {
        guard let firstPoint = array.first, array.count > 1 else { return array }
        
        let pivot = firstPoint
        let left = array.filter { $0 < pivot }
        let right = array.filter { $0 > pivot }
        
        
        return quickSort(left) + [pivot] + quickSort(right)
    }
}

let array = [4,6,68,5,2,1,3,8,48,7,14,22,17]
let ggg = QuickSort()




/// Avg time of 0.0009 s
progressTime {
    ggg.quickSort(array)
}
