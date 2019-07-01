//: [Previous](@previous)
/*:
 ---
 # Inheritance
 ---
 */

class Cat {
  let leg = 4
  func cry() {
    print("miaow")
  }
}

class KoreanShortHair: Cat {}

let cat = Cat()
print(cat.leg)
cat.cry()

let koshort = KoreanShortHair()
print(koshort.leg)
koshort.cry()


/*:
 ---
 ### Question
 Person, Student, University Student 클래스 구현하고 관련 속성 및 메서드 구현
 - 상속을 하지 않고 각각 개별적으로 만들면 어떻게 구현해야 하는지 확인
 - 상속을 적용하면 어떻게 바뀌는지 확인
 ---
 */
class Person {
    let name = "Mikey"
    let age = 26
    let gender = "male"
    
    func sleep() {
        print("sleep")
    }
    func walk() {
        print("walk")
    }
    
}

class Student {
    let name = "Mikey"
    let age = 26
    let gender = "male"
    let grade = "A"
    
    func sleep() {
        print("sleep")
    }
    func walk() {
        print("walk")
    }
    func study() {
        print("study")
    }
}

class UniversityStudent {
    let name = "Mikey"
    let age = 26
    let gender = "male"
    let grade = "A"
    let major = "Finance"
    let havingCar = "yes"
    
    func sleep() {
        print("sleep")
    }
    func walk() {
        print("walk")
    }
    func study() {
        print("study")
    }
    func drive() {
        print("drive")
    }
}

let person1 = Person()
print(person1.name)
person1.sleep()

let student1 = Student()
print(student1.grade)
student1.study()

let universityStudent1 = UniversityStudent()
print(universityStudent1.major)
universityStudent1.drive()

//-----------------------------------------------
class HumanBeing {
    let name = "Cathy"
    let age = 24
    let gender = "female"
    
    func sleep() {
        print("sleep")
    }
    func eat() {
        print("eat")
    }
}

class FemaleStudent : HumanBeing {
    let grade = "B"
    
    func study() {
        print("study")
    }
}

class CollegeStudent : FemaleStudent {
    let major = "Business"
    
    func drive() {
        print("drive")
    }
}

let collegeStudent1 = CollegeStudent()
print(collegeStudent1.name)
collegeStudent1.drive()

/*:
 ## final
 */
print("\n---------- [ Final ] ----------\n")

class Shape {
}

final class Circle: Shape {
}

//class Oval: Circle {
//}



/*:
 ---
 ### Answer
 ---
 */

class Person1 {
  let name = "홍길동"
  let age = 20
  
  func eat() {
    print("eat")
  }
}


print("\n---------- [ Without Subclassing ] ----------\n")

//class Student1 {
//  let name = "홍길동"
//  let age = 20
//  let grade = "A"
//
//  func eat() {
//    print("eat")
//  }
//  func study() {
//    print("study")
//  }
//}
//
//class UniversityStudent1 {
//  let name = "홍길동"
//  let age = 20
//  let grade = "A"
//  let major = "Computer Science"
//
//  func eat() {
//    print("Eat")
//  }
//  func study() {
//    print("Study")
//  }
//  func goMT() {
//    print("Go membership training")
//  }
//}


print("\n---------- [ Subclassing ] ----------\n")

class Student1: Person1 {
  let grade = "A"
  
  func study() {
    print("study")
  }
}

class UniversityStudent1: Student1 {
  let major = "Computer Science"
  
  func goMT() {
    print("Go membership training")
  }
}



//: [Next](@next)
