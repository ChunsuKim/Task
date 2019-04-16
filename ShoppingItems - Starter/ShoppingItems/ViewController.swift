//
//  ViewController.swift
//  ShoppingItems
//
//  Created by giftbot on 2019. 4. 10..
//  Copyright © 2019년 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
  
    // MARK: - Properties
  @IBOutlet private weak var tableView: UITableView!
    
    let images = ["iPhone8", "iPhoneSE_Gold", "iPhoneSE_RoseGold", "iPhoneX_SpaceGray", "iPhoneX_White"]
    var item: [String] = []
    var salePhones: [Int] = []
    var quantityMax: [Int] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    for qty in 1...15 {
        item.append("List\(qty) : iPhone")
        quantityMax.append((3...5).randomElement()!)
        salePhones.append(0)
    }
    
    tableView.register(ItemCell.self, forCellReuseIdentifier: "Custom")
    tableView.rowHeight = 60
    tableView.dataSource = self
    view.addSubview((tableView))
    
  }
    
    
    // MARK: - AlertController
    func alert() {
        let alert = UIAlertController(title: "수량 초과", message: "선택하신 수량이 너무 많습니다.", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(ok)
        
        present(alert, animated: true)
    }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return salePhones.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Custom", for: indexPath) as! ItemCell
    
    cell.detailCell(images[indexPath.row % 5], item[indexPath.row], counting: "\(salePhones[indexPath.row])", stockMax: quantityMax[indexPath.row])
    cell.delegate = self
    
    return cell
  }
}

// MARK: - Delegate
extension ViewController: PhoneStoreDelegate {
    
    func salesPhone(_ cell: ItemCell, _ seller: UILabel) {
        if let indexPath = tableView.indexPath(for: cell) {
            
            guard cell.quantityMax >= salePhones[indexPath.row] + 1 else {
                cell.backgroundColor = .red
                UIView.animate(withDuration: 1) {
                    cell.backgroundColor = .white
                }
                self.alert()
                return
            }
            
            salePhones[indexPath.row] += 1
            cell.quantity.text = "\(salePhones[indexPath.row])"
        }
    }
}
