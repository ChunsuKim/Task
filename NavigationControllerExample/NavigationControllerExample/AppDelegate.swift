//
//  AppDelegate.swift
//  NavigationControllerExample
//
//  Created by Chunsu Kim on 05/04/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
// 코드 입력부분 시작
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        
        let vc = ViewController()
        let naviController = UINavigationController(rootViewController: vc)
        window?.rootViewController = naviController
        window?.makeKeyAndVisible()
// 코드 입력부분 끝
        return true
    }




}

/*
 navigation controller : push and pop
 
 segue : present and dismiss
 */
