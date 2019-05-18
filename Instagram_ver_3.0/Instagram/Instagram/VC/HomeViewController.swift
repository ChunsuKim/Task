//
//  ViewController.swift
//  Instagram
//
//  Created by Wi on 11/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

// 피드데이터를 보여줄 컨트롤러 입니다.
// 왼쪽 상단에 카메라 버튼이 있습니다.

class HomeViewController: UIViewController {
    
    var tableView = UITableView()
    var feedDataArray = [FeedData]()
    let picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        autoLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        feedDataArray = FeedManager.shared.returnFeedData()
        tableView.reloadData()
    }
    
    func configure() {
        naviSetting()
        tableViewRegister()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorColor = .clear
        
        view.addSubview(tableView)
        
        NotificationCenter.default.addObserver(self, selector: #selector(pushCommentVC(_:)), name: NSNotification.Name(rawValue: "CommentTap"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(photoSelected(_:)), name: NSNotification.Name("photoSelected"), object: nil)
    }
    
    func autoLayout() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    func naviSetting() {
        let naviTitleView = UIImageView(image: UIImage(named: AppImageData.logo))
        naviTitleView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = naviTitleView
        self.navigationItem.setLeftBarButton(UIBarButtonItem(image: UIImage(named: AppImageData.camera), style: .plain, target: self, action: #selector(cameraButtonDidTap(_:))), animated: true)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: nil, style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem?.tintColor = .black
    }
    
    func tableViewRegister() {
        tableView.register(UINib(nibName: "FeedTableViewCell", bundle: nil), forCellReuseIdentifier: "feed")
    }
    
    // MARK: - Action Method
    @objc private func photoSelected(_ sender: Notification) {
        guard let userInfo = sender.userInfo, let image = userInfo["image"] else { return }
        let addFeedViewController = AddFeedViewController()
        addFeedViewController.image = image as? UIImage
        
        navigationController?.pushViewController(addFeedViewController, animated: true)
    }
    
    @objc private func cameraButtonDidTap(_ sender: UIBarButtonItem) {
        picker.delegate = self
        picker.sourceType = .camera
        picker.modalPresentationStyle = .overFullScreen
        
        present(picker, animated: true)
    }
    
    @objc private func pushCommentVC(_ sender: Notification) {
        guard let userInfo = sender.userInfo, let optionalCell = userInfo["cell"], let cell = optionalCell as? UITableViewCell, let indexPath = tableView.indexPath(for: cell)
            else { return }
        let commentVC = CommentViewController()
        commentVC.feedData = feedDataArray[indexPath.row]
        show(commentVC, sender: nil)
    }
    
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "feed", for: indexPath) as! FeedTableViewCell
        cell.feedData = feedDataArray[indexPath.row]
        
        return cell
    }
    
    
}

extension HomeViewController: UITableViewDelegate {
    
}

extension HomeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let addFeedViewController = AddFeedViewController()
        addFeedViewController.image = info[.originalImage] as? UIImage
        navigationController?.pushViewController(addFeedViewController, animated: true)
        picker.dismiss(animated: false, completion: nil)
    }
}
