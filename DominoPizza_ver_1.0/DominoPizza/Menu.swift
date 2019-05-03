//
//  Menu.swift
//  DominoPizza
//
//  Created by Chunsu Kim on 29/04/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import Foundation

protocol MenuList {
    var title: String { get }
    var imageName: String { get }
    var count: Int { get set }
    var price: Int { get }
}

struct Menu: MenuList {
    
    var title: String
    var imageName: String
    var count: Int
    var price: Int
}

