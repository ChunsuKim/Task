//
//  WishListViewController.swift
//  DominoPizza
//
//  Created by Chunsu Kim on 29/04/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

final class WishListViewController: UIViewController {
    
    var tableView = UITableView()
    var selectedPizzas = [String]()
    var totalPrice = Int()
    var pizzas = ItemManager.shared.items
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        autoLayout()
        setupButtons()
        tabBarController?.delegate = self
        tableView.dataSource = self
    }
    
    @objc func reset() {
        ItemManager.shared.countDict = [:]
        selectedPizzas = []
        tableView.reloadData()
        totalPrice = 0
    }
    
    func alertController() {
        
        var message = ""
        for pizza in pizzas {
            for selectedPizza in selectedPizzas {
                if (pizza.imageName == selectedPizza) {
                    guard let count = ItemManager.shared.countDict[selectedPizza] else { return }
                    totalPrice += pizza.price * count
                }
            }
        }
        for pizza in selectedPizzas {
            message = message + pizza + " - " + "\(ItemManager.shared.countDict[pizza] ?? 0) 개\n"
        }
        
        
        let alert = UIAlertController(title: "결제내역", message: "\(message) 결제금액: \(totalPrice)", preferredStyle: .alert)
        
        let back = UIAlertAction(title: "돌아가기", style: .default)
        let order = UIAlertAction(title: "주문", style: .default, handler: {(alert: UIAlertAction!) in self.reset()})
        
        alert.addAction(back)
        alert.addAction(order)
        self.present(alert, animated: true)
    }
    
    @objc func barButtonItems(_ sender: UIBarButtonItem) {
        switch sender.tag {
        case 1:
            reset()
            
        case 2:
            alertController()
            
        default:
            return
        }
        
        tableView.reloadData()
        totalPrice = 0
    }
    
    func setupButtons() {
        let leftButton = UIBarButtonItem(title: "목록 지우기", style: .done, target: self, action: #selector(barButtonItems(_:)))
        let rightButton = UIBarButtonItem(title: "주문", style: .done, target: self, action: #selector(barButtonItems(_:)))
        
        leftButton.tag = 1
        rightButton.tag = 2
        
        self.navigationItem.setLeftBarButton(leftButton, animated: true)
        self.navigationItem.setRightBarButton(rightButton, animated: true)
    }
    
    func configure() {
        
        self.title = "Wish List"
        tableView.rowHeight = 100
        view.addSubview(tableView)
    }
    
    func autoLayout() {
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
}

extension WishListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedPizzas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") ?? UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        cell.textLabel?.text = selectedPizzas[indexPath.row]
        cell.detailTextLabel?.text = "주문수량: \(ItemManager.shared.countDict[selectedPizzas[indexPath.row]] ?? 0)"
        cell.imageView?.image = UIImage(named: selectedPizzas[indexPath.row])
        cell.accessoryType = .none
        
        return cell
        
    }
}

extension WishListViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        guard let lastVC = viewController.children.last as? DetailViewController else { return }
    
    lastVC.countLabel.text = "\(ItemManager.shared.countDict[lastVC.title!] ?? 0) 개"
    }
}
