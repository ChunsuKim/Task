//
//  FirstViewController.swift
//  NotificationCenterExample
//
//  Created by giftbot on 28/04/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class FirstViewController: UIViewController {
  
  @IBOutlet private weak var myTextField: UITextField!
    
//    var slidingTextField = false
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //
    NotificationCenter.default.addObserver(self, selector: #selector(didReceiveKeyboardNotification(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    
    
    NotificationCenter.default.addObserver(self, selector: #selector(didReceiveKeyboardNotification(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    
    
//    UIApplication.didBecomeActiveNotification
    
    NotificationCenter.default.addObserver(self, selector: #selector(testNotification(_:)), name: UIApplication.didBecomeActiveNotification, object: nil)
    
//    UIApplication.didEnterBackgroundNotification
    //
  }
    
  
  @IBAction private func didEndOnExit(_ sender: Any) {}
    
    //
    @objc func testNotification(_ noti: Notification) {
        print("didBecomActiveNotification")
    }
    
    @objc func didReceiveKeyboardNotification (_ noti: Notification) {
//        print(noti)
        
        guard let userInfo = noti.userInfo,
        let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect,
        let duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval
            else { return }
        
        print(keyboardFrame)
        print(duration)
        
        UIView.animate(withDuration: duration) {
            
            if keyboardFrame.minY >= self.view.frame.maxX {
                self.myTextField.frame.origin.y += keyboardFrame.height
            } else {
                self.myTextField.frame.origin.y -= keyboardFrame.height
            }
            
//            self.myTextField.frame.origin.y -= 250
//            self.slidingTextField = true
            
        }
    }
    //
    
  deinit {
    NotificationCenter.default.removeObserver(self)
  }
}
