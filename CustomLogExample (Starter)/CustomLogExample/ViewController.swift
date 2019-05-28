//
//  ViewController.swift
//  CustomLogExample
//
//  Created by giftbot on 28/05/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  let dog = Dog()
  let cat = Cat()

  @IBAction private func didTapPrint(_ sender: Any) {
    print("\n---------- [ print ] ----------\n")
    print("Hello, world!")
    print(1...10)
    print(dog)
    print(cat)
    print(self)
    
    print("\n---------- [ debugPrint ] ----------\n")
    debugPrint("Hello, world!")
    debugPrint(1...10)
    debugPrint(dog)
    debugPrint(cat)
    debugPrint(self)
  
    print("\n---------- [ dump ] ----------\n")
    dump("Hello, world!")
    dump(1...10)
    dump(dog)
    dump(cat)
    dump(self)
  }
  
  @IBAction private func didTapNSLog(_ sender: Any) {
    print("\n---------- [ NSLog ] ----------\n")
    NSLog("Hello, world!")
    NSLog("%@", self)
    
//    NSLog("%@", dog)
//    NSLog("%@", cat.description)
  }
  
  @IBAction private func didTapSpecialLiterals(_ sender: Any) {
    print("\n---------- [ didTapSpecialLiterals ] ----------\n")
    print("file :", #file)
    print("function :", #function)
    print("line :", #line)
    print("column :", #column)
    
    print("\n------ [ example ] ------\n")
    print("< \(#function) [\(#line)] > \(cat)")
  }
  
  @IBAction private func didTapCustomLog(_ sender: Any) {
    print("\n---------- [ Custom Log ] ----------\n")
    logger(cat)
    logger(dog)
    
    print("\n---------- [ With Header ] ----------\n")
    logger(cat, header: "Cat")
    logger(dog, header: "Dog")

  }
  
  @IBAction private func didTapTestButton(_ sender: Any) {
    print("\n---------- [ Test ] ----------\n")
  }
}



