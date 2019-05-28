//
//  Pets.swift
//  CustomLogExample
//
//  Created by giftbot on 28/05/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import Foundation

class Dog: CustomStringConvertible, CustomDebugStringConvertible {
    var debugDescription: String = ""
    
    var description: String = ""
    
  let name = "Tory"
  let age = 5
  let feature: [String: String] = [
    "breed": "Poodle",
    "tail": "short"
  ]
    
//    var debugDescription: String {
//        return "Dog's name: \(name), age: \(age)"
//    }
//
//    var description: String {
//        return "Dog's name: \(name), age: \(age), feature: \(feature)"
//    }
}

struct Cat: CustomStringConvertible, CustomDebugStringConvertible {
    
    
  let name = "Lilly"
  let age = 2
  let feature: [String: String] = [
    "breed": "Koshort",
    "tail": "short"
  ]
    
    var debugDescription: String {
        return "Cat's name: \(name), age: \(age)"
    }
    
    var description: String {
        return "Cat's name: \(name), age: \(age), feature: \(feature)"
    }
}
