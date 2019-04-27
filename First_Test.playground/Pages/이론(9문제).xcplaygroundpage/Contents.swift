//: [Previous](@previous)
import UIKit

/***************************************************
 1. Array, Set, Dictionary 의 차이점에 대해 설명하고 예시 코드 작성
 ***************************************************/
// Array: 배열은 같은 타입의 다중 값이 정렬된 순서로 저장함. 배열에서 같은 값이지만 시간이 다르면 각각 다른 위치에 있음.
// Set: 집합은 순서가 없는 중복되지 않는 값들의 컬렉션입니다.
// Dictionary: 딕셔너리는 같은 타입의 여러 값을 저장하고 있는 컨테이너. 각각의 값은 유일한 식별자는 딕셔너리 안에 값과 연관됨. 배열과는 다르게 특정한 순서를 가지지 않음.


/*
 > 간단히 비교
 Array - ordered collections of values.
 Set - unordered collections of unique values.
 Dictionary - unordered collections of key-value associations.
 
 > 개별 내용
 Array
 - An ordered, random-access collection.
 - 주요 특징
 1) 인덱스를 기반으로, 값이 저장된 순서가 있음 (Zero-based Integer Index)
 2) 중복 허용
 
 Set
 - An unordered collection of unique elements.
 - 주요 특징
 1) Array 처럼 같은 타입을 가진 연관된 값들의 모음
 2) 단, 순서가 없으며 중복 비허용
 
 Dictionary
 - A collection whose elements are key-value pairs.
 - 주요 특징
 1) Key - Value 쌍으로 이루어져 있어, 둘 중 하나만으로 존재하지 않음
 2) Key는 중복 비허용, Value는 중복 허용
 3) 순서 없음
 */


/***************************************************
 2. Value Type, Reference Type 에 대한 예시와 그 차이점에 대해 설명
 ***************************************************/
//Value Type: 데이터를 전달할 때 값을 복사하여 전달
//Reference Type: 데이터를 전달할 때 값의 메모리 위치를 전달

/*
 Value types (값 타입)
 - struct, enum, tuple
 - each instance keeps a unique copy of its data
 - 메모리의 Stack 영역에 데이터가 저장
 - Copy on Write  (지금은 몰라도 무관)
 - 멀티 스레드 환경에서 유용  (지금은 몰라도 무관)
 
 struct S { var number = 10 }
 var a = S()
 var b = a
 a.number = 20
 print("\(a.number), \(b.number)")  // "10, 20"
 
 
 Reference types (참조 타입)
 - usually defined as a class  (반드시 클래스에만 해당하지는 않음)
 - instances share a single copy of the data
 - 메모리의 Stack 영역에 데이터가 담긴 주소를 가르키는 포인터가 저장되고, Heap 영역에 실제 데이터가 저장
 
 class C { var number = 10 }
 var x = C()
 var y = x
 x.number = 20
 print("\(x.number), \(y.number)")  // "20, 20"
 */

/***************************************************
 3. Application의 LifeCycle의 각 상태에 대해 설명
 ***************************************************/
//Not Running: 앱이 실행되지 않은 상태

//(Inactive와 Active 상태를 합쳐서 Foreground 라고 함)
//Inactive: 앱이 실행중인 상태 그러나 아무런 이벤트를 받지 않는 상태

//Active: 앱이 실행중이며 이벤트가 발생한 상태

//Background: 앱이 백그라운드에 있는 상태 그러나 실행되는 코드가 있는 상태

//Suspended: 앱이 백그라운드에 있고 실행되는 코드가 없는 상태

/*
 Not running (= Terminated)
 - The app has not been launched or was running but was terminated by the system.
 - 아직 실행하지 않은 상태
 - 시스템 또는 유저에 의해 앱이 종료된 상태
 
 Inactive
 - The app is running in the foreground but is not receiving events. This might happen as a result of an interruption or because the app is transitioning to or from the background.
 - 포그라운드에서 앱이 실행중이지만 앱 상태 전환 등의 이유로 이벤트를 일시적으로 받지 못하는 상태
 - Active 상태로 전환되기 전 잠시 거치는 단계
 
 Active
 - The app is running in the foreground and currently receiving events. This is the normal mode for foreground apps.
 - 포그라운드에서 앱이 실행 중이며 이벤트를 정상적으로 수신받을 수 있는 상태
 
 Background
 - The app is in the background and executing code. Most apps enter this state briefly on their way to being suspended. However, an app that requests extra execution time may remain in this state for a period of time.
 - 백그라운드에서 앱이 실행 중인 상태 또는 Suspended 상태로 넘어가기 직전 잠시 머무는 단계
 
 Suspended
 - The app is in the background but is not executing code. The system moves apps to this state automatically and does not notify them before doing so. While suspended, an app remains in memory but does not execute any code. When a low-memory condition occurs, the system may purge suspended apps without notice to make more space for the foreground app.
 - 앱이 백그라운드에 있으며 메모리에는 남아있지만 어떤 코드도 수행하지 않고 있는 상태
 - 메모리가 부족해지면 시스템에 의해 강제 종료될 수 있음
 */


