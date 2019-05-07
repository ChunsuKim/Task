//
//  TouchViewController.swift
//  GestureRecognizerExample
//
//  Created by giftbot on 02/05/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class TouchViewController: UIViewController {

  @IBOutlet private weak var imageView: UIImageView!
    var imageHolding = false
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    imageView.layer.cornerRadius = imageView.frame.width / 2
//    imageView.layer.masksToBounds = true
    imageView.clipsToBounds = true
    
  }
    
    // MARK: - Touch가 시작될때 실행되는 method
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        guard let touch = touches.first else { return }
        let touchPoint = touch.location(in: touch.view)
        
        if imageView.frame.contains(touchPoint) {   // image를 선택했을 때만 반응하게 함.
        imageView.image = UIImage(named: "cat2")
        imageHolding = true
        }
        print(" ------ touch began ------ ")
        print(touchPoint)
    }
    
    // MARK: - Touch 상태로 움직일때 실행되는 method
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        guard imageHolding, let touch = touches.first else { return }
        let touchPoint = touch.location(in: touch.view)
        
        imageView.frame.contains(touchPoint)
//        imageView.center = touchPoint   // image center를 클릭하여 image를 움직인다.
        
        print(" ------ touch moved ------ ")
        print(touchPoint)
    }
    
    // MARK: - Touch가 끝났을 때 실행되는 method
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        guard let touch = touches.first else { return }
        let touchPoint = touch.location(in: touch.view)
        
        imageView.image = UIImage(named: "cat1")
        imageHolding = false
        print(" ------ touch ended ------ ")
        print(touchPoint)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        guard let touch = touches.first else { return }
        let touchPoint = touch.location(in: touch.view)
        
        imageView.image = UIImage(named: "cat1")
        print(" ------ touch cancelled ------ ")
        print(touchPoint)
    }
}



