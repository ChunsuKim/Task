//: [Previous](@previous)
/*:
 # Type Check
 */

/*:
 ---
 ## 타입 확인 - type(of: )
 ---
 */
print("\n---------- [ type(of:) ] ----------\n")

type(of: 1)
type(of: 2.0)
type(of: "3")


// Any
let anyArr: [Any] = [1, 2.0, "3"]
type(of: anyArr[0])
type(of: anyArr[1])
type(of: anyArr[2])


// Generic
func printGenericInfo<T>(_ value: T) {
  let types = type(of: value)
  print("'\(value)' of type '\(types)'")
}
printGenericInfo(1)
printGenericInfo(2.0)
printGenericInfo("3")



/*:
 ---
 ## 타입 비교 - is
 ---
 */
print("\n---------- [ is ] ----------\n")

/***************************************************
 객체 is 객체의 타입  -> true or false
 ***************************************************/

let strArr = ["A", "B", "C"]

if strArr[0] is String {
  "String"
} else {
  "Something else"
}

if strArr[0] is Int {
  "Int"
}



//let someAnyArr: [Any] = [1, 2.0, "3"]

//for data in someAnyArr {
//  if data is Int {
//    print("Int type data :", data)
//  } else if data is Double {
//    print("Double type data : ", data)
//  } else {
//    print("String type data : ", data)
//  }
//}

let someAnyArr: [Any] = [2, 3.14, "apple"]
for data in someAnyArr {
    if data is Int {
        print("Int type data : ", data)
    } else if data is Double {
        print("Double type data : ", data)
    } else {
        print("String type data : ", data)
    }
}



/*:
 ---
 ## 상속 관계
 ---
 */
print("\n---------- [ Subclassing ] ----------\n")

class Human {
  var name: String = "name"
}
class Baby: Human {
  var age: Int = 1
}
class Student: Human {
  var school: String = "school"
}
class UniversityStudent: Student {
  var univName: String = "Univ"
}

let student = Student()
student is Human    // true 자식 클래스 is 부모 클래스
student is Baby     // false
student is Student  // true 자기 자신 is 자기 자신

let univStudent = UniversityStudent()
univStudent is Student      // true 자식 클래스 is 부모 클래스
student is UniversityStudent    // false 부모 클래스 is 자식 클래스


/***************************************************
 자식 클래스 is 부모 클래스  -> true
 부모 클래스 is 자식 클래스  -> false
 ***************************************************/


let babyArr = [Baby()]
type(of: babyArr)   // [Baby] 타입,   strArr = ["1", "2"] 와 마찬가지


// Q. 그럼 다음 someArr 의 Type 은?

let someArr = [Human(), Student(), Baby(), UniversityStudent()]
type(of: someArr)

//someArr[0] = Human()
someArr[0] is Human    // true
someArr[0] is Student  // false
someArr[0] is UniversityStudent  // false
someArr[0] is Baby     // false

//someArr[1] = Student()
someArr[1] is Human    // true
someArr[1] is Student  // true
someArr[1] is UniversityStudent  // false
someArr[1] is Baby     // false

//someArr[2] = Baby()
someArr[2] is Human    // true
someArr[2] is Student  // false
someArr[2] is UniversityStudent  // false
someArr[2] is Baby     // true

//someArr[3] = UniversityStudent()
someArr[3] is Human    // true
someArr[3] is Student  // true
someArr[3] is UniversityStudent  // true
someArr[3] is Baby     // false




var human: Human = Student()        // human type

// Q. human 변수의 타입, name 속성의 값, school 속성의 값은?
type(of: human)
human.name    // human type
//human.school  // student type so that error will be printed


// Q. Student의 인스턴스가 저장된 human 변수에 다음과 같이 Baby의 인스턴스를 넣으면?
human = Baby()                  // human type
human = UniversityStudent()     // human type


var james = Student()           // student type
james = UniversityStudent()     // student type
//james = Baby()    //          // error 상속관계 없음

// Q. 다음 중 james 가 접근 가능한 속성은 어떤 것들인가
james.name     // Human 속성
//james.age      // Baby 속성
james.school   // Student 속성
//james.univName // UniversityStudent 속성


// Q. 그럼 james 객체가 univName을 사용할 수 있도록 하려면 뭘 해야 할까요
//type casting 으로 타입을 변환해준다.

//: [Next](@next)
