//
//  CommentViewController.swift
//  Instagram
//
//  Created by Chunsu Kim on 24/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

class CommentViewController: UIViewController, UITextFieldDelegate {
    
    var feedData: FeedData?
    
    var inputTextView = InputCommentView()
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var commentArr = [String]()
    var commentTextField: UITextField? = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.commentTextField?.delegate = self
        self.tableView.dataSource = self
        
        tableView.frame = view.frame
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "comment")
        
        commentTextField?.text = ""
        
        setting()
        autoLayout()
        
        naviSetting()

        
    }
    
    func setting() {
        commentTextField?.font = UIFont.systemFont(ofSize: 20)
        commentTextField?.layer.cornerRadius = 20
        commentTextField?.textAlignment = .center
        commentTextField?.placeholder = "Typing Comment"
        
        view.addSubview(tableView)
        view.addSubview(commentTextField!)
    }
    
    func naviSetting() {
        self.navigationItem.title = "Comment"
    }
    
    func autoLayout() {
        commentTextField?.translatesAutoresizingMaskIntoConstraints = false
        
        commentTextField?.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        commentTextField?.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        commentTextField?.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5).isActive = true
        commentTextField?.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -5).isActive = true
        
        
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true

        tableView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7).isActive = true
    }
    
    @objc private func addComment() {
        
    }
    

    
    

}

extension CommentViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.commentArr.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "comment", for: indexPath)
    
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = commentArr[indexPath.row]
    
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.estimatedRowHeight = 20
        self.tableView.rowHeight = UITableView.automaticDimension
    }

}
