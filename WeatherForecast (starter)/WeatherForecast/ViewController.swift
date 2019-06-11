//
//  ViewController.swift
//  WeatherForecast
//
//  Created by giftbot on 11/06/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let backgroundImageView = UIImageView()
    let dimmingView = UIView()
    let headerView = UIView()
    let headerViewLabel = UILabel()
    let detailTableView = UITableView()
    // 소수점이 0이면 출력하지 않고 소수점이 존재하면 1자리만 출력
    let tempFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 1
        
        return formatter
    }()
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "Ko_kr")
        return formatter
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        autoLayout()
        
        WeatherDataSource.shared.fetchSummary(lat: 37.498206, lon: 127.02761) {
            [weak self] in
            self?.detailTableView.reloadData()
        }
        
        WeatherDataSource.shared.fetchForecast(lat: 37.498206, lon: 127.02761) {
            [weak self] in
            self?.detailTableView.reloadData()
        }
    }
    
    private func configure() {
        backgroundImageView.image = UIImage(named: "sunny")
        headerView.backgroundColor = .clear
        headerViewLabel.textColor = .white
        headerViewLabel.font = UIFont.systemFont(ofSize: 20)
        headerViewLabel.textAlignment = .center
        headerViewLabel.text = "Label"
        dimmingView.backgroundColor = .black
        dimmingView.backgroundColor = UIColor.white.withAlphaComponent(0.4)
        
//        detailTableView.rowHeight = 180
//        detailTableView.rowHeight = 80
        detailTableView.dataSource = self
        detailTableView.separatorStyle = .none
        detailTableView.allowsSelection = false
        detailTableView.register(DetailHeaderTableViewCell.self, forCellReuseIdentifier: DetailHeaderTableViewCell.identifier)
        detailTableView.register(DetailTableViewCell.self, forCellReuseIdentifier: DetailTableViewCell.identifier)

        view.addSubview(backgroundImageView)
        backgroundImageView.addSubview(dimmingView)
        backgroundImageView.addSubview(headerView)
        headerView.addSubview(headerViewLabel)
        backgroundImageView.addSubview(detailTableView)
    }

    private func autoLayout() {
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        headerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        headerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        headerView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        headerViewLabel.translatesAutoresizingMaskIntoConstraints = false
        headerViewLabel.topAnchor.constraint(equalTo: headerView.topAnchor).isActive = true
        headerViewLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor).isActive = true
        headerViewLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor).isActive = true
        headerViewLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
        
        detailTableView.translatesAutoresizingMaskIntoConstraints = false
        detailTableView.topAnchor.constraint(equalTo: headerViewLabel.bottomAnchor).isActive = true
        detailTableView.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor).isActive = true
        detailTableView.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor).isActive = true
        detailTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        dimmingView.translatesAutoresizingMaskIntoConstraints = false
        dimmingView.centerXAnchor.constraint(equalTo: backgroundImageView.centerXAnchor).isActive = true
        dimmingView.centerYAnchor.constraint(equalTo: backgroundImageView.centerYAnchor).isActive = true
        dimmingView.widthAnchor.constraint(equalTo: backgroundImageView.widthAnchor).isActive = true
        dimmingView.heightAnchor.constraint(equalTo: backgroundImageView.heightAnchor).isActive = true
    }
    

}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return WeatherDataSource.shared.forecastList.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: DetailHeaderTableViewCell.identifier, for: indexPath) as! DetailHeaderTableViewCell
            
            if let data = WeatherDataSource.shared.summary?.weather.minutely.first {
                cell.headerCellWeatherImageView.image = UIImage(named: data.sky.code)
                cell.headerCellStatusLabel.text = data.sky.name
                
                let max = Double(data.temperature.tmax) ?? 0.0
                let min = Double(data.temperature.tmin) ?? 0.0
                
                let maxStr = tempFormatter.string(for: max) ?? "-"
                let minStr = tempFormatter.string(for: min) ?? "-"
                
                cell.headerCellMaxMintempLabel.text = "최대 \(maxStr)º 최소 \(minStr)º"
                
                let current = Double(data.temperature.tc) ?? 0.0
                let currentStr = tempFormatter.string(for: current) ?? "-"
                
                cell.headerCellThermometerLabel.text = "\(currentStr)º"
            }
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.identifier, for: indexPath) as! DetailTableViewCell
        
        let target = WeatherDataSource.shared.forecastList[indexPath.row]
        
        dateFormatter.dateFormat = "M.d (E)"
        cell.dateLabel.text = dateFormatter.string(for: target.date)
        
        dateFormatter.dateFormat = "HH:00"
        cell.timeLabel.text = dateFormatter.string(for: target.date)
        
        cell.weatherImageView.image = UIImage(named: target.skyCode)
        
        cell.statusLabel.text = target.skyName
        
        let tempStr = tempFormatter.string(for: target.temperature) ?? "-"
        cell.thermometerLabel.text = "\(tempStr)º"
        
        return cell
    }
    
    
}
