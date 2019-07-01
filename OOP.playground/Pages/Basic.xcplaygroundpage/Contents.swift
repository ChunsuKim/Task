//: [Previous](@previous)
/*:
 # Class
 */
/***************************************************
 Value Type => struct, enum, Int  (Stack 에 저장)
 Reference Type => class  (Heap 에 저장)
 메모리 : Code, Data, Heap, Stack
 ***************************************************/

/***************************************************
 class <#ClassName#>: <#SuperClassName#>, <#ProtocolName...#> {
   <#PropertyList#>
 
 }
 
 <#ClassName()#>     // heap에 데이터 저장 // instance 생성 // 변수에 저장하지 않으면 사라짐
 
 class - 정의
 instance - class 를 메모리에 생성한 것
 object - instance 를 담아두고 실제 사용하는 놈
 
 let <#instanceName#> = <#ClassName()#>
 instanceName.<#propertyName#>
 instanceName.<#functionName()#> = methodName()
 ***************************************************/


class Dog {
  var color = "White"
  var eyeColor = "Black"
  var height = 30.0
  var weight = 6.0
  
  func sit() {
    print("sit")
  }
  func layDown() {
    print("layDown")
  }
  func shake() {
    print("shake")
  }
}


let bobby: Dog = Dog()
bobby.color
bobby.color = "Gray"
bobby.color
bobby.sit()

let tory = Dog()
tory.color = "Brown"
tory.layDown()

// stack, heap
// stack - bobby = 주소값 0x0001 -> heap - bobby`s dog data



/*:
 ---
 ### Question
 - 자동차 클래스 정의 및 객체 생성하기
 ---
 */
/***************************************************
 자동차 클래스
 - 속성: 차종(model), 연식(model year), 색상(color) 등
 - 기능: 운전하기(drive), 후진하기(reverse) 등
 ***************************************************/

class Car1 {
    let model = "BMW 3 series"
    let modelYear = "2016"
    let color = "Navy"
    
    func drive() {
        print("전진")
    }
    func reverse() {
        print("후진")
    }
    func driveSlowly() {
        print("서행")
    }
}

let car1 = Car1()
car1.model
car1.modelYear
car1.color
car1.drive()
car1.reverse()




/*:
 ---
 ### Answer
 ---
 */
class Car {
  let model = "리어카"
  let modelYear = 2016
  let color = "Cream White"
  
  func drive() {
    print("전진")
  }
  func reverse() {
    print("후진")
  }
}

let car = Car()
car.model
car.modelYear
car.color
car.drive()
car.reverse()



//: [Next](@next)
