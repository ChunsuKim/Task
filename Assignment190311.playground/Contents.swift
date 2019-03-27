// 이름과 나이를 입력 받아 자신을 소개하는 글을 출력하는 함수 2점

func myname(name: String) -> String {
    let introducename = "My name is, " + name + "!"
    return introducename
}

func myage(old: String) -> String {
    let introduceage = "I am " + old + " years old."
    return introduceage
}

print(myname(name: "Chunsu Kim"))
print(myage(old: "37"))

//func introduceMySelf(withName name: String, age: Int) {
//    print("안녕하세요. 제 이름은 \(name)이고 나이는 \(age)살입니다.")
//}
//
//introduceMySelf(withName: "Tory", age: 4)


// 정수를 하나 입력받아 2의 배수 여부를 반환하는 함수 8점
func multipliesOfTwo(number:Int) -> String {
    var trueFalse: String = ""
    
    if number%2 == 0 {
        trueFalse = "2의 배수"
    }else {
        trueFalse = "2의 배수가 아님"
    }
    
    return trueFalse
}

print(multipliesOfTwo(number: 6))
print(multipliesOfTwo(number: 7))

//func isEven(number: Int) -> Bool {
//    return number % 2 == 0
//}
//
//isEven(number: 6)
//isEven(number: 5)


// 정수를 두 개 입력 받아 곱한 결과를 반환하는 함수 (파라미터 하나의 기본 값은 10) 4점
func multiply(a:Int, b:Int = 10) -> Int {
    return a * b
}

print(multiply(a: 7))
print(multiply(a: 4, b: 6))

//func multiplyTwoNumbers(op1: Int, op2: Int = 10) -> Int {
//    return op1 * op2
//}
//
//multiplyTwoNumbers(op1: 20, op2: 5)
//multiplyTwoNumbers(op1: 5)


// 4과목의 시험 점수를 입력받아 평균 점수를 반환하는 함수 8점
func testAverage(_ testScore: Int...) -> Int {
    var average = 0
    for grade in testScore {
        average += grade
    }
    return average / testScore.count
}

print("My test average is : \(testAverage(90, 100, 95, 93, 100))")

//func averageScore(score1: Double, score2: Double, score3: Double, score4: Double) -> Double {
//    let sum = score1 + score2 + score3 + score4
//    return sum / 4
//}
//
//averageScore(score1: 79, score2: 85.5, score3: 90.5, score4: 81)
//
//
//func averageScore(scores: Double...) -> Double {
//    var sum = 0.0
//    for score in scores {
//        sum += score
//    }
//    return sum / Double(scores.count)
//}
//
//averageScore(scores: 79, 85.5, 90.5, 81)


// 점수(문자 또는 숫자)를 입력받아 학점을 반환하는 함수 만들기 (90점 이상 A, 80점 이상 B, 70점 이상 C, 그 이하 F)

// 숫자를 입력받는 경우 5점
func myScore(score: Int) -> String {
    var grade = " "
    if score >= 90 {
        grade = "A"
    }else if score >= 80 {
        grade = "B"
    }else if score >= 70 {
        grade = "C"
    }else {
        grade = "F"
    }
    return grade
}

//func calculateGrade(from score: Int) -> String {
//    let grade: String
//    if score >= 90 {
//        grade = "A"
//    } else if score >= 80 {
//        grade = "B"
//    } else if score >= 70 {
//        grade = "C"
//    } else {
//        grade = "F"
//    }
//    return grade
//}
//
//calculateGrade(from: 100)
//calculateGrade(from: 80)
//calculateGrade(from: 50)


// 문자를 입력받는 경우 10점
func myGrade(grade: String) -> String {
    var score = " "
    let scoreWill:Int? = Int(grade)
    
    if scoreWill! >= 90 {
        score = "A"
    }else if scoreWill! >= 80 {
        score = "B"
    }else if scoreWill! >= 70 {
        score = "C"
    }else {
        score = "F"
    }
    return score
}

print("My grade is : " + myScore(score: 100))
print("My grade is : " + myGrade(grade: "90"))




// 점수(문자 또는 숫자)를 여러 개 입력받아 평균 점수에 대한 학점을 반환하는 함수 만들기 (90점 이상 A, 80점 이상 B, 70점 이상 C, 그 이하 F)
// 10점
func myAverage(_ testScore: Int...) -> String {
    var average = 0
    for grade in testScore {
        average += grade
    }
    let sumGrade = average / testScore.count
    
    var credit = " "
    
    if sumGrade >= 90 {
        credit = "A"
    }else if sumGrade >= 80 {
        credit = "B"
    }else if sumGrade >= 70 {
        credit = "C"
    }else {
        credit = "F"
    }
    return credit
}

print("My average grade is : " + myAverage(90, 95, 93, 100, 97))

// Array를 이용한 방식
//func calculateGrade(from scores: [Int]) -> String {
//    var sum = 0.0
//    for score in scores {
//        sum += Double(score)
//    }
//    sum /= Double(scores.count)
//
//    if sum >= 90 {
//        return "A"
//    } else if sum >= 80 {
//        return "B"
//    } else if sum >= 70 {
//        return "C"
//    } else {
//        return "F"
//    }
//}
//
//calculateGrade(from: [100, 100, 90, 85])



// Variadic 파라미터를 이용한 방식
//func calculateGrade(from scores: Int...) -> String {
//    var sum = 0.0
//    for score in scores {
//        sum += Double(score)
//    }
//    sum /= Double(scores.count)
//
//    if sum >= 90 {
//        return "A"
//    } else if sum >= 80 {
//        return "B"
//    } else if sum >= 70 {
//        return "C"
//    } else {
//        return "F"
//    }
//}
//
//calculateGrade(from: 81, 95, 70, 60)
//calculateGrade(from: 92, 84, 70, 99)
