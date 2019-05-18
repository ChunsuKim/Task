//
//  MyViewController.swift
//  Instagram
//
//  Created by Wi on 03/05/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit


// 닉네임과 프로필 이미지를 변경하게 될 컨트롤러 입니다.
// 여기서 닉네임과 프로필 이미지를 변경한 다음 부터는 피드를 추가할때 등록된 닉네임과 프로필 이미지로 피드가 등록되어야 합니다.
// 닉네임 중복검사는 선택사항입니다. 
// 기본 값이 UITableViewController 입니다. 기본 뷰컨트롤러로 구현하고 싶으시면 타입을 UIViewController로 바꿔주세요.

class MyViewController: UITableViewController {
    
    let userManager = UserManager.shared
    let picker = UIImagePickerController()
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        userManager.getUserInfo { [weak self] user in
            self?.user = user
        }
        tableView.reloadData()
        self.title = user?.userName
    }
    
    func configure() {
        userManager.getUserInfo { [weak self] user in
            self?.user = user
        }
        self.title = user?.userName
        
        picker.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(nickNameChange(_:)), name: Notification.Name("nickNameChange"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(profileImageChange(_:)), name: Notification.Name("profileImageView"), object: nil)
        
        tableView.register(UINib(nibName: "MyViewTableViewCell", bundle: nil), forCellReuseIdentifier: "myView")
        tableView.separatorColor = .clear
    }
    
    @objc private func nickNameChange(_ sender: Notification) {
        guard let nickName = sender.userInfo?["nickName"] as? String else { return }
        userManager.changeUserName(userName: nickName) {[weak self] in
            if $0 {
                self?.createOkAlert(title: "닉네임 변경성공", message: "변경된 닉네임: " + $1)
                return
            }
            self?.createOkAlert(title: "닉네임 중복", message: $1)
        }
    }
    
    @objc private func profileImageChange(_ sender: Notification) {
        createSheetAlert(title: "이미지 선택", message: "")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myView", for: indexPath) as! MyViewTableViewCell
        cell.selectionStyle = .none
        cell.model = user
        
        return cell
    }
    
    private func createOkAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { [weak self] _ in
            self?.userManager.getUserInfo { [weak self] user in
                self?.user = user
            }
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    private func createSheetAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: "카메라로 찍기", style: .default) { [weak self] _ in
            self?.picker.sourceType = .camera
            self?.present(self!.picker, animated: true, completion: nil)
        }
        let libraryAction = UIAlertAction(title: "앨범에서 가져오기", style: .default) { [weak self] _ in
            self?.picker.sourceType = .photoLibrary
            self?.present(self!.picker, animated: true, completion: nil)
        }
        let cancelAction = UIAlertAction(title: "닫기", style: .cancel, handler: nil)
        
        alert.addAction(cameraAction)
        alert.addAction(libraryAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
}

extension MyViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        user?.profileImage = info[.originalImage] as? UIImage
        userManager.changeUserInfo(user: user!) {
            user = $0
        }
        tableView.reloadData()
        picker.dismiss(animated: true, completion: nil)
    }
}
