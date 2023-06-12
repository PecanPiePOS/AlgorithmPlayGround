import Foundation

/*
 
    Balanced Brackets
    
    -> SIMPLE EXPLANATION:
    "{}[]([])" -> True
    "{}{()[()]" -> False
 
 */


func isBalanced(_ s: String) -> Bool {
    if s.count % 2 == 1 {
        return false
    }
    
    var stackArray: [Character] = Array(s)
    var comparingArray: [Character] = []
    
    let indexingDict: [Character: Character] = ["(": ")", "{": "}", "[": "]", ")": "(", "}": "{", "]": "["]

    while !stackArray.isEmpty {
        guard let unWrappedLastChar = stackArray.popLast() else { return false }
        
        if comparingArray.isEmpty {
            comparingArray.append(unWrappedLastChar)
            continue
        }
        
        guard let lastCharOfComparingArray = comparingArray.last else {
            return false
        }
        
        guard let lastCharOfS = stackArray.last else { return false }
        
        if indexingDict[lastCharOfComparingArray] == lastCharOfS {
            comparingArray.removeLast()
            stackArray.removeLast()
        } else {
            comparingArray.append(stackArray.removeLast())
        }
        
        print("🍎🍎🍎🍎🍎")
        print(stackArray)
        print("----------")
        print(comparingArray)
        print("🧰🧰🧰🧰🧰")
    }
    
    if comparingArray.isEmpty {
        return true
    } else {
        return false
    }
}

isBalanced("{}{}([())]")
isBalanced("([{}([{()[]}])([]))")

