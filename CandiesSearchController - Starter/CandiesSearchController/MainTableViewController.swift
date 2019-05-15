//
//  MainTableViewController.swift
//  CandiesSearchController
//
//  Created by Wi on 13/05/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    var candies = [Candy]()
    var filteredCandies = [Candy]() // 검색된 것들을 넣기 위한 배열
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup Basic SearchController Setting
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        
        // Setup other SearchController Setting
        searchController.searchBar.placeholder = "Search Candy"
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.scopeButtonTitles = ["All", "Chocolate", "Hard", "Other"]
        
        candies =  [
            Candy(category:"Chocolate", name:"Chocolate Bar"),
            Candy(category:"Chocolate", name:"Chocolate Chip"),
            Candy(category:"Chocolate", name:"Dark Chocolate"),
            Candy(category:"Hard", name:"Lollipop"),
            Candy(category:"Hard", name:"Candy Cane"),
            Candy(category:"Hard", name:"Jaw Breaker"),
            Candy(category:"Other", name:"Caramel"),
            Candy(category:"Other", name:"Sour Chew"),
            Candy(category:"Other", name:"Gummi Bear"),
            Candy(category:"Other", name:"Candy Floss"),
            Candy(category:"Chocolate", name:"Chocolate Coin"),
            Candy(category:"Chocolate", name:"Chocolate Egg"),
            Candy(category:"Other", name:"Jelly Beans"),
            Candy(category:"Other", name:"Liquorice"),
            Candy(category:"Hard", name:"Toffee Apple")]

        filteredCandies = candies
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filteredCandies.count
//        return candies.count // * 바뀐 부분
        
        }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        if let reuableCell = tableView.dequeueReusableCell(withIdentifier: "cell") {
            cell = reuableCell
        } else {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        }
        cell.textLabel?.text = filteredCandies[indexPath.row].name
        cell.detailTextLabel?.text = filteredCandies[indexPath.row].category
//        cell.textLabel?.text = candies[indexPath.row].name
//        cell.detailTextLabel?.text = candies[indexPath.row].category
        return cell
        
    }
    
    
    // MARK: - For Search method
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        
        filteredCandies = candies.filter{
            let doesCategoryMatch = (scope == "All") || ($0.category == scope)
            if searchBarIsEmpty() {
                return doesCategoryMatch
            } else {
                return doesCategoryMatch && $0.name.lowercased().contains(searchText.lowercased())
            }
        }
        tableView.reloadData()
        
//        if searchBarIsEmpty() {
//            filteredCandies = candies
//        } else {
//            filteredCandies = candies.filter{
//                $0.name.contains(searchText)
//            }
//        }
//        tableView.reloadData()
    }
    
    func searchBarIsEmpty() -> Bool {
        // searchBar의 text의 유무를 반환하고 만약 nil 이라면 true 반환
        
        return searchController.searchBar.text?.isEmpty ?? true
    }
    

}

extension MainTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        print("검색중")
        
        let searchBar = searchController.searchBar
        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        filterContentForSearchText(searchController.searchBar.text!, scope: scope)
    }
}

extension MainTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        print("스코프가 눌렸음")
        
        filterContentForSearchText(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
    }
}
