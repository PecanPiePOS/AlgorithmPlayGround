import UIKit

class CustomHash {

    var initialData: Int
    
    init(initialData: Int) {
        self.initialData = initialData
    }
    
    func getHashValue(addedInt addedHash: Int) -> Int {
        var hashData = Hasher()
        hashData.combine(addedHash)
        
        return hashData.finalize()
    }
}

struct CustomHashStruct: Hashable {
    var initialData: Int
    
    init(initialData: Int) {
        self.initialData = initialData
    }
    
    func getNewHashValue(addedInt addedHash: Int) -> Int {
        var hashData = Hasher()
        hashData.combine(addedHash)
        
        return hashData.finalize()
    }
}

func loadMemoryAddress(_ object: UnsafeRawPointer) -> String {
   let address = Int(bitPattern: object)
   return String(format: "%p", address)
}

var hashObject1 = CustomHash(initialData: 10)
var hashObjectClassCopy = hashObject1
var hashObject2 = CustomHash(initialData: 10)

print(hashObject1.getHashValue(addedInt: 12))
print(hashObjectClassCopy.getHashValue(addedInt: 12))
print(hashObject2.getHashValue(addedInt: 12))
print(Unmanaged.passUnretained(hashObject1).toOpaque())
print(Unmanaged.passUnretained(hashObjectClassCopy).toOpaque())
print(Unmanaged.passUnretained(hashObject2).toOpaque())

print(hashObject1.getHashValue(addedInt: 17))
print(hashObject2.getHashValue(addedInt: 17))
print(Unmanaged.passUnretained(hashObject1).toOpaque())
print(Unmanaged.passUnretained(hashObjectClassCopy).toOpaque())


var hashStructObject2 = CustomHash(initialData: 20)
var hashStructCopy = hashStructObject2

print(hashStructObject2.getHashValue(addedInt: 12))
print(hashStructCopy.getHashValue(addedInt: 12))

var n1 = [1, 2, 3]
var n2 = n1
var n3 = [1, 2, 3]

print("-------------해시와 메모리 주소-------------")
print("해시값은 다시한번 선언되면 바뀌는가?")
print(n1.hashValue)
print(n1.hashValue)
print("아뇨!")
print("주소값,")
print(loadMemoryAddress(n1))
print("------------------------------------------")
print("같은 array 값이라면 주소와 해시값은?")
print(n3.hashValue)
print(loadMemoryAddress(n3))
print("------------------------------------------")
print("복사된 값 타입 인스턴스는 당연히 다른 해시값을 가지겠고, -> 라고 생각했지만, HashValue 는 해당 인스턴스의 값에 따라 달라지기 때문에, 같은 값을 지니면, HashValue 는 같은 값을 가질 수 밖에 없다!")
print(n2.hashValue)
print(loadMemoryAddress(n2))
print("------------------------------------------")
n1.append(6)
print("기존의 값이 바뀌면 해시값도 바뀔까? -> 네 당연히. 그리고 주소도 당연히.")
print(n1.hashValue)
print(loadMemoryAddress(n1))
print("------------------------------------------")
print("n2 의 값은,")
print(n2.hashValue)
print(loadMemoryAddress(n2))
print("n3 의 값은,")
print(n3.hashValue)
print(loadMemoryAddress(n3))
