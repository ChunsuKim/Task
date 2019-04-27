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

/***************************************************
 safeAreaInsets  /  safeAreaLayoutGuide 의 차이점에 대해 작성
 ***************************************************/

/*
 safeAreaInsets : safe Area를 제외한 부분 예를들면 아이폰 x에서는 세로 방향일때 상,하 safe area insets를 가지고, 가로 방향일때는 왼쪽, 오른쪽 safe area insets를 가짐.
 
 safeAreaLayoutGuide : Auto Layout을 설정할때 사용되며 아이폰에 노치가 생기면서 safeAreaLayoutGuide가 사용됨.
 Apple이 정해놓은 safeArea 안에 AutoLayout을 맞출 수 있다.
 
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

 




/***************************************************
 Strong, Unowned, Weak 각각의 특징과 차이점에 대해 설명
 ***************************************************/

 /*
 
 strong : 기본값(default). 강한 참조. Reference Count 1 증가
 
 unowned : 미소유 참조. Count 증가하지 않음. 참조 객체 해제 시에도 기존 포인터 주소 유지
 
 weak : 약한 참조. Count 증가하지 않음. 참조하던 객체 해제 시 nil 값으로 변경
 
 */



//: [Next](@next)
