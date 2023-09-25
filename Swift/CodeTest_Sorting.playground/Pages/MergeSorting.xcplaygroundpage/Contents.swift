import UIKit

/**
 
 Divide and Conquer (분할 정복)
 
 Array 를 Split 하고, 정렬을 하면서 Merge 한다.
 
 Merge Sort 는 O(nlogn) 의 시간복잡도를 갖는다.
 정렬 중에서 가장 난이도가 있다고 얘기한다.
 
 합병 정렬 이란 분할 정복 알고리즘 중 하나로,
 "⭐️Recursive⭐️" 를 사용한다.
 1. 배열을 절반으로 잘라, 두 배열로 나눔 (홀수는 알아서 잘)
 2. 배열의 갯수가 1개 이하일 때까지 위 작업을 재귀함수로 반복
 3. 재귀 함수는 나눠진 두 배열을 합병 정렬을 이용해 정렬하고 리턴
 
 */

    /// ⭐️ func 안의 func 이 필요하다. ⭐️
func mergeSort<T: Comparable>(_ array: [T]) -> [T] {
    if array.count <= 1 { return array }
    
    let center = array.count/2
    let left = Array(array[0..<center])
    let right = Array(array[center..<array.count])
    
    func merge(left: [T], right: [T]) -> [T] {
        var leftPart = left
        var rightPart = right
        var result: [T] = []
        
        // left 든 right 든 어느 한쪽이라도 빌때까지
        while !leftPart.isEmpty && !rightPart.isEmpty {
            if leftPart[0] < rightPart[0] {
                // removeFirst 가 최선인가..? -> O(n) 인데...
                result.append(leftPart.removeFirst())
            } else {
                result.append(rightPart.removeFirst())
            }
        }
        
        if !leftPart.isEmpty {
            result.append(contentsOf: leftPart)
        }
        
        if !right.isEmpty {
            result.append(contentsOf: rightPart)
        }
        
        return result
    }
    
    return merge(left: mergeSort(left), right: mergeSort(right))
}


//let array: [Int] = [9,47,34,72,1,23,66,54,43,78,70,71,99,6,555, 444, 444, 4256,24623,23424,234,24,52,523,62,62,4735,7,4573,5,62,4352,4,5234,624,372,57,2435,234,7,124,85,68,3,562,43,28,46,8568, 9,47,34,72,1,23,66,54,43,78,70,71,99,6,555, 444, 444, 4256,24623,23424,234,24,52,523,62,62,4735,7,4573,5,62,4352,4,5234,624,372,57,2435,234,7,124,85,68,3,562,43,28,46,8568,9,47,34,72,1,23,66,54,43,78,70,71,99,6,555, 444, 444, 4256,24623,23424,234,24,52,523,62,62,4735,7,4573,5,62,4352,4,5234,624,372,57,2435,234,7,124,85,68,3,562,43,28,46,8568]

let array: [Int] = Array(0...10000)


public func progressTime(_ closure: () -> ()) -> TimeInterval {
    let start = CFAbsoluteTimeGetCurrent()
    closure()
    let diff = CFAbsoluteTimeGetCurrent() - start
    print(diff)
    
    return (diff)
}

//progressTime {
//    let k = mergeSort(array)
//    print(k)
//}


    /// 엥 근데... 이건... 0.07 초 걸림....
    /// 기존 sort 기능... 하긴,,, 머리를 싸매고 만들었을텐데 당연히 더 나아야지...
progressTime {
    let k = array.sorted(by: >)
    print(k)
}
