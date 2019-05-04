//
//  Menu.swift
//  DominoPizza
//
//  Created by Chunsu Kim on 29/04/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import Foundation

class Singleton {
    static let shared = Singleton()
    private init() {}
    
    var wishListDict: [String: Int] = [:]
}
