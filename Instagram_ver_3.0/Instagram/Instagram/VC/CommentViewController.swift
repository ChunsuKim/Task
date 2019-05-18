//
//  CommentViewController.swift
//  Instagram
//
//  Created by Wi on 23/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

// HomeVC에서 보여주는 FeedData에서 댓글 버튼을 누르면 나올 컨트롤러입니다.
// 각각의 FeedData 에 각각의 댓글을 보여줍니다.
// 이모티콘 버튼은 선택사항입니다.

class CommentViewController: UIViewController, UITableViewDataSource {
    
    var tableView = UITableView()
    var feedData: FeedData?
    var inputTextView = InputCommentView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(addComment), name: NSNotification.Name("addCommentDidTap"), object: nil)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func configure() {
        naviSetting()
        keyboardSetting()
        autoLayout()
        
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CommentTableViewCell", bundle: nil), forCellReuseIdentifier: "comment")
        
        view.addSubview(tableView)
        view.addSubview(inputTextView)
    }
    
    func naviSetting() {
        self.navigationItem.title = "댓글"
    }
    
    func keyboardSetting() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIApplication.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIApplication.keyboardWillShowNotification, object: nil)
    }
    
    func autoLayout() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        inputTextView.translatesAutoresizingMaskIntoConstraints = false
        inputTextView.topAnchor.constraint(equalTo: self.tableView.bottomAnchor).isActive = true
        inputTextView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        inputTextView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        inputTextView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        inputTextView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.25).isActive = true
    }
    
    @objc private func addComment() {
        feedData?.comment?.append(inputTextView.textField.text!)
        tableView.reloadData()
    }
    
    @objc private func keyboardWillHide(_ sender: Notification) {
        self.view.frame.origin.y = 0
    }
    
    @objc private func keyboardWillShow(_ sender: Notification) {
        self.view.frame.origin.y = -250
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.inputTextView.textField.resignFirstResponder()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedData?.comment?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "comment", for: indexPath) as! CommentTableViewCell
        cell.feedNickNameLabel.text = feedData?.nickName
        cell.feedImageView.image = feedData?.feedImage
        cell.feedComment.text = feedData?.comment?[indexPath.row]
        
        return cell
    }
}
