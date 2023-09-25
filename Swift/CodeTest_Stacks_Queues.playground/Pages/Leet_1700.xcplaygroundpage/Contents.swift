
import Foundation

/*
 
 The school cafeteria offers circular and square sandwiches at lunch break, referred to by numbers 0 and 1 respectively. All students stand in a queue. Each student either prefers square or circular sandwiches.

 The number of sandwiches in the cafeteria is equal to the number of students. The sandwiches are placed in a stack. At each step:

 If the student at the front of the queue prefers the sandwich on the top of the stack, they will take it and leave the queue.
 Otherwise, they will leave it and go to the queue's end.
 This continues until none of the queue students want to take the top sandwich and are thus unable to eat.

 You are given two integer arrays students and sandwiches where sandwiches[i] is the type of the i​​​​​​th sandwich in the stack (i = 0 is the top of the stack) and students[j] is the preference of the j​​​​​​th student in the initial queue (j = 0 is the front of the queue). Return the number of students that are unable to eat.
 
 */
    // MARK: - Solution #1 Using "loop:".
class Solution {
    func countStudents1(_ students: [Int], _ sandwiches: [Int]) -> Int {
        var students = students
        var sandwiches = sandwiches
        
    loop: while let sandw = sandwiches.first {
        for i in 0..<students.count {
            if students[i] == sandw {
                students.remove(at: i)
                sandwiches.removeFirst()
                continue loop
            }
        }
        
        break
    }
        
        return students.count
    }
    
    // MARK: - Solution #2 Using Maths.
    func countStudents2(_ students: [Int], _ sandwiches: [Int]) -> Int {
        var ctrs: [Int] = [0, 0]
        // count zeros and ones in students
        ctrs[1] = students.reduce(0, +)
        ctrs[0] = students.count - ctrs[1]
        // go over the sandwiches queue
        for s in sandwiches {
            if ctrs[s] == 0 {
                break  // stop if there is no student of the kind left
            }
            ctrs[s] -= 1  // decrement number of students of the kind
        }
        // return number of students left
        return Int(max(ctrs[0], ctrs[1]))
    }
    
    // MARK: - Solution #3 Using Queue
    func countStudents3(_ students: [Int], _ sandwiches: [Int]) -> Int {
        var queueStudents = Queue<Int>(students)
        var queueSandwiches = Queue<Int>(sandwiches)
        
        while !queueSandwiches.isEmpty {
            let currentSandwich = queueSandwiches.dequeue()
            var count = queueStudents.count
            
            while !queueStudents.isEmpty {
                if count == 0 { return queueStudents.count }
                let currentStudent = queueStudents.dequeue()
                
                if currentStudent != currentSandwich {
                    count -= 1
                    queueStudents.enqueue(currentStudent)
                    continue
                }
                
                break
            }
        }
        
        return 0
    }
}

    // MARK: - Queue Class for Solution3
class Queue<T> {
    private var elements: [T]

    var isEmpty: Bool {
        elements.isEmpty
    }
    
    var head: T {
        elements.first!
    }
    
    var count: Int {
        elements.count
    }

    init() {
        self.elements = []
    }

    init(_ elements: [T]) {
        self.elements = elements
    }

    func enqueue(_ val: T) {
        elements.append(val)
    }

    func dequeue() -> T {
        elements.removeFirst()
    }
}
