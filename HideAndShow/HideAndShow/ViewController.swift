//
//  ViewController.swift
//  HideAndShow
//
//  Created by Chunsu Kim on 21/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let testTableView = UITableView()
    private var tableViewCell = TableViewCell()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        configureConstraints()
    }
    
    private func configureTableView() {
        testTableView.dataSource = self
        testTableView.delegate = self
        testTableView.estimatedRowHeight = 50
        testTableView.rowHeight = UITableView.automaticDimension
        testTableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        
        view.addSubview(testTableView)
    }
    
    private func configureConstraints() {
        
        testTableView.translatesAutoresizingMaskIntoConstraints = false
        testTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        testTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        testTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        testTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 17
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = testTableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
        
        cell.popInputData(numberOne: numberOne, numberTwo: numberTwo, numberThree: numberThree, numberFour: numberFour, numberFive: numberFive)
        
        return cell
    }
    
    
}


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("select")
        if indexPath.row == 3 {
            if let cell = testTableView.cellForRow(at: indexPath) as? TableViewCell {
                
                cell.popDownButton.isSelected.toggle()
                
                if cell.popDownButton.isSelected {
                    UIView.animate(withDuration: 0.3) {
                        cell.isSelectedHiddenViewState(state: false)
                        cell.popBackgroundViewBottomPriority?.isActive = false
                        self.testTableView.reloadData()
//                        self.testTableView.beginUpdates()
//                        self.testTableView.endUpdates()
                    }
                } else {
                    UIView.animate(withDuration: 0.3) {
                        cell.popBackgroundViewBottomPriority?.isActive = true
                        cell.isSelectedHiddenViewState(state: true)
                        self.testTableView.reloadData()
//                        self.testTableView.beginUpdates()
//                        self.testTableView.endUpdates()
                    }
                }
            }
            
        }
    }
}
