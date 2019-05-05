//
//  AppDelegate.swift
//  NotificationAssign
//
//  Created by Chunsu Kim on 05/05/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window? = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        
        let firstVC = ViewController()
        let secondVC = SecondViewController()
        let thirdVC = ThirdViewController()
        
        firstVC.tabBarItem = UITabBarItem(title: "First", image: nil, tag: 0)
        secondVC.tabBarItem = UITabBarItem(title: "Second", image: nil, tag: 1)
        thirdVC.tabBarItem = UITabBarItem(title: "Third", image: nil, tag: 2)
        
        thirdVC.title = "Third"
        
        secondVC.noti()
        
        let thirdNavi = UINavigationController(rootViewController: thirdVC)
        
        let tabbarController = UITabBarController()
        tabbarController.viewControllers = [firstVC, secondVC, thirdNavi]
        
        window?.rootViewController = tabbarController
        window?.makeKeyAndVisible()
        
        return true
    }
}

