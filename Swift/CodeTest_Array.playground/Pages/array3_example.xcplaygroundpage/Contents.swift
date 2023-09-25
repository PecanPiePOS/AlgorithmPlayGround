//: [Previous](@previous)

import Foundation

private func solution(_ A: [String], _ B: [String], _ P: String) -> String {

    var containerArray: [String] = []
    
    for (index, item) in B.enumerated() {
        if item.contains(P) {
            containerArray.append(A[index])
        }
    }
    
    if containerArray.isEmpty  {
        return ""
    }

    containerArray
    
    return containerArray.sorted()[0]
}

solution(["a", "b", "c", "cd"], ["syjmwryth", "gdb45", "47372", "474747"], "47")

