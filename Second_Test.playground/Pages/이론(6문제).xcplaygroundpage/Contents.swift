//: [Previous](@previous)
import Foundation


/***************************************************
 1) 업캐스팅과 다운캐스팅에 대하여 설명하고,
 2) 업캐스팅과 다운캐스팅을 시도할 때 사용하는 키워드에 대해 각각 설명
 ***************************************************/

/*
 업 캐스팅: 자식 클래스 자료형에서 부모 클래스 자료형으로 변환할 때 사용
 다운 캐스팅: 부모 클래스 자료형에서 자식 클래스 자료형으로 변환할 때 사용
 
 as : 업 캐스팅때 사용
        인스턴스 객체 as 변환할 자료형
 
 as? : 다운 캐스팅때 사용되며 옵셔널 자료형으로 변환할 때 사용
        인스턴스 객체 as? 변환할 자료형
 
 as! : 다운 캐스팅때 사용되며 강제로 일반자료형으로 변환할 때 사용
 */

/*
 1)
 업 캐스팅
 - 상속 관계에 있는 자식 클래스가 부모 클래스로 형 변환하는 것
 - 업캐스팅은 항상 성공하며 as 키워드를 사용
 (자기 자신에 대한 타입 캐스팅도 항상 성공하므로 as 키워드 사용)
 
 다운 캐스팅
 - 형제 클래스나 다른 서브 클래스 등 수퍼 클래스에서 파생된 각종 서브 클래스로의 타입 변환 의미
 - 반드시 성공한다는 보장이 없으므로 옵셔널. as? 또는 as! 를 사용
 
 2)
 - as  : 타입 변환이 확실하게 가능한 경우(업캐스팅, 자기 자신 등) 에만 사용 가능. 그 외에는 컴파일 에러
 - as? : 강제 타입 변환 시도. 변환이 성공하면 Optional 값을 가지며, 실패 시에는 nil 반환
 - as! : 강제 타입 변환 시도. 성공 시 언래핑 된 값을 가지며, 실패 시 런타임 에러 발생
 */


/***************************************************
 TableView 아래의 두 메서드가 각각
 1) 언제 사용되고  2) 차이점은 무엇인지에 대하여 작성
 - dequeueReusableCell(withIdentifier:)
 - dequeueReusableCell(withIdentifier:for:)
 ***************************************************/

/*
 1) tableview dataSource 에서 셀을 재 사용할 때 사용
 
 2) 차이점
 dequeueReusableCell(withIdentifier:) : 셀을 새로 생성하지 않고 생성된 셀을 재사용할 때 사용하며 indexPath 값을 전달하는 것이 아닌 String 같은 자료형 값을 전달할 때 사용
 Returns a reusable table-view cell object located by its identifier
 
 dequeueReusableCell(withIdentifier: for:) : 셀을 새로 생성하지 않고 생성된 셀을 재사용할 때 사용하며 indexPath 값을 전달할 때 사용
 Returns a reusable table-view cell object for the specified reuse identifier and adds it to the table
 */

/*

    override func dequeueReusableCell(withIdentifier identifier: String) -> UITableViewCell? {
        <#code#>
    }
    
    override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
}
*/

/*
 1) 메서드 사용 시점
 register메서드를 통해 사용할 셀을 등록했거나 스토리보드에서 셀을 만들었을 때
 dequeueReusableCell(withIdentifier:for:) 사용,
 그 외의 경우는 dequeueReusableCell(withIdentifier:) 사용
 
 2) 차이점
 dequeueReusableCell(withIdentifier:)메서드는 반환 타입이 옵셔널이기에
 입력한 ID가 틀리거나 없어도 nil을 반환할 뿐 오류가 발생하지 않지만
 dequeueReusableCell(withIdentifier:for:)메서드는 미리 등록한 ID를 찾지 못하면
 반드시 런타임 에러가 발생
 */

/***************************************************
 safeAreaInsets  /  safeAreaLayoutGuide 의 차이점에 대해 작성
 ***************************************************/

/*
 safeAreaInsets : safe Area를 제외한 부분 예를들면 아이폰 x에서는 세로 방향일때 상,하 safe area insets를 가지고, 가로 방향일때는 왼쪽, 오른쪽 safe area insets를 가짐.
 
 safeAreaLayoutGuide : Auto Layout을 설정할때 사용되며 아이폰에 노치가 생기면서 safeAreaLayoutGuide가 사용됨.
 Apple이 정해놓은 safeArea 안에 AutoLayout을 맞출 수 있다.
 
 */

