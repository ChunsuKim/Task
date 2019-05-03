//
//  ProductViewController.swift
//  DominoPizza
//
//  Created by Chunsu Kim on 29/04/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

final class ProductViewController: UIViewController {
    
    var pizzas = ItemManager.shared.items
    var productItem: [MenuList] = []
    var tableView = UITableView()
    let detailVC = DetailViewController()
    
    // FIXME: - something wrong
    func findProduct() {
        for pizza in pizzas {
            if (pizza.title == self.title) {
                productItem.append(pizza)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
        configure()
    }
    
    func configure() {
        
        view.addSubview(tableView)
        tableView.rowHeight = 120
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
}


extension ProductViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         print(productItem.count)
        return productItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId") ?? UITableViewCell(style: .subtitle, reuseIdentifier: "CellId")
        cell.textLabel?.text = "\(productItem[indexPath.row].imageName)"
        cell.detailTextLabel?.text = "\(productItem[indexPath.row].price)원"
        cell.imageView?.image = UIImage(named: productItem[indexPath.row].imageName)
        cell.accessoryType = .none
        
        return cell
    }
}

extension ProductViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        detailVC.title = productItem[indexPath.row].imageName
        detailVC.imageView.image = UIImage(named: productItem[indexPath.row].imageName)
        if ((ItemManager.shared.countDict[productItem[indexPath.row].imageName]) == nil) {
            ItemManager.shared.countDict.updateValue(0, forKey: productItem[indexPath.row].imageName)
        }
        detailVC.countLabel.text = "\(ItemManager.shared.countDict[productItem[indexPath.row].imageName] ?? 0) 개"
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
}


extension ProductViewController: CategoryViewControllerDelegate {
    func reset() {
        productItem = []
        findProduct()
        tableView.reloadData()
    }
    
}
