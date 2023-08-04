import UIKit

/**
 
 기본적으로 queue 는 O(1) 로 linear 하다.
 하지만 문제가 되는 것은, `dequeue` 일때다. 이때는 O(N)이기 때문이다.
 
 그렇기 때문에 dequeue 를 O(1) 로 만들 수 있는 방법을 알아보자.
 
 
 원리는 다음과 같다.
 
 nil 을 사용해서, 앞 쪽에 공간을 만들고 그 빈공간에 다음 index 를 head 로 지칭해서 subscript 로 없애는 방법을 택한다.
 
 */

public final class Queue<T> {
    fileprivate var array = [T?]()
    fileprivate var head: Int = 0
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count - head
    }
    
    public var front: T? {
        if self.isEmpty {
            return nil
        } else {
            return array[head]
        }
    }
    
    public func enqueue(_ item: T) {
        array.append(item)
    }
    
    public func dequeue() -> T? {
        guard head < array.count, let item = array[head] else { return nil }
        
        array[head] = nil
        head += 1
        
        if head > 3 {
            array.removeFirst(head)
            head = 0
        }
        return item
    }
}

let q = Queue<Int>()


