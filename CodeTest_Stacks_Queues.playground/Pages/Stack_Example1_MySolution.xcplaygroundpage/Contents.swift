import Foundation

/*
 
    Balanced Brackets
    
    -> SIMPLE EXPLANATION:
    "{}[]([])" -> True
    "{}{()[()]" -> False
 
 */


    // MARK: - WRONG
func isBalanced1(_ s: String) -> Bool {
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


//    // MARK: - Right
//func isBalanced(s: String) -> Bool {
//    let pairs: [Character: Character] = ["(": ")", "[": "]", "{": "}"]
//    var stack: [Character] = []
//    for char in s {
//        if let match = pairs[char] {
//            stack.append(match)
//        } else if stack.last == char {
//            stack.popLast()
//        } else {
//            return false
//        }
//    }
//    
//    return stack.isEmpty
//}

