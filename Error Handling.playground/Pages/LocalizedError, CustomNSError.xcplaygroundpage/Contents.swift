//: [Previous](@previous)
import Foundation
/*:
 ---
 # LocalizedError, CustomNSError
 ---
 */
// MARK: - Localized Error
enum MyError: Error {
  case errorWithoutParam
  case errorWithParam(num: Int)
}

func throwsErrorExample() {
  do {
    throw MyError.errorWithoutParam
  } catch {
    print(error.localizedDescription)
  }
}
throwsErrorExample()



// MARK: - Custom Localized Error
print("\n---------- [ LocalizedError ] ----------\n")

enum CustomizedError: Error {
  case errorWithoutParam
  case errorWithParam(num: Int)
}

func localizedErrorExample() {
  do {
    throw CustomizedError.errorWithoutParam
  } catch {
    print(error.localizedDescription)
    
    let e = error as NSError
    print(e.localizedFailureReason ?? "")
    print(e.localizedRecoverySuggestion ?? "")
    print(e.helpAnchor ?? "")
  }
}
localizedErrorExample()


// MARK: - Custom Localized Error Extension
extension CustomizedError: LocalizedError {
  var errorDescription: String? {
    switch self {
    case .errorWithoutParam:
      return NSLocalizedString("Error without parameter", comment: "")
    case .errorWithParam(let x):
      return NSLocalizedString("Error with param \(x)", comment: "")
    }
  }

  var failureReason: String? {
    return NSLocalizedString("failureReason", comment: "")
  }
  var recoverySuggestion: String? {
    return NSLocalizedString("recoverySuggestion", comment: "")
  }
  var helpAnchor: String? {
    return NSLocalizedString("helpAnchor", comment: "")
  }
}



// MARK: - Custom NSError
print("\n---------- [ CustomNSError ] ----------\n")

func customNSErrorExample() {
  do {
    throw CustomizedError.errorWithoutParam
  } catch {
    let e = error as NSError
    print(e.domain)
    print(e.code)
    print(e.userInfo)
  }
}
customNSErrorExample()


// MARK: - Custom NSError Extension
extension CustomizedError: CustomNSError {
  static var errorDomain: String { return "myErrorDomain" }
  var errorCode: Int { return -10 }
  var errorUserInfo: [String : Any] { return ["My": "UserInfo"] }
}


//: [Next](@next)
