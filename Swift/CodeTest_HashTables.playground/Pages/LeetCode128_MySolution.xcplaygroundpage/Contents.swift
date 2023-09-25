import Foundation

/*
 
 Given an unsorted array of integers nums, return the length of the longest consecutive elements sequence.

 You must write an algorithm that runs in O(n) time.
 
 example)
 Input: nums = [100,4,200,1,3,2]
 Output: 4
 Explanation: The longest consecutive elements sequence is [1, 2, 3, 4]. Therefore its length is 4.
 
 */

// https://leetcode.com/problems/longest-consecutive-sequence/

class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        var numsSet = Set(nums)
        var numsCount = numsSet.count
        var previousCount = 0
        var currentCount = 0
        
        for i in 0..<numsCount {
            
        }
        
        return 0
    }
}
