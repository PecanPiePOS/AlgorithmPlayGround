import Foundation

// MARK: PREVIOUSLY, WE USED TO CALCULATE HASHES in Swift LIKE THIS...
struct GridPoint {
    var x: Int
    var y: Int
    
    var hashValue: Int {
        /// 해시 값에 소수(Prime Number) 를 곱해서 완전히 겹치지 않는 수를 만든다.
        return x.hashValue * y.hashValue * 16777619
    }
}

