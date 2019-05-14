//
//  AnimationViewController.swift
//  UIViewAnimation
//
//  Created by giftbot on 2019. 5. 6..
//  Copyright © 2019년 giftbot. All rights reserved.
//

import UIKit

final class AnimationViewController: UIViewController {
  
  // MARK: - Properties
  
  @IBOutlet private weak var userIdLabel: UITextField!
  @IBOutlet private weak var passwordLabel: UITextField!
  @IBOutlet private weak var loginButton: UIButton!
  @IBOutlet private weak var activityIndicatorView: UIActivityIndicatorView!
  @IBOutlet private weak var countDownLabel: UILabel!
  
  var count = 4 {
    didSet { countDownLabel.text = "\(count)" }
  }
  
  // MARK: - View LifeCycle

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    userIdLabel.center.x = -view.frame.width
    passwordLabel.center.x = -view.frame.width
    loginButton.center.x = -view.frame.width
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    UIView.animate(withDuration: 0.6) {
        self.userIdLabel.center.x = self.userIdLabel.superview!.bounds.midX
    }
    
    // animation after 0.5 seconds
    UIView.animate(withDuration: 0.6, delay: 0.5, animations: {
        let midX = self.passwordLabel.superview!.bounds.midX
        self.passwordLabel.center.x = midX
    })
    
    UIView.animate(
        withDuration: 0.6,
        delay: 1,
        usingSpringWithDamping: 0.6,
        initialSpringVelocity: 0,
        options: [.curveEaseInOut],
        animations: {
            let midX = self.loginButton.superview!.bounds.midX
            self.loginButton.center.x = midX
    }) { print("isFinished :", $0) }
  }
  
  // MARK: - Action Handler
  
  @IBAction private func didEndOnExit(_ sender: Any) {}
  
  @IBAction private func login(_ sender: Any) {
    
    view.endEditing(true)
    
//    addAnimateKeyframes()
    loginButtonAnimation()
    countDown()
  }

  
  
  func loginButtonAnimation() {
    
    activityIndicatorView.startAnimating()
    
    let centerOrigin = loginButton.center
    UIView.animateKeyframes(
        withDuration: 1.6,
        delay: 0.0,
        animations: {
            // 로그인 버튼을 0.4초동안 우측 아래로 이동
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.25, animations: {
                self.loginButton.center.x += 50.0
                self.loginButton.center.y += 20.0
            })
            // 버튼이 45도 회전하여 우측 상단으로 이동하며 흐려지다가 사라짐
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25, animations: {
                self.loginButton.transform = CGAffineTransform(rotationAngle: .pi / 4)
                self.loginButton.center.x += 150.0
                self.loginButton.center.y -= 70.0
                self.loginButton.alpha = 0.0
            })
            // 처음에 있던 위치의 아래에 위치하도록 함 (안 보이는 상태)
            UIView.addKeyframe(withRelativeStartTime: 0.51, relativeDuration: 0.01) {
                self.loginButton.transform = .identity
                self.loginButton.center = CGPoint(
                    x: centerOrigin.x,
                    y: self.loginButton.superview!.frame.height + 120
                )
            }
            // 처음의 위치로 돌아오면서 다시 나타남
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25) {
                self.loginButton.alpha = 1.0
                self.loginButton.center = centerOrigin
            }
    }, completion: { _ in
        self.activityIndicatorView.stopAnimating()
    })
    
    // 45도 각도로 기울이기
//    loginButton.transform = CGAffineTransform(rotationAngle: .pi / 4)
    // 원래대로 돌리기
//    loginButton.transform = .identity
    
  }
  
    
  func countDown() {
    
    countDownLabel.isHidden = false
    
    UIView.transition(
        with: countDownLabel,
        duration: 0.5,  // transition 애니메이션이 적용되는 시간
        options: [.transitionCrossDissolve],
        animations: { self.count -= 1 }) { (isFinished) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                guard self.count == 0 else { return self.countDown() }
                self.count = 4
                self.countDownLabel.isHidden = true
            })
        }
    }
    
    
    func addAnimateKeyframes() {
        
        UIView.animateKeyframes(
            withDuration: 4,
            delay: 0,
            animations: {
                // 0초부터 시작해서 1초 동안 우측으로 이동
                UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.25, animations: {
                    self.loginButton.center.x += 100.0
                })
                // 1초 뒤 1초간 아래로 이동
                UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25, animations: {
                    self.loginButton.center.y += 100.0
                })
                UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25, animations: {
                    self.loginButton.center.x -= 100.0
                })
                UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25, animations: {
                    self.loginButton.center.y -= 100.0
                })
        })
    }
}