//
//  InternalClass.swift
//  AccessControl
//
//  Created by giftbot on 17/09/2018.
//  Copyright © 2018 giftbot. All rights reserved.
//

import Foundation

class InternalClass {
  public var publicProperty = 1                 // main 에서 접근가능
  internal var internalProperty = 2             // main 에서 접근가능
  fileprivate var fileprivateProperty = 3       // main 에서 접근불가능
  private var privateProperty = 4               // main 에서 접근불가능
  
  var defaultProperty = 5                       // main 에서 접근가능
}
