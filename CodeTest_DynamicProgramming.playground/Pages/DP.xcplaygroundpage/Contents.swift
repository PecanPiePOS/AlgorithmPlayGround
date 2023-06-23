import Foundation

/*
 
 Dynamic Programming 이란,
 
 "
 상향식 접근접으로, 가장 작은 부분의 해답을 구한 후,
 이를 저장하여 저장한 값을 이용해 상위 문제를 풀어가는 방식
 "
 
 가장 중요한 부분은 "작은 부분의 해답"을 "저장"하여 "상위 문제를 해결" 이라는 것인데, 이를 우리는 Memoization 이라고 한다.
 
 Memoization 이란 동일한 계산을 반복해야할 때, 이전에 계산한 값을 메모리에 저장하여, 반복 수행을 제거한다. 그렇게 프로그램 실행 속도를 향상시키는 기법이다.
 
 */

    /// 대표적인 예를 들면, 피보나치 수열이 있다.
func fibo(_ number: Int) -> Int {
    if number <= 1 {
        return number
    }
    
    return fibo(number - 1) + fibo(number - 2)
}
  
print(fibo(4))

/*
 
 다음과 같은 4번째 결과를 얻기까지는
 fibo(0) 을 2번 중복 실행,
 fibo(1) 을 3번 중복 실행,
 fibo(2) 을 2번 중복 실행해야한다.
 
 -> 불필요한 작업이 수반되고, Time Complexity 는 O(2^n) 이다.
 이렇게 쓸 수는 없다.
 
 📍 그래서 우리는 Cache 를 사용한다.
 - 진짜 cache 가 아닌, 임시 저장 장소인것이다.
 - 가장 작은 단위부터 계산하고 저장하여, 큰 값을 도출하는데에 있어, 작은 단위를 저장할 저장공간이 필요하다.
 
 */

    /// Cache 를 사용한 방법
func fiboCached(_ number: Int) -> Int {
    var cache: [Int] = [0, 1]
    
    for n in 2...number {
        cache.append(cache[n-1] + cache[n-2])
    }
    
    return cache[number]
}

print(fiboCached(4))

public func progressTime(_ closure: () -> ()) -> TimeInterval {
    let start = CFAbsoluteTimeGetCurrent()
    closure()
    let diff = CFAbsoluteTimeGetCurrent() - start
    print("--progress--")
    print(diff)
    print("----")

    return (diff)
}

print("----------------")
print("WithOut Cache")
progressTime {
    _ = fibo(25)
}
// When 10 -> 0.0005570650100708008
// When 20 -> 0.08861398696899414
// When 20 -> 0.7717869281768799


print("----------------")
print("With Cache")
progressTime {
    _ = fiboCached(25)
}
// When 10 -> 0.00026798248291015625
// When 20 -> 0.0006750822067260742
// When 20 -> 0.0010149478912353516

