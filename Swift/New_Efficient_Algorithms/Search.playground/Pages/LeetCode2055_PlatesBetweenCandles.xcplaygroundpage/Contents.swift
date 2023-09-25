import Foundation

/**
 
 There is a long table with a line of plates and candles arranged on top of it. You are given a 0-indexed string s consisting of characters '*' and '|' only, where a '*' represents a plate and a '|' represents a candle.

 You are also given a 0-indexed 2D integer array queries where queries[i] = [lefti, righti] denotes the substring s[lefti...righti] (inclusive). For each query, you need to find the number of plates between candles that are in the substring. A plate is considered between candles if there is at least one candle to its left and at least one candle to its right in the substring.

 For example, s = "||**||**|*", and a query [3, 8] denotes the substring "*||**|". The number of plates between candles in this substring is 2, as each of the two plates has at least one candle in the substring to its left and right.
 Return an integer array answer where answer[i] is the answer to the ith query.
 
 Ex)
 
 Input: s = "**|**|***|", queries = [[2,5],[5,9]]
 Output: [2,3]
 Explanation:
 - queries[0] has two plates between candles.
 - queries[1] has three plates between candles.
 
 Input: s = "***|**|*****|**||**|*", queries = [[1,17],[4,5],[14,17],[5,11],[15,16]]
 Output: [9,0,0,0,0]
 Explanation:
 - queries[0] has nine plates between candles.
 - The other queries have zero plates between candles.
  
 */

/*
 생각해보자...
 우선 Binary Search 는 안되고... 애초에 Sort 랑은 관계가 없고...
 for 문을 2번 돌리는건 항상 Worst Case 이고...
 for 문은 항상 1번만. 언제나. 어떤 상황에서든.
 
 */

class Solution {
    func platesBetweenCandles(_ s: String, _ queries: [[Int]]) -> [Int] {
        let queryCount = queries.count
        let data: [Character] = Array(s)
        var candleList: [Int] = [Int]()
        var answer: [Int] = Array(repeating: 0, count: queryCount)
        
        for i in 0..<data.count {
            if data[i] == "|" {
                candleList.append(i)
            }
        }

        for i in 0..<queryCount {
            if let leftIndex = candleList.firstIndex(where: {
                $0 >= queries[i][0] }), let rightIndex = candleList.lastIndex(where: { $0 <= queries[i][1] }) {
                if leftIndex < rightIndex {
                    answer[i] = candleList[rightIndex] - candleList[leftIndex] - rightIndex + leftIndex
                }
            }
        }
        return answer
    }
}

/*
 
 candleList[rightIndex] - candleList[leftIndex]
 = Int - Int
 
  => 이 부분은 이제 queries 로 솎아낸 배열에서 "|" 의 위치를 찾은 인덱스의 차이 값. 내가 원하는
 
 
 - rightIndex + leftIndex
 
  => 이 부분은 CandleList 에서 인덱스 간의 차이. 즉 인덱스 사이에 있는 Int 들의 개수는 "|" 의 개수와 같으니깐.
 
 
 
 */
