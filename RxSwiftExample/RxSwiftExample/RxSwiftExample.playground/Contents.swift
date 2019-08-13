import Foundation
import RxSwift


// generic type
let a: Int = 0 // expression
let ss: Optional<String> = "" // expression

struct Foo<T> { // T, U, V, W, X
    let a: T
}

//let x: Foo<T> = 0 // 사용불가능
let y: Foo<Int> = Foo<Int>(a: 0) // 쓰는 시점에 타입이 결정
let z: Foo<String> = Foo<String>(a: "")

//
protocol Bar {
    associatedtype E
    var f: E { get }
}

struct Poo: Bar {
    typealias E = String
    var f: String
}

enum Event<Element> {
    case next(Element)
    case error(Error)
    case completed
}

// Swift.Optional
enum Optional<Element> {
    case next(Element)
    case completed
}

// Swift.Result
enum Result<Element, E> where E : Error {
    case next(Element)
    case error(E)
}


//
let x: Observable<Int> = Observable.just(1)

