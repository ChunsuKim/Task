//
//  TableViewAccessoryType.swift
//  TableViewPractice
//
//  Created by 이봉원 on 10/04/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class TableViewAccessoryType: UIViewController {
  
  /***************************************************
   - 미리 정해진 동물의 이미지와 텍스트를 테이블뷰에 표현
   - 각 셀의 크기는 80
   - 셀을 선택하면 체크박스가 나타나고 다시 선택하면 체크표시가 해제되도록 구현
   
   도전 과제)
   테이블뷰의 각 셀을 위아래로 스크롤 했다가 다시 나타낼 때, 체크 표시가 기존에 했던 곳에 정확히 다시 나타나도록 구현
   ***************************************************/
  
  override var description: String {
    return "Task 2 - AccessoryType"
  }
  
  let animals = [
    "bear", "buffalo", "camel", "dog", "elephant",
    "koala", "llama", "panda", "lion", "horse",
    "guinea_pig", "koala", "whale_shark", "whale", "duck",
    "seagull", "black_swan", "peacock", "giraffe"
  ]
  
    var animalCell: [String : Bool] = [:]
    
  override func viewDidLoad() {
    super.viewDidLoad()
    
    for animal in animals {
        animalCell = [animal : false]
    }
    
    let tableView = UITableView(frame: view.frame)
    tableView.rowHeight = 80
    tableView.dataSource = self
    tableView.delegate = self
    view.addSubview(tableView)
    
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellId")
  }
}


extension TableViewAccessoryType: UITableViewDataSource {
    
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return animals.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
    
    // 텍스트 추가
    cell.textLabel?.text = animals[indexPath.row]
    // 이미지 추가
    cell.imageView?.image = UIImage(named: animals[indexPath.row])
    
    cell.accessoryType = .none
    // checkmark
    if let checked = animalCell[animals[indexPath.row]] {
        cell.accessoryType = checked ? .checkmark : .none
    }
    return cell
  }
}

// MARK: - Delegate 구현부
extension TableViewAccessoryType: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath?{
            animalCell[animals[indexPath.row]] = animalCell[animals[indexPath.row]] ?? false ? false : true
            tableView.cellForRow(at: indexPath)?.accessoryType = animalCell[animals[indexPath.row]] ?? false ? .checkmark : .none
        
        return indexPath
    }
}


    

