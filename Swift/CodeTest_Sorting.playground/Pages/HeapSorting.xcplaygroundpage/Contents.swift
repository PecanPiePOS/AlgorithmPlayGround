import Foundation

/*
 
 Heap Sort 는 Heap Tree 를 활용하여 데이터를 정렬하는 알고리즘.
 
 - Binary Tree & Max Heap 에 대한 이해가 필요하다.
 
 기본적인 알고리즘은 다음과 같다.
 1. 주어진 데이터를 최대 힙 배열로 만든다.
 2. 힙에서 최대값(index 0 원소)과 마지막 값을 바꾼다.
 3. 힙의 크기가 1이 줄어든 것으로 간주하고 마지막 값을 제외하여 다시 최대 힙 배열로 재구성한다.
 4. 2,3번을 반복하고 힙의 크기가 1이 될때까지 반복한다.
 
 ⭐️ O(nlogn) 의 시간복잡도를 가진다.
 - Merge Sort 와 다르게 추가적인 배열이 필요 없다.
 BUT!! 같은 값을 가진 원소들에 대해서는 순서가 바뀔 수 있는 불안정한 정렬이다.
 
 */

/*
 
 최대 힙 트리가 있다고 가정하자.
 배열로 표현을 한다면,
 : [25, 13, 20, 8, 7, 17, 2, 5, 4]
                
                    25
            13              20
        8       7       17      2
    5       4
 
 위의 배열은 Root Node 를 제외하고는 정렬이 되어있다라고 할 수 없다.
 
 1️⃣ Root Node 를 끝으로 보낸다.
 : [4, 13, 20, 8, 7, 17, 2, 5, 25]
 
 2️⃣ 마지막 수를 제외한 배열을 최대 힙 트리로 만든다.
  -> [4, 13, 20, 8, 7, 17, 2, 5 | 25]
 
 : [20, 13, 17, 8, 7, 4, 2, 5 | 25]
 
 3️⃣ 같이 정렬을 계속 반복한다.
 [5, 13, 17, 8, 7, 4, 2 | 20, 25]
 [17, 13, 5, 8, 7, 4, 2 | 20, 25]
 [2, 13, 5, 8, 7, 4 | 17, 20, 25]
 [13, 8, 5, 2, 7, 4 | 17, 20, 25]
 [4, 8, 5, 2, 7 | 13, 17, 20, 25]
 [8, 7, 5, 2, 4 | 13, 17, 20, 25]
 [4, 7, 5, 2 | 8, 13, 17, 20, 25]
 [7, 4, 5, 2 | 8, 13, 17, 20, 25]
 [2, 4, 5 | 7, 8, 13, 17, 20, 25]
 [5, 4, 2 | 7, 8, 13, 17, 20, 25]
 [2, 4 | 5, 7, 8, 13, 17, 20, 25]
 [4, 2 | 5, 7, 8, 13, 17, 20, 25]
 [2 | 4, 5, 7, 8, 13, 17, 20, 25]
 [2, 4, 5, 7, 8, 13, 17, 20, 25]
 
 */

func heapify<T: Comparable>(_ array: inout [T], _ i: Int, _ size: Int) {
    var largest = i
    let left = i * 2 + 1
    let right = i * 2 + 2
    
    if left < size && array[largest] < array[left] {
        largest = left
    }
    
    if right < size && array[largest] < array[right] {
        largest = right
    }
    
    if largest != i {
        swap(&array, largest, i)
        heapify(&array, largest, size)
    }
}

func swap<T : Comparable>(_ array: inout [T] , _ i: Int, _ j: Int) {
    let temp = array[i]
    array[i] = array[j]
    array[j] = temp
}

func buildHeap<T : Comparable>(_ array: inout [T]) {
    var i = array.count/2
    
    while i >= 0 {
        heapify(&array, i, array.count)
        i -= 1
    }
}

func heapSort<T : Comparable>(_ array: inout [T]) -> [T] {
    buildHeap(&array)
    
    var size = array.count
    var i = size - 1
    
    while i >= 1 {
        swap(&array, i, 0)
        print("\(array)")
            
        i -= 1
        size -= 1
        
        heapify(&array, 0, size)
        
        print("\(array)")
    }
    
    return array
}
