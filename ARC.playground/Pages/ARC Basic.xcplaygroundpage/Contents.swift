//: [Previous](@previous)
/*:
 # ARC Basic
 */

class Person {
  let testCase: String
  init(testCase: String) {
    self.testCase = testCase
  }
  deinit {
    print("\(testCase) is being deinitialized")
  }
}


/*:
 ---
 ### case 1. Allocation & Release
 ---
 */
print("\n---------- [ Case 1 ] ----------\n")

var obj1: Person? = Person(testCase: "case1")
obj1 = nil  // rc = 0


/*:
 ---
 ### case 2. 참조 카운트 증가
 ---
 */
print("\n---------- [ Case 2 ] ----------\n")

var obj2: Person? = Person(testCase: "case2")
// rc 1
var countUp = obj2
// rc 2

obj2 = nil
// rc 1
countUp = nil
// rc 0

/*:
 ---
 ### case 3. Collection 에 의한 참조 카운트
 ---
 */
print("\n---------- [ Case 3 ] ----------\n")

var obj3: Person? = Person(testCase: "case3")
// rc = 1
var array = [obj3, obj3]
// rc += 2

obj3 = nil
// rc -= 1
array.remove(at: 0)
// rc -= 1
array.remove(at: 0)
// rc -= 1



/*:
 ---
 ### case 4. 강한 참조, 약한 참조
 - strong : 기본값. 강한 참조. Reference Count 1 증가
 - unowned : 미소유 참조. Count 증가하지 않음. 참조 객체 해제 시에도 기존 포인터 주소 유지
 - weak : 약한 참조. Count 증가하지 않음. 참조하던 객체 해제 시 nil 값으로 변경
 ---
 */

print("\n---------- [ Case 4 ] ----------\n")

var strongObj4 = Person(testCase: "case4")
print(strongObj4)

//weak var weakObj4 = Person(testCase: "case4")
//print(weakObj4)

//unowned var unownedObj4 = Person(testCase: "case4")
//print(unownedObj4)



/***************************************************
 unowned. weak  -  let , var
 ***************************************************/

// 다음 4줄의 코드 중 사용 불가능한 것은?

//unowned let unownedLet = strongObj4   // 사용 가능   하지만, run time error 발생 시킬 가능성 있음. 사용시 주의
unowned var unownedVar = strongObj4   // 사용 가능
//weak let weakLet = strongObj4         // 사용 불가능
weak var weakVar = strongObj4         // 사용 가능


// unowned 와 weak 의 타입은?
print("Unowned type: ", type(of: unownedVar))
print("Weak type: ", type(of: weakVar))



//: [Next](@next)
