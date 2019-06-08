//
//  ViewController.swift
//  AlamofireExample
//
//  Created by Chunsu Kim on 07/06/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import Alamofire
import UIKit

class ViewController: UIViewController {
    
    let buttonGet = UIButton(type: .system)
    let buttonPost = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        autoLayout()
    }
    
    private func configure() {
        buttonGet.setTitle("get", for: .normal)
        buttonGet.addTarget(self, action: #selector(getButton(_:)), for: .touchUpInside)
        view.addSubview(buttonGet)
        
        buttonPost.setTitle("post", for: .normal)
        buttonPost.addTarget(self, action: #selector(postButton(_:)), for: .touchUpInside)
        view.addSubview(buttonPost)
    }
    
    private func autoLayout() {
        buttonGet.translatesAutoresizingMaskIntoConstraints = false
        buttonGet.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonGet.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        buttonPost.translatesAutoresizingMaskIntoConstraints = false
        buttonPost.topAnchor.constraint(equalTo: buttonGet.bottomAnchor, constant: 40).isActive = true
        buttonPost.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    @objc private func getButton(_ sender: UIButton) {
        let urlString = "https://jsonplaceholder.typicode.com/todos"
        let req = AF.request(urlString)
        
        req
            .validate()
            .responseJSON { response in
//                if case let .success(value) = response.result {
//                    print(value)
//                }
            switch response.result {
            case .success(let value):
                print(value)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    @objc private func postButton(_ sender: UIButton) {
        let urlString = "https://jsonplaceholder.typicode.com/todos"
        
        let params: Parameters = [
            "title": "MyTitle",
            "userId": 1,
        ]
        
        let req = AF.request(urlString, method: .post, parameters: params)
        
        req
            .validate()
            .responseJSON { (response) in
                switch response.result {
                case .success(let value):
                    print(value)
                case .failure(let error):
                    print(error.localizedDescription)
                }
//            print(try? response.result.get())
        }
    }


}