/***************************************************
 4. ViewController LifeCycle의 각 상태에 대해 설명
 ***************************************************/
//ViewWillAppear : 뷰의 처음 생성. 뷰가 user의 눈에 보이기 직전 상태
//ViewDidAppear : 뷰가 user의 눈에 보인 상태
//ViewWillDisappear : 뷰를 없애는 명령을 내린 상태
//ViewDidDisappear : 뷰가 사라진 후의 상태

/*
 viewDidLoad - view에 대한 로드가 완료된 시점(메모리상에 저장됨)에 호출
 viewWillAppear - view를 화면에 나타내기 직전 호출
 viewDidAppear - view를 화면에 나타낸 직후 호출
 viewWillDisappear - view가 화면에서 사라지기 직전 호출
 viewDidDisappear - view가 화면에서 사라진 직후 호출
 
 (번외 - 적지 않았어도 무방)
 loadView - viewController의 rootView로 사용할 view를 로드할 때 사용
 deinit - viewController가 더 이상 필요하지 않아 메모리상에서 제거하기 직전에 호출
 */

/***************************************************
 5. 다음 4개의 키워드 (continue, break, return, fallthrough)가 쓰이는 위치와 역할에 대해 각각 설명
 ***************************************************/
// continue : 루프 맨 앞으로 제어를 넘김(중문 문장이 있는 경우에는 그 문장을 실행)
// break : 루프에서 제어를 빠져나옴
// return : 함수등 값을 반환하는 곳에서 쓰임. return 메세지가 나오면 즉시 값을 반환
// fallthrough : case에서 다음 case로 계속 실행을 이어나가고 싶을 때 이를 명시함

/*
 continue
 - The continue statement tells a loop to stop what it is doing and start again at the beginning of the next iteration through the loop
 - *반복문* 내에서 사용
 - 현재 수행하던 작업을 중단하고 반복문의 다음 반복자를 수행
 
 break
 - The break statement ends execution of an entire control flow statement immediately. The break statement can be used inside a switch or loop statement when you want to terminate the execution of the switch or loop statement earlier than would otherwise be the case.
 - *반복문* 또는 *switch문* 내에서 사용
 - 현재 반복문 또는 switch문에서 수행하던 작업을 중단하고 즉시 해당 제어문에서 빠져나옴
 
 return
 - *함수* 내에서 사용
 - 해당 함수의 작업을 즉각 중단하며 동시에 그 함수의 return type에 맞는 값을 반환
 - 함수가 실행되었을 때 기대되는 어떤 결과값(Output)을 함수를 호출한 곳으로 반환해주는 역할
 
 fallthrough
 - The fallthrough keyword simply causes code execution to move directly to the statements inside the next case (or default case) block, as in C’s standard switch statement behavior.
 - *switch문* 내에서 사용
 - switch문 내에서 첫 번째로 매칭된 케이스가 수행된 후 바로 종료하는 대신 그 다음의 케이스까지 수행하게 하는 역할
 */

/***************************************************
 6. Init 메서드가 필요한 경우가 그렇지 않은 경우의 차이점에 대해 설명
 ***************************************************/
//init 메서드는 초기화 함수이며, super 클래스로 부터 상속을 받은 경우
//자식 클래스에서 super 클래스의 정의된 변수를 사용하기 위해 init 메서드를 사용한다.

//상속을 받지 않은 경우는 init메서드를 사용할 필요가 없다.

/*
 모든 저장 프로퍼티(stored property)에 초기화 값이 설정되어 있으면 Init 메서드 불필요,
 하나라도 그렇지 않은 것이 있으면 Init 메서드 필요
 */


/***************************************************
 7. Access Level 을 각 단계별로 나열하고 그 차이점에 대해 설명
 ***************************************************/
//open (가장 개방적) > public > internal (기본 레벨) > fileprivate > private (가장 제한적)

//- open 접근 및 public 접근을 통해 엔티티를 정의 모듈의 모든 소스 파일 내에서 사용할 수 있으며, 정의한 모듈을 가져오는 다른 모듈의 소스파일에서도 사용할 수 있습니다. 일반적으로 Framework에 공용 인터페이스를 지정할 때는 open 또는 public 접근을 사용합니다.
//      open 접근은 클래스 및 클래스 멤버에만 적용되며, 다음이 public접근과 다른점입니다.
//      ● public접근 또는 더 제한적인 접근 수준이 있는 클래스는 정의 된 모듈 내에서만 서브 클래싱 할 수 있습니다.
//      ● public접근 권한이 있는 클래스 멤버 또는 제한적인 접근 수준은 정의 된 모듈 내에서만 하위 클래스에 의해 override 될 수 있습니다.
//      ● open 클래스는 정의 된 모듈 내에서 서브 클래싱 될 수 있으며 정의 된 모듈을 가져오는 모듈 내에서 서브 클래싱 될 수 있습니다.
//      ● open클래스 멤버는 정의 된 모듈 내의 하위 클래스와 정의 된 모듈을 가져오는 모든 모듈에서 override 될 수 있습니다.
//- internal 접근은 엔티티가 정의 모듈의 모든 소스 파일 내에서 사용되지만, 해당 모듈 외부의 소스파일에서는 사용되지 않도록 합니다. 일반적으로 App이나  Framework의 내부 구조를 정의할 때 internal 접근을 사용합니다.
//- File-private 접근은 자체 정의 소스 파일에 대한 엔티티 사용을 제한합니다. File-private접근을 사용하면 해당 세부 정보가 전체 파일 내에서 사용 될 때 특정 기능의 구현 세부 정보를 숨길 수 있습니다.
//- private접근은 엔티티의 사용을  enclosing 선언과 동일한 파일에 있는 해당 선언의 extension으로 제한합니다. private접근을 사용하면 단일 정의 내에서만 사용되는 특정 기능 조각의 구현 상세 내역을 숨길 수 있습니다.

