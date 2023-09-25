import Foundation

/*
 
 Bubble Sort 는 가장 간단하지만, 그만큼 시간복잡도가 큰 정렬 알고리즘이다.
 원리는...
 1. 두 인접한 데이터를 비교한다.
 2. 앞에 있는 데이터가 뒤에 있는 데이터보다 크면, 둘의 자리를 바꾼다.
 3. 기본적으로 O(n^2) 의 시간복잡도를 지닌다.
 
 */

    /// ⭐️ "n-1 번, n-2" ⭐️ 번 을 for 문으로 돌려야한다.

class BubbleSort {
    func sort(_ array: [Int]) -> [Int] {
        var resultArray = array
        let count = resultArray.count
        for i in 0..<count-1 {
            for j in 0..<i-count-1 {
                if resultArray[j] > resultArray[j+1] {
                    let temp = resultArray[j+1]
                    resultArray[j+1] = resultArray[j]
                    resultArray[j] = temp
                }
            }
        }
        return resultArray
    }
}

    /// ⭐️ "isSwap" 이라는 flag 를 만들어, 만약 input Array 가 정렬이 되어 있으면 바로 return 하게 만든다.
func bubbleSort(_ array: inout [Int]) {
    for index1 in 0..<(array.count - 1) {                // 스캔 작업 반복
        var isSwap = false
        for index2 in 0..<((array.count - index1) - 1) { // 스캔 작업(인접 인덱스 비교 및 swap 반복) : (탐색하려는 요소의 갯수) - 1 => 탐색하려는 요소의 갯수는 스캔 횟수에 따라 차감됨(스캔 횟수만큼 정렬되어 있을테니)
            if array[index2] > array[index2 + 1] {
               array.swapAt(index2, (index2 + 1))
                isSwap = true
            }
        }
        if isSwap == false { return }
    }
}
