
import Foundation

/*
 
 Given a string s, find the first non-repeating character in it and return its index. If it does not exist, return -1.
 
 */

class Solution {
    // MARK: - Wrong Answer - Exception Case of s = "aaaddd" -> 5
    func firstUniqChar1(_ s: String) -> Int {
        var stringQueue = Array(s)
        var characterDict: [Character: Int] = [:]
                
        for (index, character) in stringQueue.enumerated() { // N
            if characterDict[character] == nil {
                characterDict[character] = index
            } else {
                characterDict[character] = nil
            }
        }
        
        print(characterDict)
        
        if characterDict.isEmpty {
            return -1
        }
        
        guard let result = characterDict.sorted(by: { $0.value < $1.value }).first?.value else { return -1 }  // N logN

        return result
    }
    
    // MARK: - Right Answer - Using .reduce(into:)
    func firstUniqChar(_ s: String) -> Int {
        let mappingOfCharacters = s.reduce(into: [Character: Int]()) { result, character in
            result[character, default: 0] += 1
        } // N
        
        for (index, character) in s.enumerated() { // N
            if let count = mappingOfCharacters[character], count == 1 {
                return index
            }
        }

        return -1
    }
}
