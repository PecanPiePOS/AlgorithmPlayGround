import Foundation

/**
 
 `Binary Search` 란...
 
 배열에서 element 를 빠르게 찾는 것이 목표이다.
 
 Swift 의 `Collection.index(of:)` 는 linear search 를 사용한다.
 
 Linear Search 의 문제점은 모든 array 를 모두 돈다는 점이다. 최악의 경우는 찾고자 하는 item 이 array 에 없을 때다.
  만약 array 가 너무 거대하다면, Linear 는 급격하게 느려진다.

 
 - Divide and Conquer
 Binary Search 는 O(logN) 의 시간복잡도를 가진다.
 문제는, 해당 Binary Search 를 하려면 array 가 정렬이 되어 있어야 한다는 점이다. 하지만 실제 사용시에는 그렇게 큰 문제가 되지 않는다.
 
 Binary Search 는 다음의 과정을 따른다.
 1. 배열을 반으로 나누고 원하는 값이 나누어진 왼쪽 배열에 있는지 오른쪽 배열에 있는지를 찾는다.
 2. 이걸 찾으려면, 당연히 배열은 정렬되어 있어야 한다. 그래야 1 을 시행할 수 있다.
 3. 정렬이 되어 있다면, 해당 과정을 반복한다.
 4. 더 이상 반으로 나눌 수 없다면 그것이 답이 된다.
 
 - 포인트는 ⭐️오름차순 정렬이 된 상태⭐️, Split half, Recursive.
 
 */

    /// - Linear Search
func linearSearch<T: Equatable>(_ array: [T], key: T) -> Int? {
    for index in 0..<array.count {
        if array[index] == key {
            return index
        }
    }
    return nil
}


    /// - Binary Search, Only Recursive
func binarySearch<T: Comparable>(_ array: [T], item: T, range: Range<Int>) -> Int? {
    if range.lowerBound >= range.upperBound {
        // 빈 배열이라는 뜻인데, 그 뜻은 찾고자 하는 item 이 배열 안에 없다는 뜻이다.
        return nil
    } else {
        // 반으로 가를 곳을 정한다. 오른쪽으로 갈라지는 것도 생각해야한다.
        let midIndex = range.lowerBound + (range.upperBound - range.lowerBound)/2
        
        // 찾으려는 item 이 왼쪽에 있는가?
        if array[midIndex] > item {
            return binarySearch(array, item: item, range: range.lowerBound..<midIndex)
        } else if array[midIndex] < item {
            return binarySearch(array, item: item, range: midIndex+1..<range.upperBound)
        } else {
            return midIndex
        }
    }
}

    /// - Binary Search, with Iterative
func binarySearch<T: Comparable>(_ array: [T], item: T) -> Int? {
    var lowerBound = 0
    var upperBound = array.count
    
    while lowerBound < upperBound {
        let midIndex = lowerBound + (upperBound - lowerBound)/2
        if array[midIndex] > item {
            return midIndex
        } else if array[midIndex] < item {
            lowerBound = midIndex + 1
        } else {
            upperBound = midIndex
        }
    }
    return nil
}

