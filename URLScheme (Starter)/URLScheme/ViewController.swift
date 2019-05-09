//
//  ViewController.swift
//  URLScheme
//
//  Created by giftbot on 2019. 5. 4..
//  Copyright © 2019년 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
  
    // MARK: - System App
  @IBAction private func openSetting(_ sender: Any) {
    print("\n---------- [ openSettingApp ] ----------\n")
    
    guard let url = URL(string: UIApplication.openSettingsURLString), UIApplication.shared.canOpenURL(url) else { return }
    
//  swift < 5.0  UIApplicationOpenSettingsURLString
//  swift >= 5.0  UIApplication.openSettingsURLString
    
    if #available(iOS 10.0, *) {
        UIApplication.shared.open(url)
    } else {
        UIApplication.shared.canOpenURL(url)
    }
    
  }
  
  @IBAction private func openMail(_ sender: Any) {
    print("\n---------- [ openMail ] ----------\n")
    
//    let scheme = "mailto:"
//    let scheme = "mailto:someone@mail.com"  // 받는 사람 지정
//    let scheme = "mailto:?cc=foo@bar.com&subject=title&body=MyText" // 추가 파라미터
    let scheme = "mailto:someone@mail.com?cc=foo@bar.com&subject=title&body=MyText"
    
    guard let url = URL(string: scheme), UIApplication.shared.canOpenURL(url)
        else { return }
    UIApplication.shared.open(url)
    
  }

  @IBAction private func openMessage(_ sender: Any) {
    print("\n---------- [ openMessage ] ----------\n")
    
//    let url = URL(string: "sms:")!
//    let url = URL(string: "sms:010-9999-9999")! // 받는 사람 지정
    let url = URL(string: "sms:010-9999-9999&body=Hello")! // 받는 사람 지정 및 자동 메시지추가
    
    guard UIApplication.shared.canOpenURL(url) else { return }
    UIApplication.shared.open(url)
    
  }
  
  @IBAction private func openWebsite(_ sender: Any) {
    print("\n---------- [ openWebsite ] ----------\n")
    
    let url = URL(string: "https://google.com")!
    
    guard UIApplication.shared.canOpenURL(url) else { return }
    UIApplication.shared.open(url)
    
  }
    
  // MARK: - 3rd Party App
  @IBAction private func openFacebook(_ sender: Any) {
    print("\n---------- [ openFacebook ] ----------\n")
    
    // iOS 9.0 이상부터 화이트 리스트 등록 plist
    let facebookScheme = URL(string: "instagram://app")!
    print(UIApplication.shared.canOpenURL(facebookScheme))
    guard UIApplication.shared.canOpenURL(facebookScheme) else { return }
    UIApplication.shared.open(facebookScheme)
    
    // facebook scheme: fb://   plist: fb
    // instagram scheme: instagram://app    plist: instagram
  }
  
  @IBAction private func openMyApp(_ sender: Any) {
    print("\n---------- [ openMyApp ] ----------\n")
    
//    let url = URL(string: "myApp:")!
//    let url = URL(string: "myApp://?name=tory&age=5")!
    let url = URL(string: "myApp://host?name=tory&age=5")!

    // 화이트 리스트 등록
    guard UIApplication.shared.canOpenURL(url) else { return }
    UIApplication.shared.open(url)
  }
}




