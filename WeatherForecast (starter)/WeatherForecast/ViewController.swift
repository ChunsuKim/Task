//
//  ViewController.swift
//  WeatherForecast
//
//  Created by giftbot on 11/06/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit
import CoreLocation


class ViewController: UIViewController {
    
    
    let backgroundImageView = UIImageView()
    let dimmingView = UIView()
    let headerView = UIView()
    let headerViewLocationLabel = UILabel()
    let detailTableView = UITableView()
    var topInset: CGFloat = 0.0
    
    lazy var locationManager: CLLocationManager = {
       let m = CLLocationManager()
        m.delegate = self
        return m
    }()
    
    
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
        
//        WeatherDataSource.shared.fetchSummary(lat: 37.498206, lon: 127.02761) {
//            [weak self] in
//            self?.detailTableView.reloadData()
//        }
//
//        WeatherDataSource.shared.fetchForecast(lat: 37.498206, lon: 127.02761) {
//            [weak self] in
//            self?.detailTableView.reloadData()
//        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        headerViewLocationLabel.text = "Updating..."
        
        if CLLocationManager.locationServicesEnabled() {
            switch CLLocationManager.authorizationStatus() {
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
            case .authorizedWhenInUse, .authorizedAlways:
                updateCurrentLocation()
            case .denied, .restricted:
                show(message: "위치 서비스 사용 불가")
            }
        } else {
            show(message: "위치 서비스 사용 불가")
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if topInset == 0.0 {
            let first = IndexPath(row: 0, section: 0)
            if let cell = detailTableView.cellForRow(at: first) {
                topInset = detailTableView.frame.height - cell.frame.height
                detailTableView.contentInset = UIEdgeInsets(top: topInset, left: 0, bottom: 0, right: 0)
            }
        }
    }
    
    private func configure() {
        backgroundImageView.image = UIImage(named: "sunny")
        headerView.backgroundColor = .clear
        headerViewLocationLabel.textColor = .white
        headerViewLocationLabel.font = UIFont.systemFont(ofSize: 20)
        headerViewLocationLabel.textAlignment = .center
        headerViewLocationLabel.text = "Label"
        dimmingView.backgroundColor = .black
        dimmingView.backgroundColor = UIColor.white.withAlphaComponent(0.4)
        
//        detailTableView.rowHeight = 180
//        detailTableView.rowHeight = 80
        detailTableView.dataSource = self
        detailTableView.separatorStyle = .none
        detailTableView.allowsSelection = false
        detailTableView.showsVerticalScrollIndicator = false
        detailTableView.backgroundColor = UIColor.clear
        detailTableView.register(DetailHeaderTableViewCell.self, forCellReuseIdentifier: DetailHeaderTableViewCell.identifier)
        detailTableView.register(DetailTableViewCell.self, forCellReuseIdentifier: DetailTableViewCell.identifier)

        view.addSubview(backgroundImageView)
        backgroundImageView.isUserInteractionEnabled = true
        backgroundImageView.addSubview(dimmingView)
        backgroundImageView.addSubview(headerView)
        headerView.addSubview(headerViewLocationLabel)
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
        
        headerViewLocationLabel.translatesAutoresizingMaskIntoConstraints = false
        headerViewLocationLabel.topAnchor.constraint(equalTo: headerView.topAnchor).isActive = true
        headerViewLocationLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor).isActive = true
        headerViewLocationLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor).isActive = true
        headerViewLocationLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
        
        detailTableView.translatesAutoresizingMaskIntoConstraints = false
        detailTableView.topAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
        detailTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        detailTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        detailTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        dimmingView.translatesAutoresizingMaskIntoConstraints = false
        dimmingView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        dimmingView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
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
                
                cell.headerCellMaxMintempLabel.text = "최대 \(maxStr)º   최소 \(minStr)º"
                
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

extension ViewController: CLLocationManagerDelegate {
    func updateCurrentLocation() {
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let loc = locations.first {
            print(loc.coordinate)
            
            let decoder = CLGeocoder()
            decoder.reverseGeocodeLocation(loc) { [weak self] (placemarks, error) in
                if let place = placemarks?.first {
                    if let gu = place.locality, let dong = place.subLocality {
                        self?.headerViewLocationLabel.text = "\(gu) \(dong)"
                    } else {
                        self?.headerViewLocationLabel.text = place.name
                    }
                }
            }
            
            WeatherDataSource.shared.fetch(location: loc) {
                self.detailTableView.reloadData()
            }
        }
        
        manager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        show(message: error.localizedDescription)
        manager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse, .authorizedAlways:
            updateCurrentLocation()
        default:
            break
        }
    }
}

extension UIViewController {
    func show(message: String) {
        let alert = UIAlertController(title: "알림", message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(ok)
        
        present(alert, animated: true, completion: nil)
    }
}
