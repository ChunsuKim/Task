//
//  AppDelegate.swift
//  DominoPizza
//
//  Created by Chunsu Kim on 29/04/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    let categoryVC = CategoryViewController()
    let wishListVC = WishListViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions LaunchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        setupKeyWindow()
        
        categoryVC.productVC.detailVC.delegate = self
        
        return true
    }
    
    func setupKeyWindow() {
        
        
        
        // TabBar setting
        categoryVC.tabBarItem = UITabBarItem(title: "Domino`s", image: nil, tag: 0)
        wishListVC.tabBarItem = UITabBarItem(title: "Wish List", image: nil, tag: 1)
        
        
        // Navigation Controller setting
        let categoryNaviController =
            UINavigationController(rootViewController: categoryVC)
        let wishNaviController = UINavigationController(rootViewController: wishListVC)
        wishNaviController.title = "Wish List"
        
        let tabBarController = UITabBarController()
        tabBarController.setViewControllers([categoryNaviController, wishNaviController], animated: true)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
    
}

extension AppDelegate: DetailViewControllerDelegate {
    func reload() {
        wishListVC.selectedPizzas = ItemManager.shared.countDict.keys.sorted()
        wishListVC.tableView.reloadData()
    }
}
