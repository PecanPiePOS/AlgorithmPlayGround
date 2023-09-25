import UIKit

/**
 
 모든 Sort 의 목표는 배열의 아이템들을 특정한 규칙을 가지고 나열을 하는 것이 목표이다.
 
 `Inserting Sort` 란...
 
 정렬되지 않은 배열과 빈 배열이 필요하다.
 
 1. 배열에서 맨 마지막 (O(1)이므로) 요소를 떼어내어 빈 배열에 추가한다.
 2. 또 다시 떼어내어 직전에 새로운 배열에 넣은 숫자보다 크면 왼쪽에, 작으면 오른쪽에 추가한다.(이건 어떤 Sorting 을 하냐에 따라 왼쪽 오른쪽이 달라진다.)
 3. 기존의 배열이 빌 때까지 계속한다.
 
 - 위에서와 같은 기존의 방법은 공간복잡도가 상승한다.
 하지만 새로운 배열을 만들지 않고 바로 배열을 Sort 해보자.
 
 예시를 들자면, | 가 커서이다. 오른쪽으로 진행하면서 바로 Sort 를 진행한다.
 [| 8, 3, 5, 4, 6 ] ->
 [ 8 | 3, 5, 4, 6 ] ->
 [ 3, 8 | 5, 4, 6 ] ->
 [ 3, 5, 8 | 4, 6 ] ->
 [ 3, 4, 5, 8 | 6 ] ->
 [ 3, 4, 5, 6, 8 |]
 
 ㄴ> 위의 해당 기능은 Swap 기능을 통해 구현된다.
 
 [ 3, 5, 8, 4 | 6 ]
         ^
 
 [ 3, 5, 4, 8 | 6 ]
         <-->
        swapped
 
 [ 3, 4, 5, 8 | 6 ]
      <-->
     swapped
 
 구현해보자.
 
 */


public func insertionSort<T: Comparable>(_ array: [T], sortOrder: (T, T) -> Bool) -> [T] {
    guard array.count > 1 else { return array }
    /// - 안정성을 위해 Copy 후 사용.
    var sortedArray = array
    
    for index in 1..<array.count {
        var currentIndex = index
        let temp = sortedArray[currentIndex]
        while currentIndex > 0 && sortOrder(temp, sortedArray[currentIndex-1]) {
            sortedArray[currentIndex] = sortedArray[currentIndex-1]
            currentIndex -= 1
        }
        sortedArray[currentIndex] = temp
    }
    return sortedArray
}
