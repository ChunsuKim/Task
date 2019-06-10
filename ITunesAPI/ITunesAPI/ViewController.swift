//
//  MainTableViewController.swift
//  ITunesAPI
//
//  Created by Chunsu Kim on 08/06/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import Alamofire
import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    private let iTunesSearchTableView = UITableView()
    private var url = "https://itunes.apple.com/search?media=music&entity=song&term=*"
    var urlMusicData: [Song] = []
    let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
        autoLayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getData()
    }
    
    // MARK: - Setting Method
    private func configure() {
        iTunesSearchTableView.register(ITunesTableViewCell.self, forCellReuseIdentifier: ITunesTableViewCell.identifier)
        iTunesSearchTableView.dataSource = self
        iTunesSearchTableView.rowHeight = 80
        
        searchController.searchBar.delegate = self
        searchController.searchBar.sizeToFit()
        navigationItem.searchController = searchController
        
        searchController.searchBar.placeholder = "Search Music"
        searchController.obscuresBackgroundDuringPresentation = false
        
        view.addSubview(iTunesSearchTableView)
    }
    
    private func autoLayout() {
        iTunesSearchTableView.translatesAutoresizingMaskIntoConstraints = false
        iTunesSearchTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        iTunesSearchTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        iTunesSearchTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        iTunesSearchTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    // MARK: - Data handling Method
    private func getData() {
        let req = AF.request(url)
        req
            .validate()
            .responseData { response in
                switch response.result {
                case .success(let data):
                    do {
                        let musicData = try JSONDecoder().decode(ITunes.self, from: data)
                        self.urlMusicData = musicData.results
                        DispatchQueue.main.async {
                            self.iTunesSearchTableView.reloadData()
                        }
                    } catch {
                        print(error.localizedDescription)
                    }
                case .failure(let error):
                    print(error)
                }
        }
    }
}

// MARK: - Table view data source
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return urlMusicData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ITunesTableViewCell.identifier, for: indexPath) as! ITunesTableViewCell
        let urlString = urlMusicData[indexPath.row].artworkUrl100
        let url = URL(string: urlString)!
        let req = AF.request(url)
        req.validate().responseData { response in
            switch response.result {
            case .success(let data):
                cell.musicImageView.image = UIImage(data: data)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        cell.artistNameLabel.text = urlMusicData[indexPath.row].artistName
        cell.musicNameLabel.text = urlMusicData[indexPath.row].trackName
        
        return cell
    }
}

// MARK: - Search bar delegate
extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        print("스코프가 눌렸음")
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }
        url = "https://itunes.apple.com/search?media=music&entity=song&term=" + text
        getData()
    }
}
