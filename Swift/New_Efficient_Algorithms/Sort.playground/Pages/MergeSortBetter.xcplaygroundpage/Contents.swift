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
