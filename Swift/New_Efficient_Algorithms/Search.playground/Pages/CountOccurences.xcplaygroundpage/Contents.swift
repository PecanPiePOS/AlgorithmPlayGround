import Foundation

/**
 
 - 📍 궁금 포인트 1 : 실제로 Binary Search 가 많이 쓰이느냐?
 -> 애초에 정렬된 친구이지 않은가?
 -> 그래도 뭐 정렬 후에 찾는 방법도 요구할 수 있겠지.
 
 - 📍 궁금 포인트 2 : 정렬된 배열에서 찾는 Occurences 를 찾는 방법은 Binary Search 가 최선인가?
 
 - 📍 궁금 포인트 3 : 애초에 그러면, Sorted Array 가 있다고 한다면 그저, Binary Search 를 떠올리면 되는 것인가?
 
 
 `Count Occurences` with `Binary Search` 는,\
 Linear Search 를 사용할 수 있다. But 너무 오래 걸린다.
 
 ⭐️ 그래서 Binary Search 를 2번 사용해서, 첫번째 나타나는 왼쪽 Index 를 구하고, 오른쪽 Index 를 구해서 차이를 구하면 그것이 정렬된 배열에서 찾고자 하는 아이템의 개수이다.
 
 */

func countOccurences<T: Comparable>(of key: T, in array: [T]) -> Int {
    var leftIndex: Int {
        var low = 0
        var high = array.count
        while low < high {
            let midIndex = low + (high - low)/2
            if array[midIndex] < key {
                low = midIndex + 1
            } else {
                high = midIndex
            }
        }
        return low
    }
    
    var rightIndex: Int {
        var low = 0
        var high = array.count
        while low < high {
            let midIndex = low + (high - low)/2
            if array[midIndex] > key {
                high = midIndex
            } else {
                low = midIndex + 1
            }
        }
        
        return low
    }
    
    print([leftIndex, rightIndex])
    return rightIndex - leftIndex
}


let array = [1, 2, 3, 3, 3, 3, 6, 8, 10, 11, 11, 12,12,12,12,12,16,16,17,47,4893,5000]

countOccurences(of: 0, in: array)
