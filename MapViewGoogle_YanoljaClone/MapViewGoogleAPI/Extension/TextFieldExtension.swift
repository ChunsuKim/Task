//
//  TextFieldExtension.swift
//  MapViewGoogleAPI
//
//  Created by Chunsu Kim on 14/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit
import CoreLocation

extension UITextField {
    func setLeftPaddingPoints(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        leftView = paddingView
        leftViewMode = .always
    }
    
    func setRightPaddingPoints(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        rightView = paddingView
        rightViewMode = .always
    }
    
    func returnIntTextValue() -> Int? {
        if let text = self.text {
            return Int(text)
        }
        return nil
    }
}



