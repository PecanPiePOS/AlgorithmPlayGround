import UIKit

func solution(_ S: String) -> String {
    
    if S.isEmpty { return S }
    
    var stringArray: [String] = []
    var resultArray: [String] = []
    var resultString = ""
    
    for character in S {
        var characterToInt: Int? = Int(String(character))
        if characterToInt != nil {
            stringArray.append(String(character))
        }
    }
    
    for (index, item) in stringArray.enumerated() {
        if (index + 1) % 3 == 0 {
            resultArray.append(item)
            resultArray.append("-")
        } else {
            resultArray.append(item)
        }
    }
    
    if resultArray.isEmpty {
        return ""
    }
    
    if resultArray.last == "-" {
        resultArray = resultArray.dropLast()
    }
    
    let indexForException = resultArray.count - 2
    if resultArray[indexForException] == "-" {
        resultArray[indexForException] = resultArray[indexForException - 1]
        resultArray[indexForException - 1] = "-"
    }
    
    resultArray
    return resultArray.joined()
    
}

solution("0386- -2486-2486-92435689-")