/*
 open - 외부 모듈에서도 접근 가능하며 오버라이드 가능
 public - 외부 모듈에서도 접근 가능하도록 하되 오버라이드 불가
 internal - 해당 모듈 내에서만 접근 가능하도록 제한
 fileprivate - 해당 파일 내에서만 접근 가능하도록 제한
 private - 해당 스코프({ }) 내에서만 접근 가능하도록 제한
 */


/***************************************************
 8. OOP 4대 특성에 대해 나열하고 각 특성에 대해 아는 만큼 설명 및 예시 코드 작성
 ***************************************************/
/*
Inheritance (상속) : 하나의 클래스의 특징(부모 클래스)을 다른 클래스가 물려받아 그 속성과 기능을 동일하게 사용하는 것 범용적인 클래스를 작성한 뒤 상속을 이용해 중복되는 속성과 기능을 쉽게 구현 가능
 Abstraction (추상화) : 대상의 불필요한 부분을 무시하여 복잡성을 줄이고 목적에 집중할 수 있도록 단순화 시키는 것
 Encapsulation (캡슐화) : 추상화가 디자인 레벨에 해당하는 개념이라면 캡슐화는 구현 레벨에서의 개념
                        - 데이터 캡슐화 (Data Encapsulation): 연관된 상태와 행동을 하나의 단위 (객체) 로 캡슐화
                        - 정보 은닉화 (Information Hiding): 외부에 필요한 것만 알리고 불필요하거나 감출 정보는 숨김
 Polymorphism : 다양한 형태로 나타날 수 있는 능력 / 여러 형태(many shapes)를 가진다는 의미의 그리스어에서 유래 동일한 요청에 대해 각각 다른 방식으로 응답할 수 있도록 만드는 것
                오버라이딩(상속과 관련)과 오버로딩(상속과 무관)이 있으며 언어에 따라 오버라이딩만 지원하기도 함
                override : 오버라이딩 - 상위 클래스에서 상속 받은 메서드를 하위 클래스에서 필요에 따라 재정의하는 것
                                   - 동일 요청이 객체에 따라 다르게 응답
                overload : 오버로딩 - 동일한 이름의 메서드가 매개 변수의 이름, 타입, 개수 등의 차이에 따라 다르게 동작하는 것
                                  - 동일 요청이 매개 변수에 따라 다르게 응답
*/

/***************************************************
 9. Frame 과 Bounds 의 차이점에 대해 설명
 ***************************************************/
//Frame과 Bounds는 UIView의 instance property 입니다.


//Frame : SuperView(상위뷰)의 좌표시스템안에서 View의 위치와 크기를 나타냅니다. frame의 핵심. 바로 SuperView(상위뷰)입니다. 이때, 상위뷰라는 것은 한단계 상위뷰를 의미해요.

//Bounds: View의 위치와 크기를 자신만의 좌표시스템안에서 나타냅니다. bounds의 핵심. 바로 자신만의 좌표시스템을 쓴다는 것입니다.

/*
 Frame
 - The frame rectangle, which describes the view’s location and size in its superview’s coordinate system.
 - superview의 좌표계를 기반으로 해당 view에 대한 위치(좌표)와 사이즈를 나타내는 사각형
 - 원점(0, 0)은 부모뷰(superview)의 시작 지점이며,
 원점을 변경하면 자신의 위치가 이동하고 이에 따라 자신의 하위 뷰도 함께 움직임
 
 Bounds
 - The bounds rectangle, which describes the view’s location and size in its own coordinate system.
 - 자기 자신의 좌표계를 기반으로 그 뷰의 위치와 사이즈를 표현하는 사각형
 - 원점(0, 0)은 자체 뷰의 시작 지점이며, 원점을 변경하면 자신의 하위 뷰에만 영향을 줌
 */




/***************************************************
 위 개념들은 아직 익숙치 않아서 답변하지 분들이 많으실 거라고 생각해요.
 그래도 중요한 내용들이니 작성하지 못한 질문들은 체크해두었다가 천천히 공부하세요.
 ***************************************************/

//: [Next](@next)
