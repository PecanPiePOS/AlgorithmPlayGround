import Foundation

/*
 
 Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.
 
 -> Respectively Value of 1 5 10 50 100 500 1000
 
 For example, 2 is written as II in Roman numeral, just two ones added together. 12 is written as XII, which is simply X + II. The number 27 is written as XXVII, which is XX + V + II.

 Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:

 I can be placed before V (5) and X (10) to make 4 and 9.
 X can be placed before L (50) and C (100) to make 40 and 90.
 C can be placed before D (500) and M (1000) to make 400 and 900.
 Given a roman numeral, convert it to an integer.
 
 */

class Solution1 {
    func romanToInt(_ s: String) -> Int {
        let romanDictionary: [Character: Int] = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]
        
        var array: [Character] = Array(s)
        
        if s.count == 1 {
            return romanDictionary[array[0]]!
        }
        
        var arrayCount = array.count
        var count = 0
        var resultSum = 0
        
        while arrayCount != 0 {
            
            let currentChar = array[count]
            
            if arrayCount == 1 {
                guard let currentInt = romanDictionary[currentChar] else { return 0 }
                resultSum += currentInt
                break
            }
            
            let nextChar = array[count+1]
            guard let currentInt = romanDictionary[currentChar] else { return 0 }
            guard let nextInt = romanDictionary[nextChar] else { return 0 }
            
            if currentInt < nextInt {
                resultSum += nextInt - currentInt
                count += 2
                arrayCount -= 2
            } else {
                resultSum += currentInt
                count += 1
                arrayCount -= 1
            }
        }
        
        return resultSum
    }
}

Solution1().romanToInt("III")

/// Beats Runtime / Memory - 69% / 67%
/// 19ms / 14.4MB
