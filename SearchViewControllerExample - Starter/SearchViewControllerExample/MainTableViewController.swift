//
//  MainTableViewController.swift
//  SearchViewControllerExample
//
//  Created by Wi on 11/05/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    var menudatas = menuData
    var filteredMenudatas = [Product]()
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pizza Search"
        
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        
        searchController.searchBar.placeholder = "Search Menu"
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.scopeButtonTitles = ["All", "슈퍼시드", "클래식", "프리미엄", "사이드", "음료", "피클소스"]
        
        menudatas.forEach{
            filteredMenudatas += $0.menu
        }
        
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredMenudatas.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        
        if let reuableCell = tableView.dequeueReusableCell(withIdentifier: "cell") {
            cell = reuableCell
        } else {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        }
        cell.textLabel?.text = filteredMenudatas[indexPath.row].name
        
        cell.detailTextLabel?.text = String(filteredMenudatas[indexPath.row].price)
        
        return cell
    }

    
    
    // MARK: - For Search method
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        
        filteredMenudatas = []
        menudatas.forEach{
            let doesCategoryMatch = ($0.category == scope) || (scope == "All")
            if searchBarIsEmpty() {
                filteredMenudatas += $0.menu.filter{ _ in doesCategoryMatch}
            } else {
                filteredMenudatas += $0.menu.filter{doesCategoryMatch && $0.name.contains(searchText)}
            }
        }
        
//        if searchBarIsEmpty() && searchController.searchBar.selectedScopeButtonIndex != 0 {
//            print("1")
//            menudatas.forEach{
//                if $0.category == scope {
//                    filteredMenudatas = $0.menu
//                }
//            }
//        } else if searchBarIsEmpty() && searchController.searchBar.selectedScopeButtonIndex == 0 {
//            print("2")
//            menudatas.forEach{
//                filteredMenudatas += $0.menu
//            }
//        } else if !searchBarIsEmpty() && searchController.searchBar.selectedScopeButtonIndex == 0 {
//            print("3")
//            menudatas.forEach{
//                filteredMenudatas += $0.menu.filter{$0.name.contains(searchText)}
//            }
//        } else {
//            print("4")
//            filteredMenudatas = menudatas.filter{$0.category == scope}.map{
//                $0.menu.filter{$0.name.contains(searchText)}
//            }.reduce([], +)
//        }
        
        tableView.reloadData()
    }
    
    func searchBarIsEmpty() -> Bool {
        
        return searchController.searchBar.text?.isEmpty ?? true
    }
}

extension MainTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
        let searchBar = searchController.searchBar
        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        filterContentForSearchText(searchController.searchBar.text!, scope: scope)
    }
}

extension MainTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        
        filterContentForSearchText(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
    }
}

