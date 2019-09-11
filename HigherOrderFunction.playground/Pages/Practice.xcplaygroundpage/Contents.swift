//: [Previous](@previous)
import Foundation
/*:
 ---
 ## Practice 1
 ---
 */
print("\n---------- [ Practice 1 ] ----------\n")

struct Pet {
  enum PetType {
    case dog, cat, snake, pig, bird
  }
  var type: PetType
  var age: Int
}

let myPet = [
  Pet(type: .dog, age: 13),
  Pet(type: .dog, age: 2),
  Pet(type: .dog, age: 7),
  Pet(type: .cat, age: 9),
  Pet(type: .snake, age: 4),
  Pet(type: .pig, age: 5),
]



// 1번
func sumDogAge(pets: [Pet]) -> Int {
    return pets
    .filter{ $0.type == .dog }
    .reduce(0) { $0 + $1.age }
}

    
    
    
//func sumDogAge(pets: [Pet]) -> Int {
//    var ageSum = 0
//    for pet in pets {
//    guard pet.type == .dog else { continue }
//    ageSum += pet.age
//    }
////    }
//}

    
    
// 2번
func oneYearOlder(of pets: [Pet]) -> [Pet] {
    return pets.map {
        Pet(type: $0.type, age: $0.age + 1)
    }
}
    
    
    
//func oneYearOlder(of pets: [Pet]) -> [Pet] {
//    var oneYearOlderPets = [Pet]()
//    for pet in pets {
//        let temp = Pet(type: pet.type, age: pet.age + 1)
//        oneYearOlderPets.append(temp)
//    }
//}



/*:
 ---
 ## Practice 2
 ---
 */
print("\n---------- [ Practice 2 ] ----------\n")

let immutableArray = Array(1...40)

// MARK: - Define Function
func multiplyByIndex(index: Int, number: Int) -> Int {
    return index * number
}

func isEven(number: Int) -> Bool {
    return number & 1 == 0
}

func addTwoNumbers(lhs: Int, rhs: Int) -> Int {
    return lhs + rhs
}

// MARK: - Call Function

var sum = 0
for (index, num) in immutableArray.enumerated() {
    let multipliedNum = multiplyByIndex(index: index, number: num)
    
    if isEven(number: multipliedNum) {
        sum = addTwoNumbers(lhs: sum, rhs: multipliedNum)
        
    }
}
print(sum)


// MARK: - Function as argument

var result =
    immutableArray.enumerated()
        .map { $0 * $1 }
        .filter { $0 & 1 == 0 }
        .reduce(0) { $0 + $1 }


print(result)


/*:
 ---
 ## Practice 3
 ---
 */

print("\n---------- [ Practice 3 ] ----------\n")

let array: [[Int?]] = [[1, 2, 3], [nil, 5], [6, nil], [nil]]

//1.
print(array.compactMap { $0 })

//2.
print(array
    .map{ $0.compactMap{ $0 } }
     )

//3.
print(array.flatMap{ $0 })

//4.
print(array
    .flatMap{ $0 }
    .compactMap{ $0 }
)





/***************************************************
 let array: [[Int?]] = [[1, 2, 3], [nil, 5], [6, nil], [nil]]
 
 Q. 위 배열이 주어졌을 때 map 과 flatMap, compactMap 을 이용하여 다음 결과를 출력해보세요.
 1. [[Optional(1), Optional(2), Optional(3)], [nil, Optional(5)], [Optional(6), nil], [nil]]
 2. [[1, 2, 3], [5], [6], []] 
 3. [Optional(1), Optional(2), Optional(3), nil, Optional(5), Optional(6), nil, nil] 
 4. [1, 2, 3, 5, 6]
 ***************************************************/



//: [Next](@next)
