//
//  ViewController.swift
//  DominoPizza
//
//  Created by Chunsu Kim on 29/04/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

final class CategoryViewController: UIViewController {
    
    private let itemManager = ItemManager()
    private lazy var items: [MenuList] = itemManager.items
    
    let headerView = UIImageView()
    let tableView = UITableView()
    let productVC = ProductViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: "List")
        view.addSubview(tableView)
        
        let header = UIImageView(image: UIImage(named: "logo"))
        header.contentMode = .scaleAspectFit
        header.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 200)
        header.backgroundColor = .white
        tableView.tableHeaderView = header
        tableView.rowHeight = 100
        
        self.title = "Domino`s"
        
        autoLayout()
    }
    
    func autoLayout() {
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
    }
    
    
    
}

extension CategoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemManager.categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "List", for: indexPath) as! CategoryTableViewCell
        cell.categoryMenuImage.image = UIImage(named: itemManager.categories[indexPath.row])
        
        return cell
    }
    
}

extension CategoryViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        productVC.title = itemManager.categories[indexPath.row]
        
        navigationController?.pushViewController(productVC, animated: true)
    }
}


