import Foundation

/**
 
 `Merge Sort` 란...
 
 당연히 Sort 는 오름, 내림차순의 정렬을 만드는 용도이다.
 ⭐️시간복잡도는 O(NlogN) 이다.
 
 Divide and Conquer 를 사용하여 문제를 해결한다.
 Merge Sort 는 Split-First & Merge-After 를 한다.
 
 방식은 다음과 같다.
 1. n개의 요소가 있는 배열을 반으로 나눈다. 이제 두 개의 정렬되지 않는 배열이 존재한다.
 2. 1 을 반복하여 n 개의 배열의 크기가 모두 1이 될때까지 나눈다.
 3. Pairing 을 통해 나눠져 있는 배열들을 다시 Merge 한다.
 
 */



    /// ⭐️⭐️⭐️ 이건, 기존의 func 이 더 빠르다.
    /// - 10000 개의 사이즈의 Array 정렬속도는 15.34s 수준이었다.
    /// 이 MergeSort 의 속도는 48s 가 나온다. 구리다. 왜지.
func mergeSort(_ array: [Int]) -> [Int] {
    guard array.count > 1 else { return array }
    
    let middleIndex = array.count / 2
    
    let leftArray = mergeSort(Array(array[0..<middleIndex]))
    
    let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
    
    return merge(leftPile: leftArray, rightPile: rightArray)
}

func merge(leftPile: [Int], rightPile: [Int]) -> [Int] {
    // 1
    var leftIndex = 0
    var rightIndex = 0
    
    // 2
    var orderedPile = [Int]()
    orderedPile.reserveCapacity(leftPile.count + rightPile.count)
    
    // 3
    while leftIndex < leftPile.count && rightIndex < rightPile.count {
        if leftPile[leftIndex] < rightPile[rightIndex] {
            orderedPile.append(leftPile[leftIndex])
            leftIndex += 1
        } else if leftPile[leftIndex] > rightPile[rightIndex] {
            orderedPile.append(rightPile[rightIndex])
            rightIndex += 1
        } else {
            orderedPile.append(leftPile[leftIndex])
            leftIndex += 1
            orderedPile.append(rightPile[rightIndex])
            rightIndex += 1
        }
    }
    
    // 4
    while leftIndex < leftPile.count {
        orderedPile.append(leftPile[leftIndex])
        leftIndex += 1
    }
    
    while rightIndex < rightPile.count {
        orderedPile.append(rightPile[rightIndex])
        rightIndex += 1
    }
    
    return orderedPile
}

public func progressTime(_ closure: () -> ()) -> TimeInterval {
    let start = CFAbsoluteTimeGetCurrent()
    closure()
    let diff = CFAbsoluteTimeGetCurrent() - start
    print(diff)
    
    return (diff)
}

//let array: [Int] = [9,47,34,72,1,23,66,54,43,78,70,71,99,6,555, 444, 444, 4256,24623,23424,234,24,52,523,62,62,4735,7,4573,5,62,4352,4,5234,624,372,57,2435,234,7,124,85,68,3,562,43,28,46,8568, 9,47,34,72,1,23,66,54,43,78,70,71,99,6,555, 444, 444, 4256,24623,23424,234,24,52,523,62,62,4735,7,4573,5,62,4352,4,5234,624,372,57,2435,234,7,124,85,68,3,562,43,28,46,8568,9,47,34,72,1,23,66,54,43,78,70,71,99,6,555, 444, 444, 4256,24623,23424,234,24,52,523,62,62,4735,7,4573,5,62,4352,4,5234,624,372,57,2435,234,7,124,85,68,3,562,43,28,46,8568]

let array: [Int] = Array(0...10000).reversed()

progressTime {
    let k = mergeSort(array)
    print(k)
}