/*
 safeAreaInsets
 - View와 SafeArea 영역 간의 간격 정보
 - Frame 기반으로 레이아웃을 잡을 때 사용
 
 safeAreaLayoutGuide
 - SafeArea 영역의 경계선 부분
 - AutoLayout 기반으로 레이아웃을 잡을 때 사용
 */


/***************************************************
 아래 두 메서드의 공통점과 차이점에 대해 작성
 - init(frame: CGRect)
 - required init?(coder aDecoder: NSCoder)
 ***************************************************/

/*
 공통점 : 초기화 함수 init method
 
 
 차이점
 
 init(frame: CGRect) : Designated Initializer
 
 클래스에 반드시 1개 이상 필요
 초기화가 필요한 모든 프로퍼티를 단독으로 초기화 가능한 Initializer
 초기화 과정에서 반드시 한 번은 호출
 
 required init?(coder aDecoder: NSCoder): Required Initializer, Failable Initializer
 
 Required Initializer
 - 상속받은 클래스에서 반드시 작성해주어야 하는 초기화 메서드가 있을 때 required 키워드 사용
 - 이 경우 서브 클래스에서는 해당 초기화 메서드를 반드시 작성해주어야 하며, override 키워드 생략 가능
 
 Failable Initializer
 인스턴스 생성시 특정 조건을 만족하지 않으면 객체를 생성하지 않는 것
 생성이 되면 옵셔널 타입을 반환하게 되며, 생성 실패시에는 nil 반환
 */

/*
 공통점
 - UIView의 초기화 메서드
 - 초기화 메서드를 별도로 작성하지 않았을 경우는 두 메서드 모두 미구현해도 무관
 
 차이점
 - init(frame: CGRect)메서드는 코드로 초기화할 때 사용
 required init?(coder aDecoder: NSCoder)메서드는 스토리보드에서 초기화할 때 사용
 - 다른 초기화 메서드를 하나라도 정의할 경우에는
 required init?(coder aDecoder: NSCoder)메서드 역시 반드시 정의해야 하지만(required)
 init(frame: CGRect)메서드는 옵셔널
 */

/***************************************************
 Strong Reference Cycle 에 대해 1) 설명하고 2) 예시 코드 작성
 ***************************************************/

/*
 deinit을 해주지 않으면 앱이 종료될때 까지 메모리상에 남아 있다.
 
 아래 예시 코드처럼 nil 값을 할당해 deinit 시켜준다.
 */


 class Person {
    var car: Sedan?
    func doSomething() {}
    deinit {
        print("Person is being deinitialized")
    }
 }
 
 class Sedan {
    var owner: Person?
    func doSomething() {}
    deinit {
        print("Sedan is being deinitialized")
    }
 }
 
 
 
 var driver: Person! = Person()
 var bmw: Sedan! = Sedan()
 
 driver.car = bmw
 bmw.owner = driver
 
 driver.doSomething()
 bmw.doSomething()
 
 // deinit 방법
 driver.car = nil
 bmw.owner = nil
 //
 driver = nil
 bmw = nil

/*
 서로 다른 (클래스의)인스턴스간 순환(cycle)이 되는 강한 참조를 유지하고 있어
 더 이상 사용되지 않거나 외부에서 접근할 수 있는 수단이 없음에도
 각 인스턴스가 다른 인스턴스를 지속해서 활성 상태로 만들게 되는 상태를 일컬음
 
 class A {
 var b: B?
 }
 class B {
 var a: A
 init(a: A) { self.a = a }
 }
 var a: A? = A()
 var b: B? = B(a: a!)
 a?.b = b
 a = nil
 b = nil
 */
 




/***************************************************
 Strong, Unowned, Weak 각각의 특징과 차이점에 대해 설명
 ***************************************************/

 /*
 
 strong : 기본값(default). 강한 참조. Reference Count 1 증가
 
 unowned : 미소유 참조. Count 증가하지 않음. 참조 객체 해제 시에도 기존 포인터 주소 유지
 
 weak : 약한 참조. Count 증가하지 않음. 참조하던 객체 해제 시 nil 값으로 변경
 
 */



//: [Next](@next)
