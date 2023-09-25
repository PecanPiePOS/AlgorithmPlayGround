import Foundation

/**
 
 정렬되지 않은 배열에서 최대 값과 최소 값을 찾자.
 -> O(N)
 
 생각한 그대로이다. 처음 값을 Max/Min 으로 두고 Cache 를 해서 가지고 있고, 쭉 도는거다. 끝.
 
 */

func minimum<T: Comparable>(_ array: [T]) -> T? {
    guard var minimum = array.first else {
        return nil
    }
    
    for element in array.dropFirst() {
        minimum = element < minimum ? element : minimum
    }
    return minimum
}

func maximum<T: Comparable>(_ array: [T]) -> T? {
    guard var maximum = array.first else {
        return nil
    }
    
    for element in array.dropFirst() {
        maximum = element > maximum ? element : maximum
    }
    return maximum
}
