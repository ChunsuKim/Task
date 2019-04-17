//[ 과제 ]
// 수요일까지 제출
// 풀이는 목요일 전달

//1. 다음과 같은 속성(Property)과 행위(Method)를 가지는 클래스 만들어보기.
//구현 내용은 자유롭게
//
//** 강아지 (Dog)
//- 속성: 이름, 나이, 몸무게, 견종
//- 행위: 짖기, 먹기

class Dog {
    var name: String = "사월이"
    var age: Int = 2
    var weight: Int = 2
    var dogType: String = "요크셔테리어"
    
    func bowwow() {
        print("\(name)가 멍멍 짖습니다.")
    }
    
    func feeding() {
        print("\(name)가 맛있게 먹습니다.")
        
    }
}

var dog1 = Dog()
print("강아지의 이름 : \(dog1.name)")
print("\(dog1.name)의 나이 : \(dog1.age)살")
print("\(dog1.name)의 몸무게 \(dog1.weight)kg")
print("\(dog1.name)의 종류는 \(dog1.dogType)입니다.")

dog1.bowwow()
dog1.feeding()

//
//** 학생 (Student)
//- 속성: 이름, 나이, 학교명, 학년
//- 행위: 공부하기, 먹기, 잠자기

class Student {
    var name: String
    var age: Int
    var schoolName: String
    var classYear: Int
    
    init(name: String, schoolName: String, age: Int, classYear: Int) {
        self.name = name
        self.schoolName = schoolName
        self.age = age
        self.classYear = classYear
    }
    
    func studying() {
        print("\(name)이(가) \(schoolName) 도서관에서 공부합니다.")
    }
    
    func eating() {
        print("\(name)이(가) \(schoolName) 학교식당에서 점심을 먹습니다.")
    }
    
    func sleeping() {
        print("\(name)이(가) 집에서 잠을 잡니다.")
    }
}

var person1 = Student(name: "전지현", schoolName: "동국대", age: 25, classYear: 2)
person1.sleeping()
person1.studying()
person1.eating()

//
//** 아이폰(IPhone)
//- 속성: 기기명, 가격, faceID 기능 여부(Bool)
//- 행위: 전화 걸기, 문자 전송
//
//** 커피(Coffee)
//- 속성: 이름, 가격, 원두 원산지





//2. 계산기 클래스를 만들고 다음과 같은 기능을 가진 Property 와 Method 정의해보기
//
//** 계산기 (Calculator)
//- 속성: 현재 값
//- 행위: 더하기, 빼기, 나누기, 곱하기, 값 초기화
//
//ex)
//let calculator = Calculator() // 객체생성
//
//calculator.value  // 0
//
//calculator.add(10)    // 10
//calculator.add(5)     // 15
//
//calculator.subtract(9)  // 6
//calculator.subtract(10) // -4
//
//calculator.multiply(4)   // -16
//calculator.multiply(-10) // 160
//
//calculator.divide(10)   // 16
//calculator.reset()      // 0


class Calculator {
    var accumulator: Int = 0
    
    func add(_ num: Int) -> Int {
        accumulator = accumulator + num
        return accumulator
    }
    
    func subtract(_ num: Int) -> Int {
        accumulator = accumulator - num
        return accumulator
    }
    func multiply(_ num:Int) -> Int {
        accumulator = accumulator * num
        return accumulator
    }
    
    func division(_ num:Int) -> Int {
        accumulator = accumulator / num
        return accumulator
    }
    
    func reset() {
        accumulator = 0
    }
}

let calculator = Calculator()
calculator.add(10)
calculator.add(5)

calculator.subtract(9)
calculator.subtract(10)

calculator.multiply(4)
calculator.multiply(-10)

calculator.division(16)
calculator.reset()
