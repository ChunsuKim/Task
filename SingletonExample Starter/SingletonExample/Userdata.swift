//
//  Userdata.swift
//  SingletonExample
//
//  Created by Chunsu Kim on 10/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import Foundation

class UserData {
    static let singleton = UserData()
    
    var userName = ""
    var userPassword = ""
    var userAge = ""
    var userPhone = ""
    
    private init() {}
}
