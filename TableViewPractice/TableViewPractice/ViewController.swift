//
//  ViewController.swift
//  TableViewPractice
//
//  Created by Chunsu Kim on 15/04/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    let tableView = UITableView()
    var data = Array(1...50)

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.frame = view.frame
        tableView.dataSource = self
        tableView.rowHeight = 60
        view.addSubview(tableView)
        
        tableView.register(CustomCell.self, forCellReuseIdentifier: "CustomCell")
        
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        
        // 1) delegate
        cell.delegate = self
//        cell.button.tag = indexPath.row
        
        
        cell.textLabel?.text = "\(data[indexPath.row])"
        return cell
    }
}

extension ViewController: CustomCellDelegate {
    func customCell(_ customCell: CustomCell, didTapButton: UIButton) {
        if let indexPath = tableView.indexPath(for: customCell) {
            let addedNumber = data[indexPath.row] + 1
            data[indexPath.row] = addedNumber
            customCell.textLabel?.text = "\(addedNumber)"
        }
    }
}
