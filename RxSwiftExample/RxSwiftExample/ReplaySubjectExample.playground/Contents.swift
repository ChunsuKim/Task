import Foundation
import RxSwift


let disposeBag = DisposeBag()
let numbers$ = ReplaySubject<Int>.create(bufferSize: 2)

numbers$
    .subscribe(onNext: { print("Observer 1: \($0)") })
    .disposed(by: disposeBag)

numbers$.onNext(0)
numbers$.onNext(1)

numbers$.subscribe(onNext: { print("Observer 2: \($0)") })
    .disposed(by: disposeBag)

numbers$.onNext(2)
numbers$.onNext(3)
numbers$.onCompleted()

/*
 Observer 1: 0
 Observer 1: 1
 Observer 2: 0
 Observer 2: 1
 Observer 1: 2
 Observer 2: 2
 Observer 1: 3
 Observer 2: 3
 */


