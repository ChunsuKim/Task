//
//  WishListViewController.swift
//  DominoPizza
//
//  Created by Chunsu Kim on 29/04/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class WishListViewController: UIViewController {
    
    let tableView = UITableView()
    var shared = Singleton.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Wish List"
        
        navigationSetting()
        configure()
        autoLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        tableView.reloadData()
    }
    
    private func navigationSetting() {
        let resetBarButton = UIBarButtonItem(title: "목록 지우기", style: .done, target: self, action: #selector(navigationBarButtonAction(_:)))
        resetBarButton.tag = 0
        navigationItem.leftBarButtonItem = resetBarButton
        
        let orderBarbutton = UIBarButtonItem(title: "주문", style: .done, target: self, action: #selector(navigationBarButtonAction(_:)))
        orderBarbutton.tag = 1
        navigationItem.rightBarButtonItem = orderBarbutton
    }
    
    @objc private func navigationBarButtonAction(_ sender: UIBarButtonItem) {
        switch sender.tag {
        case 0:
            shared.wishListDict = [:]
            tableView.reloadData()
        case 1:
            let keys = shared.wishListDict.keys.sorted()
            var temp = ""
            var sum = 0
            for key in keys {
                for category in menuDatas {
                    for product in category.products {
                        if product.name == key {
                            temp += "\(key) - \(shared.wishListDict[key]!)개 \n"
                            sum += (shared.wishListDict[key]! * product.price)
                        }
                    }
                }
            }
            temp += "결제금액 : \(sum)원"
            alertAction(title: "결제내역", message: temp)
        default:
            break
        }
    }
    
    func alertAction(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "결제하기", style: .default) {_ in
            self.shared.wishListDict = [:]
            self.tableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "돌아가기", style: .cancel, handler: nil)
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    
    private func configure() {
        tableView.dataSource = self
        tableView.rowHeight = 100
        view.addSubview(tableView)
    }
    
    private func autoLayout() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
}

extension WishListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shared.wishListDict.keys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let keys = shared.wishListDict.keys.sorted()
        
        let cell: UITableViewCell
        if let reusableCell = tableView.dequeueReusableCell(withIdentifier: "cell") {
            cell = reusableCell
        } else {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        }
        
        cell.imageView?.image = UIImage(named: keys[indexPath.row])
        cell.textLabel?.text = keys[indexPath.row]
        cell.detailTextLabel?.text = "주문수량 : \(shared.wishListDict[keys[indexPath.row]]!)"
        cell.selectionStyle = .none
        
        return cell
    }
}
