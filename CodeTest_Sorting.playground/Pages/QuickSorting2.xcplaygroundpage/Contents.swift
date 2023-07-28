import Foundation

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
print(ggg.quickSort(array))
