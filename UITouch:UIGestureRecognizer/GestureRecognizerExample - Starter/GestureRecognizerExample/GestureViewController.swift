//
//  GestureViewController.swift
//  GestureRecognizerExample
//
//  Created by giftbot on 02/05/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

class GestureViewController: UIViewController {
  
  @IBOutlet private weak var imageView: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    imageView.layer.cornerRadius = imageView.frame.width / 2
    imageView.layer.masksToBounds = true
    
  }
    
    var isQuadruple = false
    @IBAction func handleTapGesture(_ sender: UITapGestureRecognizer) {
        print("Double Tapped")
        
        if !isQuadruple {   // double tap할때 이미지 크기 커졌다 줄어들기
            imageView.transform = imageView.transform.scaledBy(x: 2, y: 2)
        } else {
            imageView.transform = CGAffineTransform.identity
        }
        isQuadruple.toggle()
    }
    
    @IBAction func handleRotationGesture(_ sender: UIRotationGestureRecognizer) {
        
        let rotation = sender.rotation
        
        // 이미지를 로테이션 시키기 방법 1) 이미지 크기를 유지한 체 로테이션
        imageView.transform = imageView.transform.rotated(by: rotation)
        sender.rotation = 0
        
        
        // 방법 2) 이미지를 원래대로 돌리고 로테이션
//        imageView.transform = CGAffineTransform.identity.rotated(by: rotation)
    }
    
    @IBAction func handleSwipeGesture(_ sender: UISwipeGestureRecognizer) {
        
        // 좌,우 swift할때 이미지 바꾸기
        let direction = sender.direction
        
        switch direction {
        case .left:
            imageView.image = UIImage(named: "cat1")
        case .right:
            imageView.image = UIImage(named: "cat2")
        default:
            break
        }
        
//        if sender.direction == .left {
//            imageView.image = UIImage(named: "cat1")
//        } else {
//            imageView.image = UIImage(named: "cat2")
//        }
        
        
    }
    
    
}
