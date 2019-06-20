//
//  ViewController.swift
//  WeatherXML
//
//  Created by Chunsu Kim on 19/06/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var dataList: [[String: String]] = [] {
        didSet{
            weatherTableView.reloadData()
        }
    }
    var detailData: [String: String] = [:]  
    var elementTemp: String = ""
    var blank: Bool = false
    let weatherTableView = UITableView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        xmlParser?.delegate = self
        xmlParser?.parse()
        
        configureUserInterface()
        configureConstraints()
    }
    
    private func configureUserInterface() {
        weatherTableView.dataSource = self
        weatherTableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        view.addSubview(weatherTableView)
    }
    
    private func configureConstraints() {
        weatherTableView.translatesAutoresizingMaskIntoConstraints = false
        weatherTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        weatherTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        weatherTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        weatherTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

extension ViewController: XMLParserDelegate {
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        elementTemp = elementName
        blank = true
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
        if blank == true && elementTemp != "local" && elementTemp != "weatherinfo" {
            detailData[elementTemp] = string
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        if elementName == "local" {
            dataList += [detailData]
            print(detailData)
            
        }
        blank = false
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
        
        var dicTemp = dataList[indexPath.row]
        cell.countryLabel.text = dicTemp["country"]
        
        let weatherStr = dicTemp["weather"]
        cell.weatherLabel.text = weatherStr
        cell.temperatureLabel.text = dicTemp["temperature"]
        
        if weatherStr == "맑음" {
            cell.weatherImageView.image = UIImage(named: "sunny")
        } else if weatherStr == "비" {
            cell.weatherImageView.image = UIImage(named: "rainy")
        } else if weatherStr == "흐림" {
            cell.weatherImageView.image = UIImage(named: "cloudy")
        } else if weatherStr == "눈" {
            cell.weatherImageView.image = UIImage(named: "snow")
        } else {
            cell.weatherImageView.image = UIImage(named: "blizzard")
        }
        
        return cell
    }
    
    
}
