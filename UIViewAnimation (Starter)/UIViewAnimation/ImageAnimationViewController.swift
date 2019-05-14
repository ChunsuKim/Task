//
//  ImageAnimationViewController.swift
//  UIViewAnimation
//
//  Created by giftbot on 2019. 5. 6..
//  Copyright © 2019년 giftbot. All rights reserved.
//

import UIKit

final class ImageAnimationViewController: UIViewController {
  
  @IBOutlet private weak var imageView: UIImageView!
  @IBOutlet private weak var durationLabel: UILabel!
  @IBOutlet private weak var repeatCountLabel: UILabel!
    
    let images = ["AppStore", "Calculator", "Calendar", "Camera", "Clock", "Contacts", "Files"].compactMap(UIImage.init(named:))    // compactMap{ UIImage.init(named: $0) }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    imageView.animationImages = images
  }
  
  @IBAction private func startAnimation(_ sender: Any) {
    imageView.startAnimating()
  }
  
  @IBAction private func stopAnimation(_ sender: Any) {
    guard imageView.isAnimating else { return }
    imageView.stopAnimating()
  }
  
  @IBAction private func durationStepper(_ sender: UIStepper) {
    durationLabel.text = "\(sender.value)"
    
    // Default: 0.0 - 1 second per 30 images : 1 cycle
    imageView.animationDuration = sender.value
  }
  
  @IBAction private func repeatCountStepper(_ sender: UIStepper) {
    let repeatCount = Int(sender.value)
    repeatCountLabel.text = "\(repeatCount)"
    
    // Default: 0 - infinity    ex) value: 2 - repeat images 2 cycles.
    imageView.animationRepeatCount = repeatCount
  }
}
