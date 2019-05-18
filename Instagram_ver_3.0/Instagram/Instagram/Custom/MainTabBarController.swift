//
//  MainViewController.swift
//  Instagram
//
//  Created by Wi on 29/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit
// VC들을 가지고있을 탭바입니다.
// 탭바컨트롤러에서 어떤일을 해야할지 생각해보세요.

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {
    // MARK: - Properties
    let homeViewController = HomeViewController()
    let plusViewController = PlusViewController()
    let myViewController = MyViewController()
    
    let picker = UIImagePickerController()

    
    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    func configure() {
        picker.delegate = self
        self.delegate = self
        // tabBar image setting
        homeViewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: AppImageData.homeNomal), selectedImage: UIImage(named: AppImageData.homeSelected))
        plusViewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: AppImageData.plus), selectedImage: UIImage(named: AppImageData.plus))
        
        self.viewControllers = [UINavigationController.init(rootViewController: homeViewController), plusViewController, UINavigationController(rootViewController: myViewController)]
    }
    
    // 탭바를 선택했을때 불릴 함수 입니다.
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        if viewController == plusViewController {
            picker.sourceType = .photoLibrary
            self.present(picker, animated: true, completion: nil)
            return false
        }
        return true
    }
}

// MARK: - UIImagePickerController Delegate
extension MainTabBarController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // method for receiving the images
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        NotificationCenter.default.post(name: NSNotification.Name("photoSelected"), object: nil, userInfo: ["image": info[.originalImage]])
        picker.dismiss(animated: false, completion: nil)
    }
}
