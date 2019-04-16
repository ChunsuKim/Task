//[ 과제 ]
// 제출 : 수요일 밤까지 과제 제출용 폴더에 Playground 파일 업로드
// 정답 풀이는 목요일 전달
// 항목별 체감 난이도도 주석으로 같이 적어주세요.

// - 두 개의 자연수를 입력받아 두 수를 하나의 숫자로 이어서 합친 결과를 정수로 반환하는 함수
// (1과 5 입력 시 15,  29와 30 입력 시 2930,  6과 100 입력 시 6100)
func addNum(_ num:(Int, Int)) -> Int {
    var i: Int
    i = Int(String(num.0) + String(num.1))!
    return i
}
print(addNum((29,30)))



// - 문자열 두 개를 입력받아 두 문자열이 같은지 여부를 판단해주는 함수
func twoString(_ str:(String, String)) -> Bool {
    if str.0 == str.1 {
        return true
    } else {
        return false
    }
}
print(twoString(("fastcampus", "fastcampus")))
print(twoString(("MacOS", "iOS")))



// - 자연수를 입력받아 그 수의 약수를 모두 출력하는 함수
func divisor(num: Int) -> Int {
    for n in 1...num {
        if num % n == 0 {
            print(n)
        } else {
            continue
        }
    }
    return num
}
divisor(num: 12)



// - 2 이상의 자연수를 입력받아, 소수인지 아닌지를 판별하는 함수
func judgeNum(num: Int) -> Bool {
    var jud: Bool = true
    
    for na in 2...(num-1) {
        if num % na == 0 {
            jud = false
        }
    }
    return jud
}
judgeNum(num: 9)
judgeNum(num: 7)



// - 자연수 하나를 입력받아 피보나치 수열 중에서 입력받은 수에 해당하는 자리의 숫자를 반환하는 함수
// 참고로 피보나치 수열은 이전 두 수의 합이 다음 수가 되는 수열
// (입력된 숫자가 4면 0, 1, 1, 2, 3, 5 ... 에서 4번째 위치인 2 출력.    )
func fibonacci(_ a: Int) {
    var x = 0
    var y = 1
    var addNum = 0
    
    switch a {
    case 1:
        print(0)
    case 2:
        print(1)
    default:
        for _ in 1...(a - 2) {
            addNum = x + y
            x = y
            y = addNum
        }
        print(addNum)
    }
}
fibonacci(5)



// - 100 이하의 자연수 중 3과 5의 공배수를 모두 출력하는 함수
func threeFive() {
    print("The common multiple of 3 and 5 are :", terminator: " ")
    for i in 1...100 {
        if (i % 3 == 0), (i % 5 == 0) {
            print(i, terminator: " ")
        }
    }
}
threeFive()





