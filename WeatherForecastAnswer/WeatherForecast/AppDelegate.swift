//
//  AppDelegate.swift
//  WeatherForecast
//
//  Created by giftbot on 09/06/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        window = UIWindow(frame: .screenBounds)
        window?.backgroundColor = .white
        window?.rootViewController = WeatherCasterViewController()
        window?.makeKeyAndVisible()
        
        return true
    }
    
    
}
