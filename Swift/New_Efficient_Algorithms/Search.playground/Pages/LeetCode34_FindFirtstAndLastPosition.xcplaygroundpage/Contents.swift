import Foundation

/**
 
 Given an array of integers nums sorted in non-decreasing order, find the starting and ending position of a given target value.
 
 If target is not found in the array, return [-1, -1].
 
 You must write an algorithm with O(log n) runtime complexity.
 
 Ex)
 - Input: nums = [5,7,7,8,8,10], target = 8
 Output: [3,4]
 
 - Input: nums = [5,7,7,8,8,10], target = 6
 Output: [-1,-1]
 
 - Input: nums = [], target = 0
 Output: [-1,-1]
 
 https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/submissions/
 */

class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        if nums.isEmpty {
            return [-1, -1]
        }
        
        var leftIndex: Int {
            var low = 0
            var high = nums.count
            while low < high {
                let midIndex = low + (high - low)/2
                if nums[midIndex] < target {
                    low = midIndex + 1
                } else {
                    high = midIndex
                }
            }
            return low
        }
        
        var rightIndex: Int {
            var low = 0
            var high = nums.count
            while low < high {
                let midIndex = low + (high - low)/2
                if nums[midIndex] > target {
                    high = midIndex
                } else {
                    low = midIndex + 1
                }
            }
            return low
        }
        if (leftIndex, rightIndex) == (0,0) {
            return [-1, -1]
        }
        
        if leftIndex > rightIndex-1 {
            return [-1, -1]
        }
        
        return [leftIndex, rightIndex-1]
    }
}
