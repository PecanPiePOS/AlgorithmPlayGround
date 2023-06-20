//: [Previous](@previous)

import Foundation

extension Array where Element: Comparable {
    
    func bubbleSort(by areInIncreasingOrder: ((Element, Element) -> Bool) = (<)) -> [Element] {
        var data = self
        
        for i in 0..<(data.count-1) { // 1
            for j in 0..<(data.count-i-1) where areInIncreasingOrder(data[j+1], data[j]) { // 2
                data.swapAt(j, j + 1)
            }
        }
        
        return data
    }
}

func swap<T: Comparable>(left: inout T, right: inout T) {
    print("Swapping \(left) and \(right)")
    let temp = right
    right = left
    left = temp
}

extension Array where Element: Comparable {
        
    func insertionSort(by areInIncreasingOrder: ((Element, Element) -> Bool) = (<)) -> [Element] {
        var data = self
        
        for i in 1..<data.count { // 1
            let key = data[i] // 2
            var j = i - 1
            
            while j >= 0 && areInIncreasingOrder(key, data[j]) { // 3
                data[j+1] = data[j] // 4
                
                j = j - 1
            }
            
            data[j + 1] = key // 5
        }
        
        return data
    }
}

extension Array where Element: Comparable {
    func selectionSort(by areInIncreasingOrder: ((Element, Element) -> Bool) = (<)) -> [Element] {
        var data = self
        
        for i in 0..<(data.count-1) {
            var key = i // 1
            
            for j in i+1..<data.count where areInIncreasingOrder(data[j], data[key]) { // 2
                key = j
            }
            
            guard i != key else { continue }
            
            data.swapAt(i, key) // 3
        }
        
        return data
    }
}

extension Array where Element: Comparable {
    private func merge(left: [Element], right: [Element], by areInIncreasingOrder: ((Element, Element) -> Bool) = (<)) -> [Element] {
        var output: [Element] = []
        
        var mutableLeft = left
        var mutableRight = right
        while mutableLeft.count > 0 && mutableRight.count > 0 {
            
            if let firstElement = mutableLeft.first, let secondElement = mutableRight.first {
                
                if !areInIncreasingOrder(firstElement, secondElement) {
                    output.append(secondElement)
                    mutableRight.remove(at: 0)
                } else {
                    output.append(firstElement)
                    mutableLeft.remove(at: 0)
                }
            }
        }
        
        output.append(contentsOf: mutableLeft)
        output.append(contentsOf: mutableRight)
        
        return output
    }
     
    private func _emMergeSort(data: [Element], by areInIncreasingOrder: ((Element, Element) -> Bool) = (<)) -> [Element] {
        if data.count < 2 { return data }
        
        let leftArray = Array(data[..<Int(data.count / 2)]) // 1
        let rightArray = Array(data[Int(data.count / 2)..<data.count]) // 2
        return merge(left: _emMergeSort(data: leftArray, by: areInIncreasingOrder), right: _emMergeSort(data: rightArray, by: areInIncreasingOrder), by: areInIncreasingOrder) // 3
    }
    
    func emMergeSort(by: ((Element, Element) -> Bool) = (<)) -> [Element] {
        let data = self
        
        return _emMergeSort(data: data, by: by)
    }
}
