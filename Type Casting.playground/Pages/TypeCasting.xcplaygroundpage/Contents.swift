//: [Previous](@previous)
/*:
 # Type Casting
 ---
 - as  : 타입 변환이 확실하게 가능한 경우(업캐스팅, 자기 자신 등) 에만 사용 가능. 그 외에는 컴파일 에러
 - as? : 강제 타입 변환 시도. 변환이 성공하면 Optional 값을 가지며, 실패 시에는 nil 반환
 - as! : 강제 타입 변환 시도. 성공 시 언래핑 된 값을 가지며, 실패 시 런타임 에러 발생
 ---
 */

import UIKit

class Shape {
  var color = UIColor.black
  
  func draw() {
    print("draw shape")
  }
}

class Rectangle: Shape {
  var cornerRadius = 0.0
  override var color: UIColor {
    get { return .white }
    set { }
  }
  
  override func draw() {
    print("draw rect")
  }
}

class Triangle: Shape {
  override func draw() {
    print("draw triangle")
  }
}

class Circle: Shape {
  var radius = 50.0
  
  override func draw() {
    print("draw circle")
  }
}

/***************************************************
 Shape
  - Rectangle
  - Triangle
  - Circle
 모두 draw() 오버라이드
 ***************************************************/


/*:
 ---
 ## Upcasting
 ---
 */
print("\n---------- [ Upcasting ] ----------\n")

/***************************************************
 업 캐스팅
 - 상속 관계에 있는 자식 클래스가 부모 클래스로 형 변환하는 것
 - 업캐스팅은 항상 성공하며 as 키워드를 사용
 (자기 자신에 대한 타입 캐스팅도 항상 성공하므로 as 키워드 사용)
 e.g.
 let someone: Student = Student()
 let human1: Human = someone as Human
 let human2: Human = someone as Student
 ***************************************************/


let rect = Rectangle()
type(of: rect)
rect.color
rect.cornerRadius


let upcastedRect: Shape = Rectangle()
type(of: upcastedRect)   //
upcastedRect.color
//upcastedRect.cornerRadius         // cornerRadius 는 Rectangle type 에만 있기 때문에 error 발생


(rect as Shape) is Shape    // true
(rect as Shape) is Rectangle   // true shape is rectangle
(rect as Rectangle) is Shape   // true
(rect as Rectangle) is Rectangle   // true

(upcastedRect as Shape) is Shape   // true
//(upcastedRect as Rectangle) is Rectangle   // error upcastedRect = shape type / shape type은 rect, tri, circle 타입이 있으므로 반드시 rect이라고 보장할 수 없기때문에 error 발생.
//반드시 성공하는 타입 변환 = 부모클래스거나 자기 자신


/*:
 ---
 ## Downcasting
 ---
 */
print("\n---------- [ Downcasting ] ----------\n")

/***************************************************
 다운 캐스팅
 - 형제 클래스나 다른 서브 클래스 등 수퍼 클래스에서 파생된 각종 서브 클래스로의 타입 변환 의미
 - 반드시 성공한다는 보장이 없으므로 as? 또는 as! 를 사용
 e.g.
 let someone = Student()
 let student1 = someone as? Student   // Optional(Student)
 let student2 = someone as! Student   // Student
 let baby1 = someone as? Baby         // nil
 let baby2 = someone as! Baby         // Runtime Error
 ***************************************************/


let shapeRect: Shape = Rectangle()
shapeRect.color    //
//shapeRect.cornerRadius   // error


//let downcastedRect: Rectangle = shapeRect // error
//let downcastedRect: Rectangle = shapeRect as Rectangle   // error : 항상 성공할 수 없기때문에 발생


// as? 타입 변환이 성공하면 Optional 값으로 들어가고 실패하면 nil
// as! 성공하면 값이 그대로 들어가고 실패하면 에러
//let downcastedRect: Rectangle = shapeRect as? Rectangle  // error - Rectangle이 Rectangle? 이면 가능
//let downcastedRect: Rectangle = shapeRect as! Rectangle  // 가능 (단, 확실하게 변환 가능한것만 시도)
//downcastedRect.color         //
//downcastedRect.cornerRadius  //


if let downcastedRect = shapeRect as? Rectangle {
  print(downcastedRect)
}




//Q. 아래 value 에 대한 Casting 결과는?
let value = 1
//(value as Float) is Float   // comfile error - Int 와 Float는 전혀 관계 없다
//(value as? Float) is Float  // false - 변환실패 nil is float
//(value as! Float) is Float  // runtime error


/*:
 ---
 ## Type Check Operator
 ---
 */
let shape = Shape()
let rectangle = Rectangle()
let triangle = Triangle()
let circle = Circle()

let list = [shape, rectangle, triangle, circle]
/*:
 ---
 ### Question
 - 아래 for 문에 대한 실행 결과는?
 ---
 */
//for elem in list {
//  if elem is Shape { // 자식 클래스 is 부모 클래스 -> always true / for 문에서는 순서가 중요함. elem is shape을 맨 밑으로 두는게 좋음
//    print("shape instance")
//  } else if elem is Rectangle {
//    print("rect instance")
//  } else if elem is Triangle {
//    print("triangle instance")
//  } else if elem is Circle {
//    print("circle instance")
//  }
//}



print("\n---------- [ = ] ----------\n")

// let list: [Shape] = [shape, rectangle, triangle, circle]
for element in list  {
  element.draw()
}


//: [Next](@next)
